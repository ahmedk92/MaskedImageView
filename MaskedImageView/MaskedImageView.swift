//
//  MaskedImageView.swift
//  MaskedImageView
//
//  Created by Ahmed Khalaf on 12/13/19.
//  Copyright © 2019 Ahmed Khalaf. All rights reserved.
//

import UIKit

class MaskedImageView: UIImageView {
    private lazy var maskLayer: CALayer = {
        let l = CAShapeLayer()
        l.backgroundColor = UIColor.clear.cgColor
        let sideLength = min(self.bounds.size.width, self.bounds.size.height) / 2
        let rect = CGRect(origin: CGPoint(x: sideLength / 2, y: sideLength / 2), size: CGSize(width: sideLength, height: sideLength))
        l.path = UIBezierPath(roundedRect: rect, cornerRadius: sideLength / 4).cgPath
        var transform = CATransform3DMakeTranslation(-sideLength, -sideLength, 0)
        transform = CATransform3DConcat(transform, CATransform3DMakeRotation(.pi / 4, 0, 0, 1))
        transform = CATransform3DConcat(transform, CATransform3DMakeTranslation(sideLength, sideLength, 0))
        l.transform = transform
        return l
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if maskLayer.superlayer == nil {
            layer.mask = maskLayer
        }
    }
}
