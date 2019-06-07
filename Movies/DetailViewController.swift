//
//  DetailViewController.swift
//  Movies
//
//  Created by Dina Mansour on 6/4/19.
//  Copyright © 2019 SWVL. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

  
    var detailViewController: MovieDetailsViewController? = nil
    var objects = [MovieModel]()

    var sorted = [MovieModel]()
  
    

    func configureView() {
        // Update the user interface for the detail item.
      
      
        var counter = 0
        for i in 0...objects.count{
            if ( counter < 5 ){
            if (objects[i].rating == 5 ){
            
                sorted.append(objects[i])
                counter =  counter + 1
            }else if(objects[i].rating == 4 ){
               
                sorted.append(objects[i])
                counter =  counter + 1
            }else if(objects[i].rating == 3 ){
                
                sorted.append(objects[i])
                counter =  counter + 1
            }else if(objects[i].rating == 2 ){
              
                sorted.append(objects[i])
                counter =  counter + 1
            }else if(objects[i].rating == 1 ){
                
                sorted.append(objects[i])
                counter =  counter + 1
            }else if(objects[i].rating == 0 ){
               
                sorted.append(objects[i])
                counter =  counter + 1
            }
            }
            
        }
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sorted.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        
     
        cell.textLabel!.text = sorted[indexPath.row].titlee
        return cell
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovieDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] 
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = segue.destination as! MovieDetailsViewController
                
                var genresString = ""
                let genresArray = Array(object.genres)
                if ((genresArray.count) > 0){
                for i in 0...(genresArray.count-1) {
                    genresString += genresArray[i]! + "  "
                    }}else{
                    genresString = "No Genres Data Availbale for this Movie!"
                }
                
                var castString = ""
                let castArray = Array(object.cast)
                if ((castArray.count) > 0){
                    for i in 0...(castArray.count-1) {
                        castString += castArray[i]! + "  "
                    }}else{
                    castString = "No Cast Data Available for this Movie!"
                }
              
                
                controller.castString = castString
                controller.genresString = genresString
                controller.movieTitleString = object.titlee!
                controller.yearString = (object.year?.stringValue)!
                
               

                
            }
        }
    }
    
   
    



}

