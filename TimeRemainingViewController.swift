//
//  TimeRemainingViewController.swift
//  Battery Main
//
//  Created by MAC on 5/15/17.
//  Copyright © 2017 example.com. All rights reserved.
//

import UIKit

class TimeRemainingViewController: UIViewController {
    
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var percentageCurrent: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
       percentage.text = String(describing: Int(100 * (UIDevice.current.batteryLevel))) + "%"
       percentageCurrent.isActive = true
       percentageCurrent = percentageCurrent.setMultiplier(multiplier: CGFloat(UIDevice.current.batteryLevel))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func batteryDidChange() {
        percentage.text = String(describing: Int(100 * (UIDevice.current.batteryLevel))) + "%"
        percentageCurrent = percentageCurrent.setMultiplier(multiplier: CGFloat(UIDevice.current.batteryLevel))
    }
    
}

extension NSLayoutConstraint {
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        NSLayoutConstraint.deactivate([self])
        let newConstraint = NSLayoutConstraint(
            item: firstItem,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}


