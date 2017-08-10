//
//  UIImageView.swift
//  feediranig
//
//  Created by amin on 5/18/1396 AP.
//  Copyright © 1396 iranig. All rights reserved.
//

import UIKit
import AlamofireImage

@IBDesignable public class themeUIImageView: UIImageView {
    
    @IBInspectable var RenderingMode: Bool = false {
        didSet {
            if(RenderingMode){
                image = image?.withRenderingMode(.alwaysTemplate)
            }
            //withRenderingMode(.alwaysTemplate)
        }
    }
    
}

extension UIImageView {
    func downoadImage(ImageUrl : String){
        
        let img = ImageUrl.addingPercentEncoding(withAllowedCharacters : NSCharacterSet.urlQueryAllowed)
        
        self.af_setImage(withURL: NSURL(string: img!)! as URL, placeholderImage: UIImage(named : "logo"), imageTransition: .crossDissolve(0.1), runImageTransitionIfCached: false, completion: nil)
    }

}
