//
//  GpuInfoTableViewController.swift
//  Battery Main
//
//  Created by MAC on 5/26/17.
//  Copyright © 2017 example.com. All rights reserved.
//

import UIKit

class GpuInfoTableViewController: UITableViewController {

    @IBOutlet weak var openGLLabel: UILabel!
    @IBOutlet weak var gpuLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.alwaysBounceVertical = false
        openGLLabel.text = "OpenGL 2.0 GPU " + cpuForDeviceName[UIDevice.current.userDeviceName()]!
        gpuLabel.text = detailCPU[cpuForDeviceName[UIDevice.current.userDeviceName()]!]?[5]
        self.title = "GPU"
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
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0) {
            return 1
        } else {
            return 2
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            view.tintColor = UIColor(hexString: "191919")?.withAlphaComponent(0.6)
            let header = view as! UITableViewHeaderFooterView
            header.textLabel?.textColor = UIColor.white
            header.textLabel?.font = UIFont.systemFont(ofSize: 17)
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func popToRoot(sender:UIBarButtonItem){
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
}
extension UIColor {
    static func colorFormHex(hex: UInt32, alpha: CGFloat) -> UIColor{
        let div = CGFloat (255)
        let red = CGFloat ((hex & 0xFF0000) >> 16) / div
        let green = CGFloat((hex & 0x00FF00) >> 8) / div
        let blue  = CGFloat(hex & 0x0000FF)  / div
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
