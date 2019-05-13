# Guess the flag App

A game that shows some random flags to users and ask them to choose which one belongs to a particular country.

## INSTRUCTIONS [Hacking with Swift Day 19](https://www.hackingwithswift.com/100/19)

1. SETTING UP
   - _`Xcode`_
     - Create a new Xcode project.
       - File > New > Project...
         - Single View App > Next
           - Product Name: _Project2_
           - Language: _Swift_
2. PLACE THE VIEW CONTROLLER INTO A NAVIGATION CONTROLLER
   _`IB Main.Storyboard`_
     - Click inside the view controller
       - Editor menu Embed In > Navigation Controller.
3. SHOW THREE BUTTONS IN THE VIEW CONTROLLER
   _`IB Main.Storyboard`_
     - Add 3 buttons to the view controller
       - Object Library (⌘⇧L)
         - `UIButton
     - Each button should be 200 wide by 100 high
       - Size Inspector (⌥⌘5)
         - Witdh: _200_
         - Height: _100_
     - Center the buttons on the screen with **Auto Layout constraints** and adjust the vertical spacing between them.
       - Y coordinate:
         - Y positions should be 100 for the first flag, 230 for the second, and 360 for the third.
       - X coordinate:
         - Select the top button, then Ctrl-drag from there directly upwards to just outside itself
           - Choose constraints:
             - _Top Space to Safe Area_
             - _Center Horizontally in Safe Area_
         - Select the middle button, then Ctrl-drag to the first button.
           - Choose constraints:
             - _Vertical Spacing_
             - _Center Horizontally_
         - Now choose the third button and Ctrl-drag to the second button, and choose the same contraints.
           - Update all the frames of your buttons to match the Auto Layout rules we just created.
           - Editor menu > Resolve Auto Layout Issues > Update Frames
4. CONNCET THE NEW IMAGE VIEWS TO THE VIEW CONTROLLER CODE
   _`IB Main.Storyboard`_
     - Select one button at a time
       - View > Assistant Editor > Show Assistant Editor from the menu (⌥⌘↵)
         - Hold down Ctrl and your mouse button, drag from the image view into your code.
         - Connection: _Outlet_
         - Object: _Vieww Controller_
         - Name: _buton1_
         - Type: _UIButton_
         - _Strong_
5. INSERT THE IMAGE FLAGS IN THE APP BUNDLE.
   - _`Xcode - Assets.xcassets`_
     - **Asset catalogs**
     - **@2x and @3x images**
6. CREATE AN ARRAY OF STRINGS THAT WILL HOLD ALL THE COUNTRIES THAT WILL BE USED FOR OUR GAME, AND AT THE SAME TIME WE'RE GOING TO CREATE ANOTHER INSTANCE PROPERTY THAT WILL HOLD THE PLAYER'S CURRENT SCORE.
   - _`ViewController.swift`_
     - (Code D19-06-Initialize_Countries_Array_and_score)
7. FILL THE COUNTRIES ARRAY WITH THE FLAGS WE HAVE.
   - _`ViewController.swift`_ `viewDidLoad()`
     - (Code D19-07-Fill_Countries_array)
8. WRITE A METHOD THAT SHOWS THE THREE FIRST FLAGS IN THE COUTRIES ARRAY
   - _`ViewController.swift`_ `asqQuestion()`
     - (Code D19-08-Show_the_three_first_flags)
9. CALL THE METHOD asqQuestion()
   - _`ViewController.swift`_ `viewDidLoad()`
0. AS SOME FLAGS HAVE WHITE STRIPES, TO AVOID CONFUSION WITH THE WHITE BACKGROUND OF THE SCREEN WE SHOULD DRAW A ONE POINT GRAY LINE AROUND THE BUTTONS
   - _`ViewController.swift`_ `viewDidLoad()`
     - (Code D19-10-Draw_one_point_gray_line_around_the_buttons)

Code D19-06-Initialize_Countries_Array_and_score

```swift
var countries = [String]()
var score = 0
```

Code D19-07-Fill_Countries_array

```swift
countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
```

Code D19-08-Show_the_three_first_flags

```swift
func askQuestion() {
    button1.setImage(UIImage(named: countries[0]), for: .normal)
    button2.setImage(UIImage(named: countries[1]), for: .normal)
    button3.setImage(UIImage(named: countries[2]), for: .normal)
}
```

Code D19-10-Draw_one_point_gray_line_around_the_buttons

```swift
button1.layer.borderWidth = 1
button2.layer.borderWidth = 1
button3.layer.borderWidth = 1
        
button1.layer.borderColor = UIColor.lightGray.cgColor
button2.layer.borderColor = UIColor.lightGray.cgColor
button3.layer.borderColor = UIColor.lightGray.cgColor
```

## INSTRUCTIONS [Hacking with Swift Day 20](https://www.hackingwithswift.com/100/20)

1. SETTING UP THE GAME  
   - _`ViewController.swift`_ `asqQuestion()`
     - Show the flags on the screen randomly.
       - (Code D20-01-Show_the_flags_randomly)
   - _`ViewController.swift`_
     - Create an integer property that will store whether it's flag 0, 1 or 2 that holds the correct answer.
       - (Code D20-01-Initialize_correctAnswer)
   - _`ViewController.swift`_ `asqQuestion()`
     - Assign a random number between 0 and 2 inclusive to the _`corectAnswer`_ property
       - (Code D20-01-Assing_a_random_number_between_0_and_2)
     - At the top of the screen show the name of the country to guess in uppercased letters.
       - (Code D20-01-Initialize_title_Instance_Property)
2. CONNCET THE THREE BUTTONS TO THE VIEW CONTROLLER CODE
   - _`IB Main.Storyboard`_
     - Select the first flag button
       - View > Assistant Editor > Show Assistant Editor from the menu (⌥⌘↵)
         - Hold down Ctrl and your mouse button, drag from the image view into your code.
         - Connection: _Action_
         - Object: _Vieww Controller_
         - Name: _buttonTapped_
         - Type: _UIButton_
         - _Touch UP Inside_
         - _sender_
     - Connect the other two flag buttons to the same buttonTapped() method.
       - To do that, select each of the remaining two buttons, then Ctrl-drag onto the buttonTapped() method that was just created.
   - In order to know which correct button was tapped we are going to assign a Tag number to ech of the buttons.
     - Select one button at a time
       - Attributes inspector (⌥⌘4)
         - First button - Tag: 0
         - Second button - Tag: 1
         - Third button - Tag: 2
3. CREATE A METHOD IN CHARGE OF CHECKING THE USER'S ANSWER.
   - _`ViewController.swift`_ `buttonTapped(_ sender: UIButton)`
     - (Code D20-03-Create_method_checkUserAnswer(...))
   - _`ViewController.swift`_ _`checkTheAnswer(answer: Int)`_
      - Check whether the answer was correct.
      - Adjust the player's score up or down.
        - (Code D20-03-Check_answer_and_update_score)
   - Show a message evaluating their answer and what their new score is.
     - (Code D20-03-Message_evaluation_answer_and_showing_updated_score)

Code D20-01-Show_the_flags_randomly

```swift
countries.shuffle()
````

Code D20-01-Initialize_correctAnswer

```swift
var correctAnswer = 0
```

Code D20-01-Assing_a_random_number_between_0_and_2

```swift
correctAnswer = Int.random(in: 0...2)
```

Code D20-01-Initialize_title_Instance_Property

```swift
title = countries[correctAnswer].uppercased()
```

Code D20-03-Create_method_checkUserAnswer(...)

```swift
@IBAction func buttonTapped(_ sender: UIButton) {
    checkUserAnswer(answer: sender.tag)
}

private func checkUserAnswer(answer: Int) {
    //TODO:
}
```

Code D20-03-Check_answer_and_update_score)

```swift
var title: String

if sender.tag == correctAnswer {
    title = "Correct"
    score += 1
} else {
    title = "Wrong"
    score -= 1
}
```

Code D20-03-Message_evaluation_answer_and_showing_updated_score

```swift
let ac = UIAlertController(title: title, 
			      message: “Your score is \(score).”,
			      preferredStyle: .alert)

ac.addAction(UIAlertAction(title: “Continue”, 
			      style: .default, 
			      handler: askQuestion))

present(ac, animated: true)
```

## INSTRUCTIONS [Hacking with Swift Day 21 Challenges 2A](https://www.hackingwithswift.com/100/21)

1. SHOW A TEXT IN THE NAVIGATION BAR LIKE THE ONE OF THE FOLLOWING EXAMPLE: 
   - “Which flag corresponds to US? | Score: 3”
2. KEEP TRACK OF HOW MANY QUESTIONS HAVE BEEN ASKED AND SHOW ONE FINAL MESSAGE AFTER THEY HAVE MADE 5 ANSWERS. THIS SHOULD SHOW THEIR FINAL SCORE.
3. WHEN SOMEONE CHOOSES THE WRONG FLAG, TELL THEM THEIR MISTAKE IN YOUR ALERT MESSAGE – SOMETHING LIKE:
   - “Incorrect! That’s the flag of France”
