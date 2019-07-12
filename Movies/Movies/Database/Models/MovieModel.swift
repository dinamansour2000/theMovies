//
//  MovieModel.swift
//  Movies
//
//  Created by Dina Mansour on 6/4/19.
//  Copyright © 2019 SWVL. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm
import Realm

public class MovieModel: Object, Mappable {
    
   
    @objc dynamic var titlee: String? = ""
    @objc dynamic var year: NSNumber? = 0
     var cast = List<String?>()
    var genres = List<String?>()
    @objc dynamic var rating : NSNumber? = 0
  
    
    
    
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    override public static func primaryKey() -> String? {
        return "titlee"
    }
    // Transform Array to Realm.List -> Primitives
    func arrayToList<T>() -> TransformOf<List<T>, [T]> {
        return TransformOf(
            fromJSON: { (value: [T]?) -> List<T> in
                let result = List<T>()
                if let value = value {
                    result.append(objectsIn: value)
                }
                return result
        },
            toJSON: { (value: List<T>?) -> [T] in
                var results = [T]()
                if let value = value {
                    results.append(contentsOf: Array(value))
                }
                return results
        })
    }
    
    public func mapping(map: Map){
       
      
        titlee <- map["title"]
        year <- map["year"]
        cast <- (map["cast"], arrayToList())
        genres <- (map["genres"], arrayToList())
        rating <- map["rating"]
        
        
        
        
    }
}





