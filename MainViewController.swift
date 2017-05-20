//
//  MainViewController.swift
//  Battery Main
//
//  Created by MAC on 5/15/17.
//  Copyright © 2017 example.com. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPageViewControllerDelegate {
    var pageViewController: UIPageViewController?
    var modelController: PageModelController {
        if _modelController == nil {
            _modelController = PageModelController()
        }
        return _modelController!
    }
    var _modelController: PageModelController? = nil
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController?.delegate = self
        self.pageControl.numberOfPages = 3
        
        let startingViewController = storyboard?.instantiateViewController(withIdentifier: "BatteryHealth") as! UIViewController
        let viewControllers = [startingViewController]
        self.pageViewController?.setViewControllers(viewControllers, direction: .forward, animated: true, completion: {done in})
        self.pageViewController?.dataSource = self.modelController
        self.addChildViewController(pageViewController!)
        self.view.addSubview((pageViewController?.view)!)
        
        var pageViewRect = self.view.bounds
        if UIDevice.current.userInterfaceIdiom == .pad {
            pageViewRect = pageViewRect.insetBy(dx: 40.0, dy: 40.0)
        }
        self.pageViewController!.view.frame = pageViewRect
        self.pageViewController!.didMove(toParentViewController: self)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if(!completed) {
            return
        }
        if(previousViewControllers == nil) {
            self.pageControl.currentPage = 0
        }
        if let previous = previousViewControllers as? BatteryHealthViewController {
            self.pageControl.currentPage = 1
        }
        if let previous = previousViewControllers as? TimeRemainingViewController {
            self.pageControl.currentPage = 2
        }
        
    }
}
