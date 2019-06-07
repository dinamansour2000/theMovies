//
//  FlickerViewModel.swift
//  Movies
//
//  Created by Dina Mansour on 6/4/19.
//  Copyright © 2019 SWVL. All rights reserved.
//

import UIKit


class FlickerViewModel: NSObject {
    lazy var backendManager = FlickerBackendManager();
   
    
    //
    //MARK: Network Request
    //
    public func getFlickerData(movieTitle: String, delegate: FlickerRequestDelegate) {

        
        backendManager.getFlickerData(movieTitle: movieTitle, delegate: delegate);
    }
    
    //
    // MARK: Cancel Network Request
    //
    func cancelFlickerDatatRequest() {
        backendManager.cancelFlickerDatatRequest()
    }
    

}


