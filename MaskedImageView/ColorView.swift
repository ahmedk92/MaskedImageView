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
    
    private var angle: CGFloat = 0 {
        didSet {
            transform = CGAffineTransform(rotationAngle: angle)
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] (_) in
            guard let self = self else { return }
            self.angle = (self.angle - 0.01).truncatingRemainder(dividingBy: .pi * 2)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.mask = maskLayer
    }
}
