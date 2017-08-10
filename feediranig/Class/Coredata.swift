//
//  Coredata.swift
//  fruitdelivery
//
//  Created by amin on 5/1/1396 AP.
//  Copyright © 1396 vip. All rights reserved.
//

import Foundation
import CoreData

class Coredata {
    
    func save(value:[Int], key:String)
    {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    func userAlreadyExist(kUsernameKey: String) -> Bool {
        return UserDefaults.standard.object(forKey: kUsernameKey) != nil
    }
    
    
    
    func removeobject(key:String)
    {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }
    
    func readCategory(key : String) -> [Int]
    {
        let defaults = UserDefaults.standard
        if let value = defaults.array(forKey: key) {
            return value as! [Int]
        }
        return []
    }

}
