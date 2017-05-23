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
        pixcelLabel.text = String(describing: windowWidth) + " : " + String(describing: windowHeight)
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
}
