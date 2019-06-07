//
//  AlamofireResponseExtension.swift
//  Movies
//
//  Created by Dina Mansour on 6/6/19.
//  Copyright © 2019 SWVL. All rights reserved.
//

import Alamofire
import Dotzu

public extension Result{
    
    public func debugLog() -> Result {
        #if DEBUG
        Logger.verbose("=======================================")
        Logger.verbose(self)
        Logger.verbose("=======================================")
        #endif
        return self
    }
}
