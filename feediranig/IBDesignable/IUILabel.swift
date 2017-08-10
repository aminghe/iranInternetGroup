//
//  UILabel.swift
//  feediranig
//
//  Created by amin on 5/18/1396 AP.
//  Copyright © 1396 iranig. All rights reserved.
//

import UIKit

@IBDesignable public class labelFont: UILabel {
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        font = UIFont(name: Config().fontName, size: font.pointSize)
    }
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var border: UIRectEdge? {
        didSet {
            
            //withRenderingMode(.alwaysTemplate)
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 2 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
}
