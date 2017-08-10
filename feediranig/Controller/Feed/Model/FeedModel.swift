//
//  FeedModel.swift
//  feediranig
//
//  Created by amin on 5/18/1396 AP.
//  Copyright © 1396 iranig. All rights reserved.
//

import ObjectMapper
class FeedModelMapper: Mappable {
    var id: Int?
    var title: String?
    var imageUrl : String?
    var description : String?
    var time : String?
    var height : CGFloat = 0.0
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        imageUrl <- map["imageUrl"]
        description <- map["description"]
        time <- map["time"]
    }
}
