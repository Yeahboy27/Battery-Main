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
        self.tableView.alwaysBounceVertical = false
        self.tableView.delegate = self
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
        
        
        self.navigationController?.setNavigationBarHidden(false, animated:false)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white.withAlphaComponent(0.8)]
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
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor(hexString: "191919")?.withAlphaComponent(0.6)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont.systemFont(ofSize: 17)
        header.textLabel?.textColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    func popToRoot(sender:UIBarButtonItem){
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
}


