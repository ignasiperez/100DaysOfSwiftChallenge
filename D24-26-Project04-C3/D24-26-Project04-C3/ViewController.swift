//
//  ViewController.swift
//  D24-26-Project04-C3 - Easy Browser with table view
//
//  Created by Ignasi Perez-Valls on 14/05/2019.
//  Copyright © 2019 ignasiSwift. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // D26-C3-02-Initilize_property_websites
    var websites = ["developer.apple.com", "www.hackingwithswift.com"]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Easy Browser"
        
        navigationController?.navigationBar.prefersLargeTitles = true
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
        return websites.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("\nViewController tableView(..., cellForRowAt indexPath: IndexPath)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)

        print("- indexPath: \(indexPath)")
        cell.textLabel?.text = websites[indexPath.row]

        return cell
    }
    
    //  Protocol UITableViewDelegate
    //
    ///  Tells the delegate that the specified row is now selected.
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(
            withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.websites = websites
            
            vc.selectedWebsite = websites[indexPath.row]
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
