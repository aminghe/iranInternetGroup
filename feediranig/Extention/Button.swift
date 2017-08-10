//
//  Button.swift
//  feediranig
//
//  Created by amin on 5/18/1396 AP.
//  Copyright © 1396 iranig. All rights reserved.
//

import UIKit
@IBDesignable public class themeButton: UIButton {
    
    @IBInspectable var RenderingMode: Bool = false {
        didSet {
            if(RenderingMode){
                setImage(currentImage?.withRenderingMode(.alwaysTemplate), for: .normal)
            }
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 2 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        
//        layer.backgroundColor = color?.cgColor
        //setTitleColor(UIColor.white, for: .normal)
        
        //height
        titleLabel!.font =  UIFont(name: Config().fontName, size: (titleLabel?.font.pointSize)!)
        
    }
}
