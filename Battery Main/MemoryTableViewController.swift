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

    @IBOutlet weak var freeLabel: UILabel!
    @IBOutlet weak var inactiveLabel: UILabel!
    @IBOutlet weak var activeLabel: UILabel!
    @IBOutlet weak var wiredLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    self.tableView.alwaysBounceVertical = false
    totalLabel.text = String(Int(SystemServices().totalMemory)) + " MB"
    wiredLabel.text = String(Int(SystemServices().wiredMemoryinRaw)) + " MB"
    activeLabel.text = String(Int(SystemServices().activeMemoryinRaw)) + " MB"
    inactiveLabel.text = String(Int(SystemServices().inactiveMemoryinRaw)) + " MB"
    freeLabel.text = String(Int(SystemServices().freeMemoryinRaw)) + " MB"
        self.title = "Memory"
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
        return 5
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }

    func popToRoot(sender:UIBarButtonItem){
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor(hexString: "191919")?.withAlphaComponent(0.6)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.font = UIFont.systemFont(ofSize: 17)
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

}
