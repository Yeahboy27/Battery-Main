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
    @IBAction func cacel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        openGLLabel.text = "OpenGL 2.0 GPU " + cpuForDeviceName[UIDevice.current.userDeviceName()]!
        gpuLabel.text = detailCPU[cpuForDeviceName[UIDevice.current.userDeviceName()]!]?[5]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(section == 0) {
            return 1
        } else {
            return 2
        }
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if(section == 0) {
//            return "GPU Information"
//        } else {
//            return "OpenGL Information"
//        }
//    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.contentView.backgroundColor = UIColor(hexString: "1F1F1F", alpha: 0.8)
        header.textLabel?.textColor = UIColor(hexString: "FFFFFF", alpha: 0.8)
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        header.textLabel?.frame = header.frame
        header.textLabel?.textAlignment = .left
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
