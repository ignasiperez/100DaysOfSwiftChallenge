//
//  ViewController.swift
//  D16-18-Project01
//
//  Created by Ignasi Perez-Valls on 01/05/2019.
//  Copyright © 2019 ignasiSwift. All rights reserved.
//

import UIKit

// D16-03-Inherit_from_a_table_view_controller
class ViewController: UITableViewController {
    
    //  ************************************************************
    //  MARK: - Instance properties
    //
    var pictures = [String]()
    
    
    //  ************************************************************
    //  MARK: - Override UIViewController methods
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewController viewDidLoad()")
        
        // D17-06-Initialize_title_instance_property
        title = "Storm Viewer"
        
        // D17-07-Large_titles_across_the_App
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // D16-02-Read_from_App_Bundle_to_an_array
        readFromAppBundleToAnArray()
        
        // D18-02-Show_image_names_in_sorted_order
        pictures.sort()
        
        // D18-03-Show_Picture_X_of_Y
        print("\n- pictures: \(pictures)")
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
    //
    // D16-05-Return_the_number_of_rows_in_a_given_section
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    
    //  Protocol UITableViewDataSource
    //
    /// Asks the data source for a cell to insert in a particular location of the table view. Requiered.
    //
    // D16-05-Write_the_name_of_each_picture_in_each_cell_of_the_table_view
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
    //
    // D17-04-Put_the_detail_view_controller_in_the_foreground
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
    
    
    //  ************************************************************
    //  MARK: - Instance methods
    //
    // D16-02-Read_from_App_Bundle_to_an_array
    private func readFromAppBundleToAnArray() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            print("- item: \(item)")
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    
}
