# Project 8 - Swifty Words App

On this App users see a list of hints and an array of buttons with different letters on, and need to use those buttons to enter words matching the hints.

## INSTRUCTIONS [Hacking with Swift Day 36](https://www.hackingwithswift.com/100/36)

1. Setting up.
   - _`Xcode`_
     - Create a new _Single View App_ project.
       - Product Name: **_Project8_**
     - Change its device from Universal to iPad.
       - Project Editor (⌘1)
         - Devices: **_iPad_**
2. Create five properties to store the important parts of our user interface.
   - _`ViewController.swift`_
     - _`scoreLabel`_
     - _`cluesLabel`_ _`answersLabel`_
     - _`currentAnswer`_
     - _`letterButtons`_
3. Create the main view itself as a big and white empty space.
   - _`ViewController.swift`_ `loadView()`
4. - Build the UIKit user interface of the game programmatically.
     - _`ViewController.swift`_ `loadView()`
       - _`submit`_ _`clear`_

## INSTRUCTIONS [Hacking with Swift Day 37](https://www.hackingwithswift.com/100/37)

1. Setting up.
   - _`Xcode`_
   - Copy files level1.txt and level2.txt from GitHub (https://github.com/twostraws/HackingWithSwift) to your project. 
2. Create 4 properties. Two arrays and two integers.
   - _`ViewController.swift`_
     - _`activatedButtons`_  _`solutions`_ _`score`_ _`level`_
3. Observer Pattern.
     - Create the skeleton of three action methods that will be called from our buttons.
       - _`ViewController.swift`_
       - _`letterTapped(_ sender: UIButton)`_  
       - _`submitTapped(_ sender: UIButton)`_
       - _`clearTapped(_ sender: UIButton)`_
     - Associate the action methods when the user presses the corresponding buttons.
       - _`ViewController.swift`_ `loadView()`
           - (Code D37-03-Add_Observer_method_that_is_called_when_user_taps_submit_button)
           - (Code D37-03-Add_Observer_method_that_is_called_when_user_taps_clear_button)
           - (Code D37-03-Add_Observer_method_called_when_user_taps_letterButton)
4. Load and parse our level text file into _`cluesLabel`_ and _`answersLabel`_
   - _`ViewController.swift`_ `loadLevel()`
     - (Code D37-04-Load_and_parse_level_text_file_into_cluesLabel_and_answersLabel)
5. It's play time.
   - Randomly assign letter groups to buttons
     - _`ViewController.swift`_ `loadLevel()`
         - (Code D37-05-Randomly_assign_letter_groups_to_buttons)
     - Handle letter buttons being tapped.
       - _`ViewController.swift`_ `letterTapped(_ sender: UIButton)`
         - (Code D37-05-Handle_letter_buttons_being_tapped)
   - Handle the current word being cleared.
     - _`ViewController.swift`_ `clearTapped(_ sender: UIButton)`
         - (Code D37-05-Handle_current_word_being_cleared)
6. Property Observers.
   - Update the score label whenever the score value changes.
     - _`ViewController.swift`_
        - (Code D37-06-Update_score_label_whenever_score_value_changes)

## INSTRUCTIONS [Hacking with Swift Day 38 Challenges](https://www.hackingwithswift.com/read/8/6/wrap-up)

1. Use the techniques you learned in project 2 to draw a thin gray line around the buttons view, to make it stand out from the rest of the UI.
2. If the user enters an incorrect guess, show an alert telling them they are wrong.
   - You’ll need to extend the _`submitTapped()`_ method so that if `firstIndex(of:)`failed to find the guess you show the alert.
3. Try making the game also deduct points if the player makes an incorrect guess.
   - Think about how you can move to the next level – we can’t use a simple division remainder on the player’s score any more, because they might have lost some points.