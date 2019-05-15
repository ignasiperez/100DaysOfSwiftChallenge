//
//  DetailViewController.swift
//  D22-22-Project03-C1 - Storm Viewer with Sharing
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
        navigationItem.largeTitleDisplayMode = .never
        
        
        // D22-01-Add_a_bar_button_system_item
        //
        // enum UIBarButtonItem.SystemItem: Int
        // Constants
        //  .action, .add,  .refresh, .search, .camera, .play...
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        // Do any additional setup after loading the view.
        if let imageToLoad = selectedImge {
            imageView.image  = UIImage(named: imageToLoad)
            print("- imageToLoad: \(imageToLoad)")
        }
    }
    
    
    /// Notifies the view controller that its view is about to be added to a view hierarchy.
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    
    /// Notifies the view controller that its view is about to be removed from a view hierarchy.
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
    
    
    //  ************************************************************
    //  MARK: - Instance methods
    //
    
    // D22-02-Method_called_when_user_taps_action_button
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8), let name = selectedImge
        else {
                print("No image found")
                return
        }
        
        
        let avc = UIActivityViewController(
            // D22-C1-Add_image_name_to_list_of_items
            activityItems: [image, name],
            applicationActivities: [])
        
        // popoverPresentationController: Instance property of parent class UIViewController
        avc.popoverPresentationController?.barButtonItem =
            navigationItem.rightBarButtonItem
        
        present(avc, animated: true)
    }

}
