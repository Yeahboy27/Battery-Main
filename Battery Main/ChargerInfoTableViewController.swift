//
//  ChargerInfoTableViewController.swift
//  Battery Main
//
//  Created by MAC on 5/16/17.
//  Copyright © 2017 example.com. All rights reserved.
//

import UIKit

class ChargerInfoTableViewController: UITableViewController {

    var batteryState: UIDeviceBatteryState {
        return UIDevice.current.batteryState
    }
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var amperage: UILabel!
    @IBOutlet weak var power: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAdapterDetails()
        NotificationCenter.default.addObserver(self, selector: #selector(batteryStateDidChange), name: .UIDeviceBatteryStateDidChange, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    func batteryStateDidChange(_ notification: Notification) {
        switch batteryState {
        case .unplugged, .unknown:
            source.text = "Unkown"
            amperage.text = "0.00 mA"
            power.text = "0.00 W"
        case .charging, .full:
            updateAdapterDetails()
        }
    }
    
    func updateAdapterDetails() {
        if let _detailAdapter = EEIOKitListener.shared().sharePower {
            let detailAdapter = _detailAdapter as NSDictionary
            if let _source = detailAdapter["Description"] {
                source.text = String(describing: _source)
            }
            if let _amperage = detailAdapter["Amperage"] {
                amperage.text = String(describing: _amperage) + " mA"
            }
            if let _power = detailAdapter["Watts"] {
                power.text = String(describing: _power) + " W"
            }
        }
    }
}
