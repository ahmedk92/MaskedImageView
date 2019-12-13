//
//  ColorView.swift
//  MaskedImageView
//
//  Created by Ahmed Khalaf on 12/13/19.
//  Copyright © 2019 Ahmed Khalaf. All rights reserved.
//

import UIKit

class ColorView: UIView {
    private var maskLayer: CALayer {
        let l = CAShapeLayer()
        l.frame = bounds
        l.backgroundColor = UIColor.clear.cgColor
        l.path = UIBezierPath(roundedRect: bounds, cornerRadius: min(bounds.width, bounds.height) / 4).cgPath
        return l
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.mask = maskLayer
    }
}
