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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.alwaysBounceVertical = false
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
        
        self.navigationController?.setNavigationBarHidden(false, animated:false)
        let myBackButton:UIButton = UIButton.init(type: .custom)
        myBackButton.addTarget(self, action: #selector(self.popToRoot(sender:)), for: .touchUpInside)
        myBackButton.setImage(#imageLiteral(resourceName: "ic_back"), for: .normal)
        myBackButton.setTitle(" ", for: .normal)
        myBackButton.setTitleColor(.blue, for: .normal)
        myBackButton.sizeToFit()
        let myCustomBackButtonItem:UIBarButtonItem = UIBarButtonItem(customView: myBackButton)
        self.navigationItem.leftBarButtonItem  = myCustomBackButtonItem
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    func popToRoot(sender:UIBarButtonItem){
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
}
