

import UIKit

class MoviesBackendManager: NSObject {
    
    weak var moviesDatabaseRequestDelegate: MoviesDatabaseRequestDelegate?
    
    lazy var moviesRequest = MoviesRequest()
    
    public func getMoviesData(delegate: MoviesRequestDelegate) {
        moviesRequest.delegate = delegate
        moviesRequest.databaseDelegate = moviesDatabaseRequestDelegate
        moviesRequest.getMoviesData()
    }
    
    func cancelMoviesDatatRequest() {
        moviesRequest.cancelRequest()
    }
    
}
