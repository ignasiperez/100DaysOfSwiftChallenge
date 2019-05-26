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
    
    var filteredPetitions = [Petition]()
    
    
    //  ************************************************************
    //  MARK: - Override UIViewController methods
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // D22-C3-01-Add_bar_button_item_Credits
        setupNavigationBar()
        
        
        let urlString: String
        
        // D33-05-Obtain_JSON_data_from_server_through_a_URL_connection
//        let urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
//        let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
//
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        } else {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
        }

        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
//                we're OK to parse!
                parse(json: data)
                return
            }
        }
        
        showError()
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
        return filteredPetitions.count
    }

    
    //  Protocol UITableViewDataSource
    //
    /// Asks the data source for a cell to insert in a particular location of the table view. Requiered.
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("ViewController tableView(..., cellForRowAt indexPath: IndexPath) ")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath)
        
        // D33-05-Print_out_title_and_body
        let petition = filteredPetitions[indexPath.row]
        
//        cell.textLabel?.text = "Title goes here"
        cell.textLabel?.text = petition.title
        
        // D33-02-Skeleton_cell_shows_subtitles
//        cell.detailTextLabel?.text = "Subtitle goes here"
//        cell.detailTextLabel?.text = petition.body
        cell.detailTextLabel?.text = "Petitions: \(petition.signatureCount)"
        
        return cell
    }
    
    
    //  Protocol UITableViewDelegate
    //
    ///  Tells the delegate that the specified row is now selected.
    //
    // D34-03-Load_a_Web_page
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        
        vc.detailItem = filteredPetitions[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }

    
    
    //  ************************************************************
    //  MARK: - Instance methods
    //
    
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "Credits",
                            style: .plain,
                            target: self,
                            action: #selector(creditsTapped)
        )
        
        navigationItem.leftBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .search,
                            target: self,
                            action: #selector(filterTapped))
    }
    
    
    
    // D33-05-Parse_the_Whitehouse Petitions
    func parse(json: Data) {
        print("VierController parse(json: Data")
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self,
                                                   from: json) {
            petitions = jsonPetitions.results
            
            for petition in petitions {
                print("- petition: \(petition)\n")
            }
            
            filteredPetitions = petitions
            
            tableView.reloadData()
        }
    }
    
    
    func showError() {
        let ac = UIAlertController(
            title: "Loading error",
            message: "There was a problem loading the feed; please check your connection and try again.",
            preferredStyle: .alert
        )
        
        ac.addAction(UIAlertAction(title: "OK",
                                   style: .default)
        )
        
        present(ac, animated: true)
    }
    
    
    // D22-C3-01-Method_called_when_user_taps_action_Credits_button
    @objc func creditsTapped() {
        let ac = UIAlertController(
            title: "CREDITS",
            message: "The data seen on this App \n is downloaded from the \n “We The People API” of the Whitehouse using JSON format.",
            preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(
            title: "Continiue",
            style: .default,
            handler: nil))
        
        present(ac, animated: true)
    }
    
    
    // D22-C3-01-Method_called_when_user_taps_action_Filter_button
    @objc func filterTapped() {
        let ac = UIAlertController(
            title: "FILTER PETITIONS",
            message: nil,
            preferredStyle: .alert)
        
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit",style: .default)
        { [weak self, weak ac] action in
            guard let filter = ac?.textFields?[0].text else { return }
            self?.submit(filter)
        }
        
        ac.addAction(submitAction)
        
        present(ac, animated: true)
    }
    
    
    func submit(_ filter: String) {
        print("ViewController submit(_ filter: String)")
        if filter.isEmpty {
            filteredPetitions = petitions
        } else {
            filteredPetitions = petitions.filter {
                $0.title.lowercased().contains(filter)
            }
        }
        
        
        for petition in filteredPetitions {
            print("- petition: \(petition.title)\n")
        }
        
        tableView.reloadData()
    }
    
}

