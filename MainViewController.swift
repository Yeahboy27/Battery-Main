//
//  MainViewController.swift
//  Battery Main
//
//  Created by MAC on 5/15/17.
//  Copyright © 2017 example.com. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPageViewControllerDelegate {
    let pageIdentifier = ["BatteryHealth", "TimeRemaining", "HardwareInformation"]
    var viewControllerTransitionTo = UIViewController()
    var pageViewController: UIPageViewController?
    var modelController: PageModelController {
        if _modelController == nil {
            _modelController = PageModelController(viewControllers: [UIViewController()])
        }
        return _modelController!
    }
    var _modelController: PageModelController? = nil
    
    @IBOutlet weak var pageControl: UIPageControl!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let batteryHealthViewController = storyboard?.instantiateViewController(withIdentifier: "BatteryHealth") as! BatteryHealthViewController
        let timeremainingViewController = storyboard?.instantiateViewController(withIdentifier: "TimeRemaining") as! TimeRemainingViewController
        let hardwareInformationViewController = storyboard?.instantiateViewController(withIdentifier: "HardwareInformation") as! HardwareInformationTableViewController
        modelController.arrayViewController = [batteryHealthViewController, timeremainingViewController, hardwareInformationViewController]
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white.withAlphaComponent(0.8)]
        self.title = "Battery Data"
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController?.delegate = self
        self.pageControl.numberOfPages = 3
        
        let startingViewController = storyboard?.instantiateViewController(withIdentifier: "BatteryHealth")
        let viewControllers = [startingViewController]
        self.pageViewController?.setViewControllers(viewControllers as? [UIViewController], direction: .forward, animated: true, completion: {done in})
        self.pageViewController?.dataSource = self.modelController
        self.addChildViewController(pageViewController!)
        self.view.insertSubview((pageViewController?.view)!, at: 0)
        
        var pageViewRect = self.view.bounds
        if UIDevice.current.userInterfaceIdiom == .pad {
            pageViewRect = pageViewRect.insetBy(dx: 40.0, dy: 40.0)
        }
        self.pageViewController!.view.frame = pageViewRect
        self.pageViewController!.didMove(toParentViewController: self)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        viewControllerTransitionTo = pendingViewControllers[0]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if(completed) {
            self.pageControl.currentPage = indexOfViewController(viewControllerTransitionTo)
        }
    }
    
    
    
    func indexOfViewController(_ viewController: UIViewController) -> Int {
        if let index = pageIdentifier.index(of: viewController.restorationIdentifier!) {
            switch(index) {
            case 0:
                self.title = "Battery Data"
                break
            case 1:
                self.title = "Time Remaining"
                break
            case 2:
                self.title = "Device"
                break
            default:
                self.title = "Battery Data"
                break
            }
        }
        return pageIdentifier.index(of: viewController.restorationIdentifier!) ?? NSNotFound
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
}
