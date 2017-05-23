//
//  Color.swift
//  Battery Main
//
//  Created by MAC on 5/20/17.
//  Copyright © 2017 example.com. All rights reserved.
//

import UIKit
class Color {
    var gl:CAGradientLayer!
    
    init(alphaTop: CGFloat, alphaBot: CGFloat, startPoint: CGPoint, endPoint: CGPoint, frame: CGRect) {
        let gl = CAGradientLayer().backgroundColor
        let colorTop = UIColor(red: 192.0 / 255.0, green: 38.0 / 255.0, blue: 42.0 / 255.0, alpha: alphaTop).cgColor
        let colorBottom = UIColor(red: 35.0 / 255.0, green: 2.0 / 255.0, blue: 2.0 / 255.0, alpha: alphaBot).cgColor
        
        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
        self.gl.startPoint = startPoint
        self.gl.endPoint = endPoint
        self.gl.frame = frame
        
    }
}
