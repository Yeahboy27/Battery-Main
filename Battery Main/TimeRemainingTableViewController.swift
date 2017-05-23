//
//  TimeRemainingTableViewController.swift
//  Battery Main
//
//  Created by MAC on 5/18/17.
//  Copyright © 2017 example.com. All rights reserved.
//

import UIKit

class TimeRemainingTableViewController: UITableViewController {
    var durability: Double = 1
    
    @IBOutlet weak var timeStandbyLabel: UILabel!
    @IBOutlet weak var timeAudioLabel: UILabel!
    @IBOutlet weak var timevideoLabel: UILabel!
    @IBOutlet weak var timewifiLabel: UILabel!
    @IBOutlet weak var time4gLabel: UILabel!
    @IBOutlet weak var time3gLabel: UILabel!
    @IBOutlet weak var talktimeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        durability = UserDefaults.standard.double(forKey: "Durability")
        
        talktimeLabel.text = String(describing:  getTimeFromHourToHourAndMinutes((constantTimeRemaining[UIDevice.current.userDeviceName()]?[0])! * Double(UIDevice.current.batteryLevel) * durability))
        
        time3gLabel.text  = String(describing:  getTimeFromHourToHourAndMinutes((constantTimeRemaining[UIDevice.current.userDeviceName()]?[1])! * Double(UIDevice.current.batteryLevel) * durability))
        
        time4gLabel.text = String(describing: getTimeFromHourToHourAndMinutes((constantTimeRemaining[UIDevice.current.userDeviceName()]?[1])! * Double(UIDevice.current.batteryLevel) * durability))
        
        timewifiLabel.text = String(describing:  getTimeFromHourToHourAndMinutes((constantTimeRemaining[UIDevice.current.userDeviceName()]?[2])! * Double(UIDevice.current.batteryLevel) * durability))
        
        timevideoLabel.text = String(describing:  getTimeFromHourToHourAndMinutes((constantTimeRemaining[UIDevice.current.userDeviceName()]?[3])! * Double(UIDevice.current.batteryLevel) * durability))
        
        timeAudioLabel.text = String(describing:  getTimeFromHourToHourAndMinutes((constantTimeRemaining[UIDevice.current.userDeviceName()]?[4])! * Double(UIDevice.current.batteryLevel) * durability))
        
        timeStandbyLabel.text = String(describing:  getTimeFromHourToHourAndMinutes((constantTimeRemaining[UIDevice.current.userDeviceName()]?[5])! * Double(UIDevice.current.batteryLevel) * durability))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
}

extension UITableViewController {
    func getTimeFromHourToHourAndMinutes(_ hour: Double) -> String {
        let timeMinutes: Int  = Int( hour * 60)
        let minutes: Int = timeMinutes % 60
        let hour: Int = timeMinutes / 60
        return String(String(hour) + "h  " + String(minutes) + "m" )
    }
}
