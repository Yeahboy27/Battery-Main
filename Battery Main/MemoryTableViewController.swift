//
//  MemoryTableViewController.swift
//  Battery Main
//
//  Created by MAC on 5/26/17.
//  Copyright © 2017 example.com. All rights reserved.
//

import UIKit
import SystemServices

class MemoryTableViewController: UITableViewController {

    @IBAction func cacel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var freeLabel: UILabel!
    @IBOutlet weak var inactiveLabel: UILabel!
    @IBOutlet weak var activeLabel: UILabel!
    @IBOutlet weak var wiredLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    totalLabel.text = String(Int(SystemServices().totalMemory)) + " MB"
    wiredLabel.text = String(Int(SystemServices().wiredMemoryinRaw)) + " MB"
    activeLabel.text = String(Int(SystemServices().activeMemoryinRaw)) + " MB"
    inactiveLabel.text = String(Int(SystemServices().inactiveMemoryinRaw)) + " MB"
    freeLabel.text = String(Int(SystemServices().freeMemoryinRaw)) + " MB"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }


    

}
