//
//  DetailViewController.swift
//  D23-23-Milestone-P01-03 - World Flags
//
//  Created by Ignasi Perez-Valls on 09/05/2019.
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
    var selectedCountry: String?
    
    
    //  ************************************************************
    //  MARK: - Override UIViewController methods
    //
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("\nDetailViewController viewDidLoad()")
        
        // enum UINavigationItem.LargeTitleDisplayMode: Int
        // Enumeration Cases
        //  .automatic, .always, .never
        navigationItem.largeTitleDisplayMode = .never
        
        // D23-08-Load_image_into_the_image_view
        if let imageToLoad = selectedCountry {
            imageView.image  = UIImage(named: imageToLoad)
            
            imageView?.layer.borderWidth = 1
            imageView?.layer.borderColor = UIColor.lightGray.cgColor
            
            print("- imageToLoad: \(imageToLoad)")
            title = imageToLoad.uppercased()
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(shareButtonTapped)
        )
    }
    
    
    //  ************************************************************
    //  MARK: - Instance methods
    //
    @objc func shareButtonTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8), let name = selectedCountry
            else {
                print("No image found")
                return
        }
        
        let avc = UIActivityViewController(
            activityItems: [image, name],
            applicationActivities: [])
        
        avc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(avc, animated: true)
    }
    
}
