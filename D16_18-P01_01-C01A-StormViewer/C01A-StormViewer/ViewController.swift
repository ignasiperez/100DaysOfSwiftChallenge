//
//  ViewController.swift
//  C01A-StormViewer
//
//  Created by Ignasi Perez-Valls on 01/05/2019.
//  Copyright © 2019 ignasiSwift. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    
    //  ************************************************************
    //  MARK: - Overrided methods UIViewController
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("ViewController viewDidLoad()")
        
        title = "Storm Viewer"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            print("- item: \(item)")
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        pictures.sort()
        
        print("\n- pictures: \(pictures)")
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
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    
    //  Protocol UITableViewDataSource
    //
    /// Asks the data source for a cell to insert in a particular location of the table view. Requiered.
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture",
                                                 for: indexPath)
        
        cell.textLabel?.text = pictures[indexPath.row]
        
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
            vc.selectedImge = pictures[indexPath.row]
            
            let x = indexPath.row + 1
            vc.selectedPicturePosition = x
            
            let y = pictures.count
            vc.totalPictures = y
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
