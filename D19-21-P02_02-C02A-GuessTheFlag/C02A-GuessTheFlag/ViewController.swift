//
//  ViewController.swift
//  C02A-GuessTheFlag
//
//  Created by Ignasi Perez-Valls on 03/05/2019.
//  Copyright © 2019 ignasiSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //  ************************************************************
    //  MARK: - @IBOutlet
    //
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    
    //  ************************************************************
    //  MARK: - Instance properties
    //
    var countries = [String]()
    var score = 0
    
    
    //  ************************************************************
    //  MARK: - Overrided methods UIViewController
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        
        
        // layer: Instance property of parent class UIView
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    
    //  ************************************************************
    //  MARK: - Instance methods
    //
    func askQuestion() {
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
}

