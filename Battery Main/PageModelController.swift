//
//  PageModelController.swift
//  Battery Main
//
//  Created by MAC on 5/15/17.
//  Copyright © 2017 example.com. All rights reserved.
//

import UIKit
class PageModelController: NSObject, UIPageViewControllerDataSource {
    let pageIdentifier = ["BatteryHealth", "TimeRemaining", "HardwareInformation"]
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        
        if(index == 0) || (index == NSNotFound) {
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        if (index == NSNotFound) || (index == 2) {
            return nil
        }
        index += 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> UIViewController {
        let batteryHealthViewController = storyboard.instantiateViewController(withIdentifier: "BatteryHealth") as! BatteryHealthViewController
        switch(index) {
        case 0:
            return batteryHealthViewController
        case 1:
            let timeremainingViewController = storyboard.instantiateViewController(withIdentifier: "TimeRemaining") as! TimeRemainingViewController
            return timeremainingViewController
        case 2:
            let hardwareInformationViewController = storyboard.instantiateViewController(withIdentifier: "HardwareInformation") as! HardwareInformationTableViewController
            return hardwareInformationViewController
        default:
            return batteryHealthViewController
        }
    }
    
    func indexOfViewController(_ viewController: UIViewController) -> Int {
        return pageIdentifier.index(of: viewController.restorationIdentifier!) ?? NSNotFound
    }

}















