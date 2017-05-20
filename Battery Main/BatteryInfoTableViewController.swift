//
//  BatteryInfoTableViewController.swift
//  Battery Main
//
//  Created by MAC on 5/16/17.
//  Copyright © 2017 example.com. All rights reserved.
//

import UIKit

class BatteryInfoTableViewController: UITableViewController {
    var actualBattery: String = ""
    var capacity: Int = 0
    @IBOutlet weak var voltage: UILabel!
    @IBOutlet weak var batteryCharge: UILabel!
    @IBOutlet weak var currentCapacity: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let listener = EEIOKitListener.shared()
        listener?.start()
        NotificationCenter.default.addObserver(self, selector: #selector(self.ioKitDataUpdated), name: NSNotification.Name(rawValue: kEEIOKitListenerNewDataNotification), object: nil)
        listener?.requestDataRefresh()
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

    
    func ioKitDataUpdated() {
        if let draven = (EEIOKitListener.shared().chargerDict! as NSDictionary)["MaxCapacity"] {
            actualBattery = String(describing: draven)
            if let _fullCharged = constantCapactiyDevice[userDeviceName()] {
                batteryCharge.text = actualBattery + "/" + String(_fullCharged) + " mAh"
                UIDevice.current.isBatteryMonitoringEnabled = true
                capacity = Int((UIDevice.current.batteryLevel) * Float(_fullCharged))
                currentCapacity.text = String(capacity) + "/" + actualBattery + " mAh"
                if let _actualBattery = draven as? Double {
                    UserDefaults.standard.set(Double(_actualBattery/Double(_fullCharged)), forKey: "Durability")
                }
            }
        }
        
        if let _voltage = (EEIOKitListener.shared().chargerDict! as NSDictionary)["Voltage"] {
            voltage.text = String(describing: _voltage)
        }
      
        
    }
}
extension UITableViewController {
    
        func userDeviceName() -> String {
            var name: [Int32] = [CTL_HW, HW_MACHINE]
            var size: Int = 2
            sysctl(&name, 2, nil, &size, &name, 0)
            var hw_machine = [CChar](repeating: 0, count: Int(size))
            sysctl(&name, 2, &hw_machine, &size, &name, 0)
            let platform: String = String(cString: hw_machine)
            
            //iPhone
            if platform == "iPhone1,1"        { return "iPhone 1G" }
            else if platform == "iPhone1,2"   { return "iPhone 3G" }
            else if platform == "iPhone2,1"   { return "iPhone 3GS" }
            else if platform == "iPhone3,1"   { return "iPhone 4" }
            else if platform == "iPhone3,3"   { return "iPhone 4" }
            else if platform == "iPhone4,1"   { return "iPhone 4S" }
            else if platform == "iPhone5,1"   { return "iPhone 5" }
            else if platform == "iPhone5,2"   { return "iPhone 5" }
            else if platform == "iPhone5,3"   { return "iPhone 5c" }
            else if platform == "iPhone5,4"   { return "iPhone 5c" }
            else if platform == "iPhone6,1"   { return "iPhone 5s" }
            else if platform == "iPhone6,2"   { return "iPhone 5s"}
            else if platform == "iPhone7,2"   { return "iPhone 6" }
            else if platform == "iPhone7,1"   { return "iPhone 6 Plus" }
            else if platform == "iPhone8,1"   { return "iPhone 6s" }
            else if platform == "iPhone8,2"   { return "iPhone 6s Plus" }
            else if platform == "iPhone8,4"   { return "iPhone SE" }
            else if platform == "iPhone9,1"   { return "iPhone 7" }
            else if platform == "iPhone9,3"   { return "iPhone 7"  }
            else if platform == "iPhone9,2"   { return "iPhone 7 Plus" }
            else if platform == "iPhone9,4"   { return "iPhone 7 Plus" }
                
                //iPod Touch
            else if platform == "iPod1,1"     { return "iPod Touch 1G" }
            else if platform == "iPod2,1"     { return "iPod Touch 2G" }
            else if platform == "iPod3,1"     { return "iPod Touch 3G" }
            else if platform == "iPod4,1"     { return "iPod Touch 4G" }
            else if platform == "iPod5,1"     { return "iPod Touch 5G" }
            else if platform == "iPod7,1"     { return "iPod Touch 6G" }
                
                //iPad
            else if platform == "iPad1,1"     { return "iPad 1" }
            else if platform == "iPad2,1"     { return "iPad 2" }
            else if platform == "iPad2,2"     { return "iPad 2" }
            else if platform == "iPad2,3"     { return "iPad 2" }
            else if platform == "iPad2,4"     { return "iPad 2" }
            else if platform == "iPad2,5"     { return "iPad Mini" }
            else if platform == "iPad2,6"     { return "iPad Mini" }
            else if platform == "iPad2,7"     { return "iPad Mini" }
            else if platform == "iPad3,1"     { return "iPad 3" }
            else if platform == "iPad3,2"     { return "iPad 3"  }
            else if platform == "iPad3,3"     { return "iPad 3"  }
            else if platform == "iPad3,4"     { return "iPad 4"}
            else if platform == "iPad3,5"     { return "iPad 4" }
            else if platform == "iPad3,6"     { return "iPad 4" }
            else if platform == "iPad4,1"     { return "iPad Air" }
            else if platform == "iPad4,2"     { return "iPad Air"  }
            else if platform == "iPad4,3"     { return "iPad Air"  }
            else if platform == "iPad4,4"     { return "iPad Mini 2" }
            else if platform == "iPad4,5"     { return "iPad Mini 2"}
            else if platform == "iPad4,6"     { return "iPad Mini 2" }
            else if platform == "iPad4,7"     { return "iPad Mini 3" }
            else if platform == "iPad4,8"     { return "iPad Mini 3"}
            else if platform == "iPad4,9"     { return "iPad Mini 3" }
            else if platform == "iPad5,1"     { return "iPad Mini 4" }
            else if platform == "iPad5,2"     { return "iPad Mini 4" }
            else if platform == "iPad5,3"     { return "iPad Air 2" }
            else if platform == "iPad5,4"     { return "iPad Air 2"  }
            else if platform == "iPad6,3"     { return "iPad Pro 9.7" }
            else if platform == "iPad6,4"     { return "iPad Pro 9.7" }
            else if platform == "iPad6,7"     { return "iPad Pro 12.9" }
            else if platform == "iPad6,8"     { return "iPad Pro 12.9" }
            else if platform == "iPad6,11"     { return "iPad (5th generation)" }
            else if platform == "iPad6,12"     { return "iPad (5th generation)" }
                
                //Apple TV
            else if platform == "AppleTV2,1"  { return "Apple TV 2G" }
            else if platform == "AppleTV3,1"  { return "Apple TV 3" }
            else if platform == "AppleTV3,2"  { return "Apple TV 3 (2013)" }
            else if platform == "AppleTV5,3"  { return "Apple TV 4" }
                
                //Apple Watch
            else if platform == "Watch1,1"    { return "Apple Watch Series 1 (38mm, S1)" }
            else if platform == "Watch1,2"    { return "Apple Watch Series 1 (42mm, S1)" }
            else if platform == "Watch2,6"    { return "Apple Watch Series 1 (38mm, S1P)" }
            else if platform == "Watch2,7"    { return "Apple Watch Series 1 (42mm, S1P)" }
            else if platform == "Watch2,3"    { return "Apple Watch Series 2 (38mm, S2)" }
            else if platform == "Watch2,4"    { return "Apple Watch Series 2 (42mm, S2)" }
                
                //Simulator
            else if platform == "i386"        { return "Simulator" }
            else if platform == "x86_64"      { return "Simulator"}
            else { return "iPhone 6" }
            return platform
        }
}


