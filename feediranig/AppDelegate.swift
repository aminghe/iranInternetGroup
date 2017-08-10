//
//  AppDelegate.swift
//  feediranig
//
//  Created by amin on 5/18/1396 AP.
//  Copyright © 1396 iranig. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let config = Config()

//      change Font NavigationBar
        let navigationBarAppearace = UINavigationBar.appearance()
        
        let colorTextNavigationBar = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.85)
        // item bar style
        navigationBarAppearace.tintColor = colorTextNavigationBar
        
        // background navigationBar
        navigationBarAppearace.barTintColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        
        if let font = UIFont(name: config.fontName, size: 16) {
            UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: font,NSForegroundColorAttributeName: colorTextNavigationBar]
        }
        
        UIApplication.shared.statusBarStyle = .lightContent
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.black
        
        // UITabBarItem font
        let appearance = UITabBarItem.appearance()
        var attributes = [NSFontAttributeName:UIFont(name: config.fontName, size: 10)]
        appearance.setTitleTextAttributes(attributes as Any as? [String : Any], for: .normal)
        // barButton
        let barButton = UIBarButtonItem.appearance()
        attributes = [NSFontAttributeName:UIFont(name: config.fontName, size: 14)]
        barButton.setTitleTextAttributes(attributes as Any as? [String : Any], for: .normal)
        barButton.tintColor = colorTextNavigationBar

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}



extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

