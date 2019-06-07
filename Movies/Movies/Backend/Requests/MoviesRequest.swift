//
//  GithubRequest.swift
//  GetGithubRepos
//
//  Created by Dina Mansour on 5/11/19.
//  Copyright © 2019 Rayeh. All rights reserved.
//



import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper
import Dotzu

public protocol MoviesRequestDelegate: NSObjectProtocol {
    func requestWillSend()
    
     func requestSucceeded<T>(data: [T]?)
    
    func requestFailed()
}

class MoviesRequest: BaseMoviesRequest<MovieModel> {
    
    weak var delegate: MoviesRequestDelegate?
    weak var databaseDelegate: MoviesDatabaseRequestDelegate?
    
    public override init() {
        super.init()
    }
    
    public func getMoviesData(){
        delegate?.requestWillSend()
        getResponseArray(url: HomeConstant.MOVIES_URL, debugResponse: false)
    }
    
    override func onRequestSuccess(data: [MovieModel]?) {
        delegate?.requestSucceeded(data: data)
        databaseDelegate?.saveMoviesData(data: data)
    }
    
    override func onRequestFail() {
        delegate?.requestFailed()
    }
    
    
}




