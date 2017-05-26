//
//  TempTableViewController.swift
//  Battery Main
//
//  Created by MAC on 5/23/17.
//  Copyright © 2017 example.com. All rights reserved.
//

import UIKit
import SystemServices

class GeneralTableViewController: UITableViewController {
    
    var isRentina: Bool {
        if (UIScreen.main.responds(to: #selector(UIScreen.displayLink(withTarget:selector:))) && UIScreen.main.scale == 2.0 ) {
            return true
        } else {
            return false
        }
    }
    
    @IBOutlet weak var aspectRatioLabel: UILabel!
    @IBOutlet weak var pixcelLabel: UILabel!
    @IBOutlet weak var retinaLabel: UILabel!
    @IBOutlet weak var screenSizeLabel: UILabel!
    @IBOutlet weak var screenSolutionLabel: UILabel!
    @IBOutlet weak var osVersionLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var deviceLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let windowRect = UIScreen.main.nativeBounds.size
        let windowWidth = Int(windowRect.width)
        let windowHeight = Int(windowRect.height)
        deviceLabel.text = SystemServices().systemDeviceTypeFormatted
        modelLabel.text = SystemServices().systemDeviceTypeFormatted
        osVersionLabel.text = SystemServices().systemsVersion
        screenSolutionLabel.text = String(describing: UIScreen.main.scale) + " x"
        screenSizeLabel.text = String(UIDevice.current.sizeDevice()) + "  inch"
        pixcelLabel.text = String(describing: windowHeight) + " : " + String(describing: windowWidth)
        if isRentina {
            retinaLabel.text = "YES"
        } else {
            retinaLabel.text = "NO"
        }
        
        if(Double(windowHeight)/Double(windowWidth) > 1.35) {
            aspectRatioLabel.text = "16 : 9"
        } else {
            aspectRatioLabel.text = "4 : 3"
        }
    }
    
    @IBAction func test(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func convertThreadInfoToThreadBasicInfo(_ threadInfo: thread_info_t) -> thread_basic_info {
        var result = thread_basic_info()
        
        result.user_time = time_value_t(seconds: threadInfo[0], microseconds: threadInfo[1])
        result.system_time = time_value_t(seconds: threadInfo[2], microseconds: threadInfo[3])
        result.cpu_usage = threadInfo[4]
        result.policy = threadInfo[5]
        result.run_state = threadInfo[6]
        result.flags = threadInfo[7]
        result.suspend_count = threadInfo[8]
        result.sleep_time = threadInfo[9]
        
        return result
    }
    
    func cpu_usage() -> Float {
        var kr: kern_return_t
        var tinfo = [integer_t]()
        var task_info_count: mach_msg_type_number_t
        
        task_info_count = mach_msg_type_number_t(TASK_INFO_MAX)
        
        kr = task_info(mach_task_self_, task_flavor_t(TASK_BASIC_INFO), &tinfo, &task_info_count)
        if (kr != KERN_SUCCESS) {
            return -1
        }
        
        var thread_list: thread_act_array_t? = UnsafeMutablePointer(mutating: [thread_act_t]())
        
        var thread_count: mach_msg_type_number_t = 0
        
        let thinfo: thread_info_t = UnsafeMutablePointer(mutating: [integer_t]())
        var thread_info_count: mach_msg_type_number_t
        
        kr = task_threads(mach_task_self_, &thread_list, &thread_count)
        
        if (kr != KERN_SUCCESS) {
            return -1
        }
        
        var tot_cpu: Float = 0
        
        if thread_list != nil {
            for j in 0 ..< Int(thread_count) {
                thread_info_count = mach_msg_type_number_t(THREAD_INFO_MAX)
                kr = thread_info(thread_list![j], thread_flavor_t(THREAD_BASIC_INFO),
                                 thinfo, &thread_info_count)
                if (kr != KERN_SUCCESS) {
                    return -1
                }
                
                let threadBasicInfo = convertThreadInfoToThreadBasicInfo(thinfo)
                
                if threadBasicInfo.flags != TH_FLAGS_IDLE {
                    tot_cpu = tot_cpu + (Float(threadBasicInfo.cpu_usage) / Float(TH_USAGE_SCALE)) * 100.0
                }
            } // for each thread
        }
        
        return tot_cpu
    }
}
