//
//  StorageTableViewController.swift
//  Battery Main
//
//  Created by MAC on 5/26/17.
//  Copyright © 2017 example.com. All rights reserved.
//

import UIKit
import SystemServices

class StorageTableViewController: UITableViewController {

    @IBAction func cacel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var usedLabel: UILabel!
    @IBOutlet weak var freeLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = SystemServices().diskSpace
        freeLabel.text = SystemServices().freeDiskSpaceinRaw
        usedLabel.text = SystemServices().usedDiskSpaceinRaw
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

}
