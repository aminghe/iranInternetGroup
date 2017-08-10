//
//  LoadingBar.swift
//  fruitdelivery
//
//  Created by amin on 3/13/1396 AP.
//  Copyright © 1396 vip. All rights reserved.
//
import UIKit
class Indicator : UIActivityIndicatorView {

    private static var Loading: Indicator = {
        var loadinbar = Indicator()
        
        // Configuration
        let screenSize: CGRect = UIScreen.main.bounds
        let conterWidth = (screenSize.width / 2) - 25
        let centerHeight = (screenSize.height / 2) - 25
        loadinbar.frame = CGRect(origin: CGPoint(x: conterWidth,y : centerHeight), size: CGSize(width: 50, height: 50))
        loadinbar.layer.cornerRadius = 6.0
        loadinbar.activityIndicatorViewStyle = .white
        loadinbar.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.65)
        return loadinbar
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        stopAnimating()
    }
    
    class func show() {
        Loading.startAnimating()
        UIApplication.shared.keyWindow?.addSubview(Loading)
    }
    
    class func hide(){
        Loading.stopAnimating()
    }

}
