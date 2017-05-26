//
//  CpuInfoTableViewController.swift
//  Battery Main
//
//  Created by MAC on 5/25/17.
//  Copyright © 2017 example.com. All rights reserved.
//

import UIKit

class CpuInfoTableViewController: UITableViewController {

    
    @IBOutlet weak var cacheL2Label: UILabel!
    @IBOutlet weak var cachel1DLabel: UILabel!
    @IBOutlet weak var cache1ILabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    @IBOutlet weak var logicalCoreLabel: UILabel!
    @IBOutlet weak var physicCoreLabel: UILabel!
    @IBOutlet weak var architectureLabel: UILabel!
    @IBOutlet weak var cpuNameLabel: UILabel!
    
    @IBAction func cacel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cpuNameLabel.text = cpuForDeviceName[UIDevice.current.userDeviceName()]
        architectureLabel.text = EEIOKitListener.shared().getCPUType()
        if let _cpuName = detailCPU[(cpuForDeviceName[UIDevice.current.userDeviceName()]!)] {
            physicCoreLabel.text = _cpuName[0]
            logicalCoreLabel.text = _cpuName[0]
            frequencyLabel.text = _cpuName[1]
            cache1ILabel.text = _cpuName[2] + " KB"
            cachel1DLabel.text = _cpuName[3] + " KB"
            cacheL2Label.text = _cpuName[4] + " KB"
        }
//        
//        frequencyLabel.text = String(describing: detailCPU[cpuForDeviceName[UIDevice.current.userDeviceName()]!]?[1])
//        cache1ILabel.text = String(describing: detailCPU[cpuForDeviceName[UIDevice.current.userDeviceName()]!]?[2]) + " KB"
//        cachel1DLabel.text = String(describing: detailCPU[cpuForDeviceName[UIDevice.current.userDeviceName()]!]?[3]) + " KB"
//        cacheL2Label.text = String(describing: detailCPU[cpuForDeviceName[UIDevice.current.userDeviceName()]!]?[4]) + " KB"
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
}
