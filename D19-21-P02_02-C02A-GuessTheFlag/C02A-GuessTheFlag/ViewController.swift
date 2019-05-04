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
    //  MARK: - Instance properties
    //
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    
    //  ************************************************************
    //  MARK: - @IBOutlet Instance Properties
    //
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    
    //  ************************************************************
    //  MARK: - Overrided Methods UIViewController
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
    
    
    //  *****************************************************************
    //  MARK: - @IBAction Instance Methods
    //
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        
        let ac = UIAlertController(title: title,
                                   message: "Your score is \(score)",
                                   preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(
            title: "Continue",
            style: .default,
            handler: askQuestion))

        present(ac, animated: true)
    }
    
    
    //  ************************************************************
    //  MARK: - Instance methods
    //
    func askQuestion(action: UIAlertAction! = nil ) {
        countries.shuffle()
        
        // static func Int.random(in range: Range<Int>) -> Int
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }
    
}

