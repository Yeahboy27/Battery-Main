//
//  BatteryHealthViewController.swift
//  Battery Main
//
//  Created by MAC on 5/15/17.
//  Copyright © 2017 example.com. All rights reserved.
//

import UIKit

class BatteryHealthViewController: UIViewController {
    var quality: String = "Excellent"
    var durability: Double = 1

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var circleIndicator: ActivityIndicatorView!
    @IBOutlet weak var qualityLabel: UILabel!
    @IBOutlet weak var waveIndicator: WaveLoadingIndicator!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        durability = UserDefaults.standard.double(forKey: "Durability")
        waveIndicator.progress = durability
        
        if(durability < 0.75) {
            let badColor  = UIColor(hexString: "FF5700")
            qualityLabel.text = "Bad"
            qualityLabel.textColor = badColor
            waveIndicator.heavyColor = badColor!
            waveIndicator.clipCircleColor = badColor!
            waveIndicator.lightColor = UIColor(red: (badColor?.components.red)!
                , green: (badColor?.components.green)! , blue: (badColor?.components.blue)!, alpha: 0.5)
            circleIndicator.color = UIColor(hexString: "FF5700")!
        } else if (0.75 <= durability && durability < 0.85) {
            let averageColor = UIColor(hexString: "F8E71C")!
            qualityLabel.text = "Average"
            qualityLabel.textColor = averageColor
            waveIndicator.heavyColor = averageColor
            waveIndicator.clipCircleColor = averageColor
            waveIndicator.lightColor = UIColor(red: averageColor.redValue, green: averageColor.greenValue, blue: averageColor.blueValue, alpha: 0.5)
            circleIndicator.color = averageColor
        } else {
            let excellentColor = UIColor(hexString: "7ED321")!
            qualityLabel.text = "Excellent"
            qualityLabel.textColor = excellentColor
            waveIndicator.heavyColor = excellentColor
            waveIndicator.clipCircleColor = excellentColor
            waveIndicator.lightColor = UIColor(red: excellentColor.redValue, green: excellentColor.greenValue, blue: excellentColor.blueValue, alpha: 0.5)
            circleIndicator.color = excellentColor
        }
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawCircle(center: CGPoint, radius: CGFloat, fillColor: CGColor, strokeColor: CGColor) {
        let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = fillColor
        shapeLayer.strokeColor = strokeColor
        shapeLayer.lineWidth = 3.0
        self.view.layer.addSublayer(shapeLayer)
    }
}

extension UIColor {
    public convenience init?(hexString: String) {
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.characters.count) != 6) {
            return nil
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
    }
    
    public  convenience init?(hexString: String, alpha: CGFloat) {
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.characters.count) != 6) {
            return nil
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)

    }
}

extension UIColor {
    var coreImageColor: CIColor {
        return CIColor(color: self)
    }
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let coreImageColor = self.coreImageColor
        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }
}

