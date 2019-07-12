//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by Dina Mansour on 6/4/19.
//  Copyright © 2019 SWVL. All rights reserved.
//

import UIKit
import Reachability
import Kingfisher

class MovieDetailsViewController: UIViewController {
    var dialogFullScreenView: UIView?
    var dialogLoadingGroup: STLoadingGroup?
    var detailViewController: DetailViewController? = nil
    lazy var viewModel = FlickerViewModel()
    var objects = FlickerModel()
    
    
    @IBOutlet weak var genres: UILabel?
    
    public var castString:String = ""
    public var yearString:String = ""
    public var movieTitleString:String = ""
    public var genresString:String = ""
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cast: UILabel?
    @IBOutlet weak var year: UILabel?
    @IBOutlet weak var movieTitle: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
        cast?.text = castString
        genres?.text = genresString
        year?.text = yearString
        movieTitle?.text = movieTitleString
        
        collectionView.dataSource = self
        var searchText = movieTitleString.replacingOccurrences(of: " ", with: "")
        searchText = searchText.replacingOccurrences(of: "(", with: "")
        searchText = searchText.replacingOccurrences(of: ")", with: "")
        viewModel.getFlickerData(movieTitle: searchText, delegate: self)
    }
  
    public func showProgressDialog(){
        dialogLoadingGroup = STLoadingGroup(side: 80, style: .arch)
        
        if dialogFullScreenView == nil {
            dialogFullScreenView = UIView(frame: self.view.frame)
            dialogFullScreenView?.backgroundColor = UIColor(red: 0.0, green: 0.0, blue:0.0, alpha: 0.3)
        }
        
        if !(dialogFullScreenView?.isDescendant(of: self.view))!{
            self.view.addSubview(dialogFullScreenView!)
            dialogFullScreenView?.fillScreenLayoutConstrains()
        }
        
        dialogLoadingGroup?.show(dialogFullScreenView)
        dialogLoadingGroup?.startLoading()
    }
    
    public func hideProgressDialog(){
        dialogLoadingGroup?.stopLoading()
        dialogFullScreenView?.removeFromSuperview()
    }
    
    public func dimScreen(){
        dialogLoadingGroup = STLoadingGroup(side: 80, style: .arch)
        
        if dialogFullScreenView == nil {
            dialogFullScreenView = UIView(frame: self.view.frame)
            dialogFullScreenView?.backgroundColor = UIColor(red: 0.0, green: 0.0, blue:0.0, alpha: 0.3)
        }
        
        
        
    }
    
    public func unDimScreen(){
        
        dialogFullScreenView?.removeFromSuperview()
    }
    
    
    
    public func isNetworkConnected() -> Bool{
        let reachability = Reachability()!
        return reachability.isReachable
    }
    
    public func showNoNetworkConnectedMessage(){
        UIHelper.showErrorMessage(Utils.localizedString(forKey: "noNetworkConnected"))
    }
    public func showErrorMessage(_ message: String){
        UIHelper.showErrorMessage(message)
    }
    public func showSuccessMessage(_ message: String){
        UIHelper.showSuccessMessage(message)
    }
    
}

//MARK: FlickerRequestDelegate
extension MovieDetailsViewController: FlickerRequestDelegate {
    
    
    func requestWillSend() {
        showProgressDialog()
    }
    
    func requestSucceeded(data: FlickerModel?) {
        hideProgressDialog()
        if (data != nil){
            showSuccessMessage("Images Loaded Successfully")
            objects = data!
            collectionView.reloadData()
            
        }else{
            showErrorMessage("No Images Available!")
        }
        
        
    }
    
    func requestFailed() {
        hideProgressDialog()
        showNoNetworkConnectedMessage()
    }
    
    
}

extension MovieDetailsViewController: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // 1
        // Return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       if ( objects.photos != nil ){
        let array = Array (objects.photos!.photo)
        
        return array.count
        }else{
            return 0
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        
        let array = Array (objects.photos!.photo)
        let urlString0 = "http://farm"
        let urlString1 = urlString0 + (array[indexPath.row].farm?.stringValue)! + ".static.flickr.com/"
        let urlString2 = urlString1 + (array[indexPath.row].server)! + "/" + (array[indexPath.row].idNo)!
        let urlString3 = urlString2 + "_" + (array[indexPath.row].secret)! + ".jpg"
        let url = URL(string: urlString3.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)! )
        cell.image.kf.setImage(with: url , placeholder: "movie.png" as? Placeholder)
        
            return cell
            
    }
    
    
}
