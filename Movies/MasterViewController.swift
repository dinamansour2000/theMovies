//
//  MasterViewController.swift
//  Movies
//
//  Created by Dina Mansour on 6/4/19.
//  Copyright © 2019 SWVL. All rights reserved.
//

import UIKit
import Reachability

class MasterViewController: UITableViewController {

    var dialogFullScreenView: UIView?
    var objects : NSMutableArray = []
    var yearsArray = [NSNumber]()

    var dialogLoadingGroup: STLoadingGroup?
    var detailViewController: DetailViewController? = nil
    lazy var viewModel = MoviesViewModel()
    var numberofyears = 0
    var tempyear:NSNumber = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewModel.getMoviesData(delegate: self)

         if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

   

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                var array = Array(objects) as! [MovieModel]
                array = array.sorted(by: { $0.year!.intValue < $1.year!.intValue })
                let year = yearsArray[indexPath.row]
                var object = [MovieModel]()
                for i in 0...(array.count-1){
                    if (array[i].year! == year ){
                        object.append(array[i])
                    }
                }
                
                
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                 controller.objects = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
        
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var array = Array(objects) as! [MovieModel]
        
        if (array.count > 0){
        array = array.sorted(by: { $0.year!.intValue < $1.year!.intValue })
        var tempyear: NSNumber = 0
        tempyear = 0
        for i in 0...(array.count-1){
            if (tempyear != array[i].year ){
                numberofyears = numberofyears + 1
                tempyear = array[i].year!
                yearsArray.append(array[i].year!)
            }
        }
        
       return numberofyears
        }else{
            return 0
        }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)


        
        
        
        var finalyear = yearsArray[indexPath.row]
       
            cell.textLabel!.text = finalyear.stringValue
            return cell
        
       
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

//MARK: MoviesRequestDelegate
extension MasterViewController: MoviesRequestDelegate {
 
    
    
    
    func requestWillSend() {
        showProgressDialog()
    }
    
     func requestSucceeded<MovieModel>(data: [MovieModel]?) {
        hideProgressDialog()
        if (data != nil){
            showSuccessMessage("Movies Loaded Successfully")
            
            objects.addObjects(from: data!)
            
           
            
            
          
           
            self.tableView.reloadData()
        }else{
            showErrorMessage("Failed to Load Movies!")
        }
        
        
    }
    
    func requestFailed() {
        hideProgressDialog()
        showNoNetworkConnectedMessage()
    }
    
    
}



