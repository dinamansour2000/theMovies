//
//  FlickerModel.swift
//  Movies
//
//  Created by Dina Mansour on 6/4/19.
//  Copyright © 2019 SWVL. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

public class FlickerModel: Object, Mappable {
    
    @objc dynamic var photos: PhotosModel?
    @objc dynamic var stat: String? = ""
 
    
    
    
    
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
  
    
    
    public func mapping(map: Map){
        photos <- map["photos"]
        stat <- map["stat"]

        
        
    }
}





