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

        
//        let Button = UIButton.appearance()
//        Button.titleLabel?.font = UIFont(name: config.fontName, size: 15)

        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}



extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

