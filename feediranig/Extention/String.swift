//
//  String.swift
//  feediranig
//
//  Created by amin on 5/18/1396 AP.
//  Copyright © 1396 iranig. All rights reserved.
//

import Foundation
extension String {

    func toDate() -> String {

        
        let currentDate = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSX"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        //  2017-08-09T12:40:53.110-04:00
        let datePost = dateFormatter.date(from: self)

        let components = Calendar.current.dateComponents([.minute,.hour,.day, .weekOfYear, .month], from: datePost!, to: currentDate)
        print(components.minute!)
        if(components.minute! < 60){
            return "\(components.minute!) دقیقه پیش "
        }else if(components.hour! < 24){
            return "\(components.hour!) ساعت پیش "
        }else if(components.day! < 7){
            return "\(components.day!) روز پیش "
        }else if(components.weekOfYear! > 1){
            return "\(components.weekOfYear!) هفته پیش "
        }else{
            return "\(components.month!) ماه پیش "
        }
        
    
    }
    



}
