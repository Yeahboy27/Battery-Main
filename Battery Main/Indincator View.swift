//
//  Indincator View.swift
//  Indincator View
//
//  Created by MAC on 5/16/17.
//  Copyright © 2017 example.com. All rights reserved.
//

import UIKit

class ActivityIndicatorView: UIView {
    var color: UIColor = UIColor.red
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.backgroundColor = UIColor.clear
//        self.layer.masksToBounds = true
//        self.layer.cornerRadius = self.frame.size.width/2
//        self.addAnimation()
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addAnimation()
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        for i in 0..<360 {
            let beginAngle = Double.pi * 2/360 * Double(i)
            let toAngle = beginAngle + Double.pi * 2/360
            let alpha = 1.0 / 360 * (Double(i) + 1)
            self.drawCircleWithContext(context: context!, beginAngle: CGFloat(beginAngle), toAngle: CGFloat(toAngle), color: color , alpha: CGFloat(alpha))
        }
        let newcontext = UIGraphicsGetCurrentContext()
        self.drawCircleWithContextAndCenter(context: newcontext!, beginAngle: 0, toAngle: 2 * CGFloat(Double.pi), color: color, alpha: 1, center: CGPoint(x: self.frame.size.width - 12 , y:  self.frame.size.height / 2))
    }
    
    func drawCircleWithContext(context: CGContext, beginAngle: CGFloat, toAngle: CGFloat, color: UIColor, alpha: CGFloat) {
        context.saveGState()
        context.beginPath()
        let r = color.redValue
        let g = color.greenValue
        let b = color.blueValue
        context.setStrokeColor(red: r, green: g, blue: b, alpha: alpha)
        context.setLineWidth(1.0)
        context.addArc(center: CGPoint(x: self.frame.size.width / 2, y:  self.frame.size.height / 2), radius: self.frame.size.width/2 - 12, startAngle: beginAngle, endAngle: toAngle, clockwise: false)
        context.drawPath(using: .stroke)
    }
    
    func drawCircleWithContextAndCenter(context: CGContext, beginAngle: CGFloat, toAngle: CGFloat, color: UIColor, alpha: CGFloat, center: CGPoint) {
        context.saveGState()
        context.beginPath()
        let r = color.redValue
        let g = color.greenValue
        let b = color.blueValue
        context.setStrokeColor(red: r, green: g, blue: b, alpha: alpha)
        context.setLineWidth(1.0)
        
        context.setFillColor(color.cgColor)
        context.fillEllipse(in: CGRect(x: center.x - 5, y: center.y - 5, width: 10, height: 10))
        context.addArc(center: center, radius: 5, startAngle: beginAngle, endAngle: toAngle, clockwise: false)
        context.drawPath(using: .stroke)
    }
    
    func addAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.fromValue = 0
        animation.toValue = (Double.pi * 2)
        animation.duration = CFTimeInterval(2)
        animation.repeatCount = 2.5
        self.layer.add(animation, forKey: "rotate")
    }
    
    func drawCircle(center: CGPoint, radius: CGFloat, fillColor: CGColor, strokeColor: CGColor) {
        let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: false)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = fillColor
        shapeLayer.strokeColor = strokeColor
        shapeLayer.lineWidth = 1.0
        self.layer.addSublayer(shapeLayer)
    }
}

extension UIColor {
    var redValue: CGFloat {
        return CIColor(color: self).red
    }
    var greenValue: CGFloat {
        return CIColor(color: self).green
    }
    var blueValue: CGFloat {
        return CIColor(color: self).blue
    }
    var alphaValue: CGFloat {
        return CIColor(color: self).alpha
    }
}
