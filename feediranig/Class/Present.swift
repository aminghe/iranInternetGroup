//
//  Present.swift
//  fruitdelivery
//
//  Created by amin on 3/13/1396 AP.
//  Copyright © 1396 vip. All rights reserved.
//

import Foundation
import UIKit
class Present {
    
    private var _storyboardName : String = "Main"
    init() {}
    init(name : String) {
        self._storyboardName = name
    }
    private func storyboard() -> UIStoryboard {
        return UIStoryboard(name: _storyboardName, bundle: nil)
    }
    func instant(identifier : String) -> UIViewController{
        return storyboard().instantiateViewController(withIdentifier: identifier) //as! CartViewController
    }
    func instantTranstion(identifier : String) -> (vc : UIViewController, transition : CATransition){
        let view = storyboard().instantiateViewController(withIdentifier: identifier)
        let transition = CATransition()
        //transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        //view.window!.layer.add(transition, forKey: kCATransition)
        return (view,transition)
    }
}
