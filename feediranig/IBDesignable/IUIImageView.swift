//
//  UIImageView.swift
//  feediranig
//
//  Created by amin on 5/19/1396 AP.
//  Copyright © 1396 iranig. All rights reserved.
//

import UIKit
@IBDesignable public class themeUIImageView: UIImageView {
    @IBInspectable var RenderingMode: Bool = false {
        didSet {
            if(RenderingMode){
                image = image?.withRenderingMode(.alwaysTemplate)
            }
        }
    }
}
