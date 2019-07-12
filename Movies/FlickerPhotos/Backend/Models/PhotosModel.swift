//
//  PhotosModel.swift
//  Movies
//
//  Created by Dina Mansour on 6/5/19.
//  Copyright © 2019 SWVL. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

public class PhotosModel: Object, Mappable {
    
    
    @objc dynamic var page: NSNumber? = 0
    @objc dynamic var pages: NSNumber? = 0
    @objc dynamic var perpage: NSNumber? = 0
    @objc dynamic var total: String? = ""
    
    
    var photo = List<PhotoModel>()
    
   
    
 
    
    
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    
    
    
    public func mapping(map: Map){
        page <- map["page"]
        pages <- map["pages"]
        perpage <- map["perpage"]
        total <- map["total"]
        
       photo <- (map["photo"], ListTransform<PhotoModel>())
        
        
        
    }
}





