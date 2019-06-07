//
//  FlickerRequest.swift
//  Movies
//
//  Created by Dina Mansour on 6/4/19.
//  Copyright © 2019 SWVL. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper
import Dotzu

public protocol FlickerRequestDelegate: NSObjectProtocol {
    func requestWillSend()
    
    func requestSucceeded(data: FlickerModel?)
    
    func requestFailed()
}

class FlickerRequest: BaseFlickerRequest<FlickerModel> {
    
    weak var delegate: FlickerRequestDelegate?

    
    public override init() {
        super.init()
    }
    
    public func getFlickerData(movieTitle: String){
        delegate?.requestWillSend()
        getResponseArray(url: FlickerConstant.FLICKER_URL + movieTitle + "&page=1&per_page=10", debugResponse: false)
    }
    
    override func onRequestSuccess(data: FlickerModel?) {
        delegate?.requestSucceeded(data: data)

    }
    
    override func onRequestFail() {
        delegate?.requestFailed()
    }
    
    
}





