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
    var numberQuestions = 0
    
    
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
        
        print("viewDidLoda()")
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
        checkTheAnswer(answer: sender.tag)
    }
    
    
    //  ************************************************************
    //  MARK: - Instance methods
    //
    private func checkTheAnswer(answer: Int){
        print("\ncheckTheAnswer(answer: Int)")
        var title: String
        var message: String?
        
        if answer == correctAnswer {
            title = "Correct!"
            message = nil
            score += 1
        } else {
            title = "Incorrect!"
            message = "That's the flag of \(countries[answer].uppercased())"
            score -= 1
        }
        
        numberQuestions += 1
        print("- numberQuestions: \(numberQuestions)")
        
        if numberQuestions < 5 {
            let ac = UIAlertController(
                title: title,
                message: message,
                preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(
                title: "Continue",
                style: .default,
                handler: askQuestion))
            
            present(ac, animated: true)
        }
        else {
            let ac = UIAlertController(
                title: "GAME OVER",
                message: "Your final score is \(String(score))",
                preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(
                title: "Play again",
                style: .default,
                handler: askQuestion))
            
            present(ac, animated: true)
            
            score = 0
        }
    }
    
    
    private func askQuestion(action: UIAlertAction! = nil ) {
        print("\naskQuestion(...)")
        countries.shuffle()
        
        // static func Int.random(in range: Range<Int>) -> Int
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = """
            Which flag corresponds to \(countries[correctAnswer].uppercased())? | Score: \(String(score))
        """
    }
    
}

