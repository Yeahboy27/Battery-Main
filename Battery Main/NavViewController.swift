//
//  NavViewController.swift
//  Battery Main
//
//  Created by MAC on 5/31/17.
//  Copyright © 2017 example.com. All rights reserved.
//

import UIKit

class NavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
      self.navigationBar.backgroundColor = UIColor.clear
      self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
      self.navigationBar.shadowImage = UIImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
