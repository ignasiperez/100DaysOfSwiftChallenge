//
//  ViewController.swift
//  D27-29-Project05 - Word Scramble
//
//  Created by Ignasi Perez-Valls on 16/05/2019.
//  Copyright © 2019 ignasiSwift. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    //  ************************************************************
    //  MARK: - Instance properties
    //
    
    // D27-02-Initialize_allWords_and_usedWords_empty_arrays
    var allWords = [String]()
    var usedWords = [String]()
    

    //  ************************************************************
    //  MARK: - Override UIViewController methods
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // D27-05-Add_a_bar_button_system_item
        //
        // enum UIBarButtonItem.SystemItem: Int
        // Constants
        //  .action, .add,  .refresh, .search, .camera, .play...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(promptForAnswer)
        )
        
        
        // D29-03-Add_refresh_button_at_the_top_left_of_the_screen
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(startGame)
        )
        
        // Extra: Help button in the bottom right of the screen
        setupToolBar()
        
        // D27-02-Load_text_file_from_bundle_into_an_array
        loadTextFile(forResource: "start", separatedBy: "\n")

        // D27-03-Generate_new_word_to_play
        startGame()
    }
    
    
    //  ************************************************************
    //  MARK: - TABLE Protocols
    //
    
    //  ViewController inherits UITableViewController which conforms
    //  the protocols UITableViewDataSource and UITableViewDelegate.
    //
    //
    //  Protocol UITableViewDataSource
    //
    /// Tells the data source to return the number of rows in a given section of a table view. Required.
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    
    //  Protocol UITableViewDataSource
    //
    /// Asks the data source for a cell to insert in a particular location of the table view. Requiered.
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word",
                                                 for: indexPath)
        
        cell.textLabel?.text = usedWords[indexPath.row]
        
        return cell
    }

    
    //  ************************************************************
    //  MARK: - Instance methods
    //
    
    // D27-05-Method_called_when_user_taps_add_action_button
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter answer",
                                   message: nil,
                                   preferredStyle: .alert
        )
        
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit",style: .default)
        { [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    
    // D28-01-Check_inserted_word_and_add_it_to_table_view
    func submit(_ answer: String) {
        let lowerAnswer = answer.lowercased()
        
        if isPossible(word: lowerAnswer) {
            if isOriginal(word: lowerAnswer) {
                if isReal(word: lowerAnswer) {
                    usedWords.insert(lowerAnswer, at: 0)
                    
                    let indexPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indexPath], with: .automatic)
                    
                    return
                } else {
                    showErrorMessage(
                        errorTitle: "Word not recognised",
                        errorMessage: "You can't just make them up, you know!")
                }
            } else {
                showErrorMessage(
                    errorTitle: "Word used already",
                    errorMessage: "Be more original!")
            }
        } else {
            guard let title = title?.lowercased() else { return }
            showErrorMessage(
                errorTitle: "Word not possible",
                errorMessage: "You can't spell that word from \(title)")
        }
    }

    
    // D27-02-Load_text_file_from_bundle_into_an_array
    private func loadTextFile(forResource resource: String,
                              separatedBy separation: String) {
        if let startWordsURL = Bundle.main.url(
            forResource: resource,
            withExtension: "txt") {
            
            if let startWords = try? String(contentsOf: startWordsURL) {
                // components(separatedBy:) is a method of class NSString. Returns an array containing substrings from the receiver that have been divided by a given separator.
                allWords = startWords.components(separatedBy: separation)
                
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
    }
    
    
    // D27-03-Generate_new_word_to_play
    @objc private func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    
    // Extra: Help button in the bottom right of the screen
    private func setupToolBar() {
        let help = UIBarButtonItem(title: "Help",
                                   style: .plain,
                                   target: self,
                                   action: #selector(helpTapped)
        )
        
        let spacer = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil, action: nil
        )
        
        
        toolbarItems = [spacer, help]
        
        navigationController?.isToolbarHidden = false
    }
    
    
    // Extra: Help button in the bottom right of the screen
    @objc func helpTapped() {
        print("\nViewController openTapped()")
        let ac = UIAlertController(
            title: "GAME RULES",
            message: "Create new words only with the letters of the word at the top of the screen",
            preferredStyle: .alert
        )
        
        ac.addAction(UIAlertAction(title: "Ok",
                                   style: .default)
        )
        
        present(ac, animated: true)
    }
    

    //  ************************************************************
    //  MARK: - Instance helper methods
    //
    
    //  ASSIST: - func submit(_ answer: String)
    func isPossible(word: String) -> Bool {
        print("\nViewController isPossible(word: String)")
        
        guard var tempWord = title?.lowercased() else { return false }
        
        for letter in word {
            print("- letter: \(letter)")
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        
        return true
    }

    
    //  ASSIST: - func submit(_ answer: String)
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    //  ASSIST: - func submit(_ answer: String)
    func isReal(word: String) -> Bool {
        // D29-01-Disallow_short_answers...
        if word.utf16.count < 3 { return false }
        
        // D29-01-..._and_repeated_start_word
        if word == title { return false }
        
        
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(
            in: word,
            range: range,
            startingAt: 0,
            wrap: false,
            language: "en"
        )
        
        return misspelledRange.location == NSNotFound
    }
    
    
    //  ASSIST: - func submit(_ answer: String)
    //
    // D29-02-Show_error_message
    private func showErrorMessage(errorTitle: String, errorMessage: String) {
        
        let ac = UIAlertController(title: errorTitle,
                                   message: errorMessage,
                                   preferredStyle: .alert
        )
        
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(ac, animated: true)
    }
        
}
