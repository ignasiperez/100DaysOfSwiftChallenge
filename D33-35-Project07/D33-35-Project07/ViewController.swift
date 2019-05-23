//
//  ViewController.swift
//  D33-35-Project07 - Whitehouse Petitions
//
//  Created by Ignasi Perez-Valls on 22/05/2019.
//  Copyright © 2019 ignasiSwift. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    //  ************************************************************
    //  MARK: - Instance properties
    //
    
    // D33-04-Initialize_petitions_empty_arrays
    var petitions = [Petition]()
    
    
    //  ************************************************************
    //  MARK: - Override UIViewController methods
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // D33-05-Obtain_JSON_data_from_server_through_a_URL_connection
        // let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
//                we're OK to parse!
                parse(json: data)
            }
        }
    }

    
    
    //  ************************************************************
    //  MARK: - TABLE Protocols
    //
    
    //  ViewController inherits UITableViewController which conforms
    //  the protocols UITableViewDataSource and UITableViewDelegate.
    //
    //
    //  Protocol UITableViewDataSource
    //
    /// Tells the data source to return the number of rows in a given section of a table view. Required.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }

    
    //  Protocol UITableViewDataSource
    //
    /// Asks the data source for a cell to insert in a particular location of the table view. Requiered.
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath)
        
        let petition = petitions[indexPath.row]

//        cell.textLabel?.text = "Title goes here"
        cell.textLabel?.text = petition.title
        
        // D33-02-Skeleton_cell_shows_subtitles
//        cell.detailTextLabel?.text = "Subtitle goes here"
        cell.detailTextLabel?.text = petition.body
        
        return cell
    }
    
    
    //  ************************************************************
    //  MARK: - Instance methods
    //
    
    // D33-05-Parse_the_Whitehouse Petitions
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }

}

