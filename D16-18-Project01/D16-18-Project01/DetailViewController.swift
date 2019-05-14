//
//  DetailViewController.swift
//  D16-18-Project01
//
//  Created by Ignasi Perez-Valls on 01/05/2019.
//  Copyright © 2019 ignasiSwift. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //  ************************************************************
    //  MARK: - @IBOutlet Instance Properties
    //
    
    @IBOutlet var imageView: UIImageView!
    
    
    //  ************************************************************
    //  MARK: - Instance properties
    //
    //
    // Code D17-03-Declare_Instance_Property_selectedImage
    var selectedImge: String?
    
    var selectedPicturePosition = 0
    var totalPictures = 0
    
    
    //  ************************************************************
    //  MARK: - Override UIViewController methods
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("\nDetailViewController viewDidLoad()")
        
        // day 16: title = selectedImage
        // day 18 (challenge): 
        title = "Picture \(selectedPicturePosition) of \(totalPictures)"
        
        // enum UINavigationItem.LargeTitleDisplayMode: Int
        // Enumeration Cases
        //  .automatic, .always, .never
        //
        // D17-08-No_large_titles_on_view_controller
        navigationItem.largeTitleDisplayMode = .never
        
        loadImageIntoImageView()
    }
    
    
    /// Notifies the view controller that its view is about to be added to a view hierarchy.
    // D17-04-Toggle_bars_on_top_of_the_screen
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    
    /// Notifies the view controller that its view is about to be removed from a view hierarchy.
    // D17-04-Toggle_bars_on_top_of_the_screen
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
    
    
    //  ************************************************************
    //  MARK: - Instance methods
    //
    //
    // D17-04-Load_image_into_the_image_view
    private func loadImageIntoImageView() {
        if let imageToLoad = selectedImge {
            imageView.image  = UIImage(named: imageToLoad)
            print("- imageToLoad: \(imageToLoad)")
        }
    }
    
}
