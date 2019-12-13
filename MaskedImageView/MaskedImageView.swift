//
//  MaskedImageView.swift
//  MaskedImageView
//
//  Created by Ahmed Khalaf on 12/13/19.
//  Copyright © 2019 Ahmed Khalaf. All rights reserved.
//

import UIKit

class MaskedImageView: UIImageView {
    private var maskLayer: CALayer {
        let l = CAShapeLayer()
        l.frame = self.layer.bounds
        l.backgroundColor = UIColor.clear.cgColor
        
        let sideLength = min(self.bounds.size.width, self.bounds.size.height) * 0.8
        let center = convert(self.center, from: self.superview!)
        let rect = CGRect(origin: center.applying(CGAffineTransform(translationX: -sideLength / 2, y: -sideLength / 2)), size: CGSize(width: sideLength, height: sideLength))
        l.path = UIBezierPath(roundedRect: rect, cornerRadius: sideLength / 4).cgPath
        
        l.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        
        return l
    }
    
    private var angle: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] (_) in
            guard let self = self else { return }
            self.angle = (self.angle + 0.01).truncatingRemainder(dividingBy: .pi * 2)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.mask = maskLayer
    }
}
