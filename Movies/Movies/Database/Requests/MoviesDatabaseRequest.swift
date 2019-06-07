

import Foundation
import RealmSwift

class MoviesDatabaseRequest: NSObject{
    
    var mDispatchQueue: DispatchQueue?
    
    func saveMoviesData(data: [MovieModel]? ){
        
        if mDispatchQueue == nil{
            mDispatchQueue = DispatchQueue.main //TODO:: performance , we need to convert this ti background
        }
        
        mDispatchQueue?.async {
            let realm = try! Realm()
            realm.beginWrite()
            
            if let dataArray = data {
                for itemModel in dataArray {
                    let dataModel: MovieModel = itemModel
                    realm.add(dataModel, update :true)
                }
            }
            try! realm.commitWrite()
        }
    }
    
    func getMoviesData() -> [MovieModel]?{
        let realm = try! Realm()
        return  realm.objects(MovieModel.self).toArray()
    }
    
    func deleteMoviesData() {
        mDispatchQueue?.async {
            let realm = try! Realm()
            realm.beginWrite()
            realm.delete(realm.objects(MovieModel.self))
            try! realm.commitWrite()
        }
    }
}


