//
//  BatteryView.swift
//  Battery Main
//
//  Created by MAC on 5/18/17.
//  Copyright © 2017 example.com. All rights reserved.
//

import UIKit
@IBDesignable
class BatteryView: UIView {
    @IBInspectable
    public var cornerRadius: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    @IBInspectable
    public var borderWidth: CGFloat = 2.0 {
        didSet {
            self.layer.borderWidth = self.borderWidth
        }
    }
    @IBInspectable
    public var borderColor: UIColor = UIColor.red {
        didSet {
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
}
