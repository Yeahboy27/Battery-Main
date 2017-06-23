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
    var durability: Double = 0.95
    var wave = SPWaterProgressIndicatorView.init(frame: .zero)
    var wave1 = SPWaterProgressIndicatorView.init(frame: .zero)
    
    @IBOutlet weak var DuraLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var circleIndicator: ActivityIndicatorView!
    @IBOutlet weak var qualityLabel: UILabel!
    @IBOutlet weak var waveIndicator: UIView!
    @IBOutlet weak var reviewCapacityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        durability = UserDefaults.standard.double(forKey: "Durability")
        DuraLabel.text = String(format: "%.0f", 100 * durability) + "%"
        let durawave = durability - 0.05
        wave = SPWaterProgressIndicatorView(frame: CGRect(x: -self.waveIndicator.frame.width*0.5 + 0.12 * self.waveIndicator.frame.width, y: -self.waveIndicator.frame.width * CGFloat(1 - durawave) , width: self.waveIndicator.bounds.width * 2 , height: self.waveIndicator.bounds.width * 2))
        wave.completionInPercent = Int(100 * durawave)
        wave1 = SPWaterProgressIndicatorView(frame: CGRect(x: -self.waveIndicator.frame.width*0.5 + 0.3 * self.waveIndicator.frame.width , y: -self.waveIndicator.frame.width * CGFloat(1 - durawave) , width: self.waveIndicator.bounds.width * 2, height: self.waveIndicator.bounds.width * 2))
        wave1.completionInPercent = Int(100 * durawave)
        
        if(durability < 0.7) {
            let badColor  = UIColor(hexString: "FF5700")
            qualityLabel.text = "Bad"
            qualityLabel.textColor = badColor
            wave.waveColor = badColor!.withAlphaComponent(0.8)
            wave1.waveColor = badColor!.withAlphaComponent(0.8)
            circleIndicator.color = UIColor(hexString: "FF5700")!
            reviewCapacityLabel.text = "Your wear levels is Very High. You should replace your battery soon."
        } else if (0.7 <= durability && durability < 0.85) {
            let averageColor = UIColor(hexString: "F8E71C")!
            qualityLabel.text = "Average"
            qualityLabel.textColor = averageColor
            wave.waveColor = averageColor.withAlphaComponent(0.8)
            wave1.waveColor = averageColor.withAlphaComponent(0.8)
            circleIndicator.color = averageColor
            reviewCapacityLabel.text = "Your wear levels is  Average. Becareful with your battery."
        } else {
            let excellentColor = UIColor(hexString: "7ED321")!
            qualityLabel.text = "Excellent"
            qualityLabel.textColor = excellentColor
            wave.waveColor = excellentColor.withAlphaComponent(0.8)
            wave1.waveColor = excellentColor.withAlphaComponent(0.8)
            circleIndicator.color = excellentColor
            reviewCapacityLabel.text = "Your wear levels is Very Low. No need to worry about your Battery."
        }
        self.waveIndicator.addSubview(wave)
        self.waveIndicator.addSubview(wave1)
        waveIndicator.bringSubview(toFront: DuraLabel)
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
    
    override func viewDidLayoutSubviews() {
         scrollView.contentSize.height = 900
    }
}

extension BatteryHealthViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentSize.height = 900
        scrollView.contentMode = .bottom
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





