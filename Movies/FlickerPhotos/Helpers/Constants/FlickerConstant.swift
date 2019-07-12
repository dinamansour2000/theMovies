//
//  FlickerConstant.swift
//  Movies
//
//  Created by Dina Mansour on 6/4/19.
//  Copyright © 2019 SWVL. All rights reserved.
//

import UIKit

struct FlickerConstant {
    
    private static let FLICKER = "https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=" + Constants.FLICKER_API_KEY + "&format=json&nojsoncallback=1%E2%80%8B&text="
    
    static let FLICKER_URL = FlickerConstant.FLICKER
    
}
