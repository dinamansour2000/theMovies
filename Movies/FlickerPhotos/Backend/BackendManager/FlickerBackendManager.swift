//
//  FlickerBackendManager.swift
//  Movies
//
//  Created by Dina Mansour on 6/4/19.
//  Copyright © 2019 SWVL. All rights reserved.
//

import UIKit

class FlickerBackendManager: NSObject {
    
  
    
    lazy var flickerRequest = FlickerRequest()
    
    public func getFlickerData(movieTitle: String, delegate: FlickerRequestDelegate) {
        flickerRequest.delegate = delegate
        flickerRequest.getFlickerData(movieTitle: movieTitle)
    }
    
    func cancelFlickerDatatRequest() {
        flickerRequest.cancelRequest()
    }
    
}
