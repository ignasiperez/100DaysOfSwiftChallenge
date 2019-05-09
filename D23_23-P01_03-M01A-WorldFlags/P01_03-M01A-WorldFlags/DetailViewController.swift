//
//  DetailViewController.swift
//  P01_03-M01A-WorldFlags
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
        let message = "Love this App. It's great for viewing flag countries."
        
        let avc = UIActivityViewController(
            activityItems: [message],
            applicationActivities: [])
        
        avc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(avc, animated: true)
    }
    
}
