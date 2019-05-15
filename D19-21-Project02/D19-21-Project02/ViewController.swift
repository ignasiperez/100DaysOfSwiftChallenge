//
//  ViewController.swift
//  D19-21-Project02
//
//  Created by Ignasi Perez-Valls on 03/05/2019.
//  Copyright © 2019 ignasiSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //  ************************************************************
    //  MARK: - @IBOutlet Instance Properties
    //
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    
    //  ************************************************************
    //  MARK: - Instance properties
    //
    
    // D19-06-Initialize_Countries_Array_and_score
    var countries = [String]()
    var score = 0
    
    // D20-01-Initialize_correctAnswer
    var correctAnswer = 0
    
    var numberQuestions = 0
    
    
    //  ************************************************************
    //  MARK: - Override UIViewController methods
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\nViewDidLoda()")
        
        // D19-07-Fill_Countries_array
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        
        // D19-10-Draw_one_point_gray_line_around_the_buttons
        //
        // layer: Instance property of parent class UIView
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        // D19-08-Show_the_three_first_flags
        askQuestion()
    }
    
    
    //  *****************************************************************
    //  MARK: - @IBAction Instance methods
    //
    @IBAction func buttonTapped(_ sender: UIButton) {
        // D20-03-Check_answer_and_update_score
        checkUserAnswer(answer: sender.tag)
    }
    
    
    //  ************************************************************
    //  MARK: - Instance methods
    //
    
    // D20-03-Check_answer_and_update_score
    private func checkUserAnswer(answer: Int){
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
            // D20-03-Present_message_with_evaluation_answer_and_updated_score
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
        
        // D20-01-Show_the_flags_randomly
        countries.shuffle()
        
        // D20-01-Assing_a_random_number_between_0_and_2
        //
        // static func Int.random(in range: Range<Int>) -> Int
        correctAnswer = Int.random(in: 0...2)
        
        // D19-08-Show_the_three_first_flags
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        // D20-01-Initialize_title_Instance_Property
        title = """
            Which flag corresponds to \(countries[correctAnswer].uppercased())? | Score: \(String(score))
        """
    }
    
}
