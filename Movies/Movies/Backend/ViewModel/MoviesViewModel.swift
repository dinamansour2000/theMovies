


import UIKit

protocol MoviesDatabaseRequestDelegate: NSObjectProtocol {
    
    func saveMoviesData(data: [MovieModel]?)
}

class MoviesViewModel: NSObject {
    lazy var backendManager = MoviesBackendManager();
    lazy var dbManager = MoviesDBManager()
    
    //
    //MARK: Network Request
    //
    public func getMoviesData(delegate: MoviesRequestDelegate) {
        backendManager.moviesDatabaseRequestDelegate = self
        backendManager.getMoviesData(delegate: delegate);
    }
    
    //
    // MARK: Cancel Network Request
    //
    func cancelMoviesDatatRequest() {
        backendManager.cancelMoviesDatatRequest()
    }
    
    //
    // MARK: Get Offline Data
    //
    public func getOfflineMoviesData() -> [MovieModel]?{
        return dbManager.getMoviesData()
    }
}

//
//MARK: DB Request
//
extension MoviesViewModel: MoviesDatabaseRequestDelegate {
  
    
    
    
    
    
    
    func saveMoviesData(data: [MovieModel]?){
        dbManager.deleteMoviesData()
        dbManager.saveMoviesData(data: data)
    }
}

