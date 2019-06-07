


import UIKit

class MoviesDBManager {
    
    lazy var moviesDbRequest = MoviesDatabaseRequest()
    
    func saveMoviesData(data: [MovieModel]? ){
        moviesDbRequest.saveMoviesData(data: data)
    }
    
    func getMoviesData() -> [MovieModel]? {
        return moviesDbRequest.getMoviesData()
    }
    
    func deleteMoviesData(){
        moviesDbRequest.deleteMoviesData()
    }
}
