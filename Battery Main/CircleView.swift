//
//  CircleView.swift
//  
//
//  Created by MAC on 6/19/17.
//
//

import UIKit
class CircleView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = self.bounds.width/2
        self.layer.masksToBounds = true
    }
}
