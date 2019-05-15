//
//  ViewController.swift
//  D23-23-Milestone-P01-03 - World Flags
//
//  Created by Ignasi Perez-Valls on 09/05/2019.
//  Copyright © 2019 ignasiSwift. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    //  ************************************************************
    //  MARK: - Instance properties
    //
    var countries = [String]()
    
    
    //  ************************************************************
    //  MARK: - Override UIViewController methods
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("ViewController viewDidLoad()")
        
        title = "World Flags"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            print("- item: \(item)")
             if item.hasSuffix(".png") {
                var text = item
                let range = text.index(
                    text.endIndex, offsetBy: -4)..<text.endIndex
                text.removeSubrange(range)
                countries.append(text)
            }
        }
        
        countries.sort()
        
        print("\n- countries: \(countries)")
    }
    
    
    //  ************************************************************
    //  MARK: - Override TABLE Protocols
    //
    //  ViewController inherits UITableViewController which conforms
    //  the protocols UITableViewDataSource and UITableViewDelegate.
    //
    //
    //  Protocol UITableViewDataSource
    //
    /// Tells the data source to return the number of rows in a given section of a table view. Required.
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    
    //  Protocol UITableViewDataSource
    //
    /// Asks the data source for a cell to insert in a particular location of the table view. Requiered.
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country",
                                                 for: indexPath)
        
        
        cell.imageView?.image = UIImage(
            named: "\(countries[indexPath.row])")
        cell.imageView?.layer.borderWidth = 1
        cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor
        
        cell.textLabel?.text = countries[indexPath.row].uppercased()
        
        return cell
    }
    
    
    
    // D23-08-Put_the_detail_view_controller_in_the_foreground
    //
    //  Protocol UITableViewDelegate
    //
    ///  Tells the delegate that the specified row is now selected.
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(
            withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedCountry = countries[indexPath.row]
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
    
    
    




