//
//  ViewController.swift
//  D36-38-Project08 - Swifty Words
//
//  Created by Ignasi Perez-Valls on 28/05/2019.
//  Copyright © 2019 ignasiSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //  ************************************************************
    //  MARK: - Instance properties
    //
    
    var cluesLabel: UILabel!
    var answersLabel: UILabel!
    var currentAnswer: UITextField!
    var scoreLabel: UILabel!
    var letterButtons = [UIButton]()
    
    // buttons that are currently being used to spell an answer
    var activatedButtons = [UIButton]()
    // possible solutions
    var solutions = [String]()
    
    var score = 0
    var level = 1


    
    //  ************************************************************
    //  MARK: - Override UIViewController methods
    //
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // enum NSTextAligntment contstants: .left .right .center .justify .natural
        scoreLabel.textAlignment = .right
        scoreLabel.text = "Score: 0"
        view.addSubview(scoreLabel)
        
        
        cluesLabel = UILabel()
        cluesLabel.translatesAutoresizingMaskIntoConstraints = false
        cluesLabel.font = UIFont.systemFont(ofSize: 24)
        cluesLabel.text = "CLUES"
        cluesLabel.numberOfLines = 0
        
        cluesLabel.setContentHuggingPriority(
            UILayoutPriority(1),
            for: .vertical
        )
        
        view.addSubview(cluesLabel)

        
        answersLabel = UILabel()
        answersLabel.translatesAutoresizingMaskIntoConstraints = false
        answersLabel.font = UIFont.systemFont(ofSize: 24)
        answersLabel.text = "ANSWERS"
        answersLabel.numberOfLines = 0
        answersLabel.textAlignment = .right
        
        answersLabel.setContentHuggingPriority(
            UILayoutPriority(1),
            for: .vertical
        )
        
        view.addSubview(answersLabel)
        
        
        currentAnswer = UITextField()
        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
        currentAnswer.placeholder = "Tap letters to guess"
        currentAnswer.textAlignment = .center
        currentAnswer.font = UIFont.systemFont(ofSize: 44)
        currentAnswer.isUserInteractionEnabled = false
        view.addSubview(currentAnswer)
        
        
        let submit = UIButton(type: .system)
        submit.translatesAutoresizingMaskIntoConstraints = false
        submit.setTitle("SUBMIT", for: .normal)
        
        // D37-04-Add_Observer_method_that_is_called_when_user_taps_submit_button
        submit.addTarget(
            self,
            action: #selector(submitTapped),
            for: .touchUpInside
        )
        
        view.addSubview(submit)
        
        let clear = UIButton(type: .system)
        clear.translatesAutoresizingMaskIntoConstraints = false
        clear.setTitle("CLEAR", for: .normal)
        
        //D37-04-Add_Observer_method_that_is_called_when_user_taps_clear_button
        clear.addTarget(
            self,
            action: #selector(clearTapped),
            for: .touchUpInside
        )
        view.addSubview(clear)
        
        
        let buttonsView = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsView)


        NSLayoutConstraint.activate([
            // topAnchor: NSLayoutYAxisAnchor
            scoreLabel.topAnchor.constraint(
                equalTo: view.layoutMarginsGuide.topAnchor
            ),
            scoreLabel.trailingAnchor.constraint(
                equalTo: view.layoutMarginsGuide.trailingAnchor
            ),
            
            
            // pin the top of the clues label to the bottom of the score label
            cluesLabel.topAnchor.constraint(
                equalTo: scoreLabel.bottomAnchor
            ),

            // pin the leading edge of the clues label to the leading edge of our layout margins, adding 100 for some space
            cluesLabel.leadingAnchor.constraint(
                equalTo: view.layoutMarginsGuide.leadingAnchor,
                constant: 100
            ),

            // make the clues label 60% of the width of our layout margins, minus 100
            cluesLabel.widthAnchor.constraint(
                equalTo: view.layoutMarginsGuide.widthAnchor,
                multiplier: 0.6,
                constant: -100
            ),

            
            // also pin the top of the answers label to the bottom of the score label
            answersLabel.topAnchor.constraint(
                equalTo: scoreLabel.bottomAnchor
            ),

            // make the answers label stick to the trailing edge of our layout margins, minus 100
            answersLabel.trailingAnchor.constraint(
                equalTo: view.layoutMarginsGuide.trailingAnchor,
                constant: -100),

            // make the answers label take up 40% of the available space, minus 100
            answersLabel.widthAnchor.constraint(
                equalTo: view.layoutMarginsGuide.widthAnchor,
                multiplier: 0.4,
                constant: -100
            ),

            // make the answers label match the height of the clues label
            answersLabel.heightAnchor.constraint(
                equalTo: cluesLabel.heightAnchor
            ),

            
            currentAnswer.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            
            currentAnswer.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 0.5
            ),
            
            currentAnswer.topAnchor.constraint(
                equalTo: cluesLabel.bottomAnchor,
                constant: 20
            ),

            
            submit.topAnchor.constraint(
                equalTo: currentAnswer.bottomAnchor
            ),
            
            submit.centerXAnchor.constraint(
                equalTo: view.centerXAnchor,
                constant: -100
            ),
            
            submit.heightAnchor.constraint(
                equalToConstant: 44
            ),

            clear.centerXAnchor.constraint(
                equalTo: view.centerXAnchor,
                constant: 100
            ),
            
            clear.centerYAnchor.constraint(
                equalTo: submit.centerYAnchor
            ),
            
            clear.heightAnchor.constraint(
                equalToConstant: 44
            ),

            
            buttonsView.widthAnchor.constraint(
                equalToConstant: 750
            ),
            
            buttonsView.heightAnchor.constraint(
                equalToConstant: 320
            ),
            
            buttonsView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            
            buttonsView.topAnchor.constraint(
                equalTo: submit.bottomAnchor,
                constant: 20
            ),
            
            buttonsView.bottomAnchor.constraint(
                equalTo: view.layoutMarginsGuide.bottomAnchor,
                constant: -20
            )
        ])
        
        
        // set some values for the width and height of each button
        let width = 150
        let height = 80
        
        // create 20 buttons as a 4x5 grid
        for row in 0..<4 {
            for col in 0..<5 {
                // create a new button and give it a big font size
                let letterButton = UIButton(type: .system)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                
                // give the button some temporary text so we can see it on-screen
                letterButton.setTitle("WWW", for: .normal)
                
                // D37-04-Add_Observer_method_called_when_user_taps_letterButton)
                letterButton.addTarget(
                    self,
                    action: #selector(letterTapped),
                    for: .touchUpInside
                )

                // calculate the frame of this button using its column and row
                let frame = CGRect(
                    x: col * width,
                    y: row * height,
                    width: width,
                    height: height
                )
                
                letterButton.frame = frame
                
                // add it to the buttons view
                buttonsView.addSubview(letterButton)
                
                // and also to our letterButtons array
                letterButtons.append(letterButton)
            }
        }
        
        scoreLabel.backgroundColor = .gray
        cluesLabel.backgroundColor = .red
        answersLabel.backgroundColor = .blue
        submit.backgroundColor = .lightGray
        clear.backgroundColor = .lightGray
        buttonsView.backgroundColor = .green
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadLevel()
    }
    
    
    //  ************************************************************
    //  MARK: - Instance methods
    //
    
    @objc func letterTapped(_ sender: UIButton) {
    }
    
    @objc func submitTapped(_ sender: UIButton) {
    }
    
    @objc func clearTapped(_ sender: UIButton) {
    }
    
    
    func loadLevel() {
        print("ViewController loadLevel ")
        var clueString = ""
        var solutionString = ""
        var letterBits = [String]()
        
        if let levelFileURL = Bundle.main.url(forResource: "level\(level)", withExtension: "txt") {
            if let levelContents = try? String(contentsOf: levelFileURL) {
                var lines = levelContents.components(separatedBy: "\n")
                lines.shuffle()
                
                for (index, line) in lines.enumerated() {
                    let parts = line.components(separatedBy: ": ")
                    print("\n- parts: \(parts) ")
                    let answer = parts[0]
                    print("- answer: \(answer) ")
                    let clue = parts[1]
                    print("- clue: \(clue) ")
                    
                    clueString += "\(index + 1). \(clue)\n"
                    print("- clueString:\n\(clueString) ")
                    
                    let solutionWord = answer.replacingOccurrences(of: "|", with: "")
                    solutionString += "\(solutionWord.count) letters\n"
                    print("- solutionString:\n\(solutionString) ")
                    solutions.append(solutionWord)
                    
                    let bits = answer.components(separatedBy: "|")
                    letterBits += bits
                    print("- letterBits:\n\(letterBits) ")
                }
            }
        }
        
        cluesLabel.text = clueString.trimmingCharacters(
            in: .whitespacesAndNewlines)
        
        answersLabel.text = solutionString.trimmingCharacters(
            in: .whitespacesAndNewlines)
        
        letterBits.shuffle()
        
        if letterBits.count == letterButtons.count {
            for i in 0 ..< letterButtons.count {
                letterButtons[i].setTitle(letterBits[i], for: .normal)
            }
        }

    }

}
