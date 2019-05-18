# Project 2 - Guess the flag App

A game that shows some random flags to users and ask them to choose which one belongs to a particular country.

## INSTRUCTIONS [Hacking with Swift Day 19](https://www.hackingwithswift.com/100/19)

1. Setting up.
   - _`Xcode`_
     - Create a new Xcode project.
       - Product Name: _Project2_
2. Place the table view controller into a navigation controller.
   _`IB Main.Storyboard`_
       - Editor menu Embed In > Navigation Controller.
3. Show three butons in the _view controller_
   _`IB Main.Storyboard`_
     - Add 3 buttons to the view controller
     - Each button should be 200 wide by 100 high
       - Size Inspector (⌥⌘5)
         - Witdh: _200_
         - Height: _100_
     - Center the buttons on the screen with **Auto Layout constraints** and adjust the vertical spacing between them.
       - Y coordinate:
         - Y positions should be 100 for the first flag, 230 for the second, and 360 for the third.
       - X coordinate:
         - Top button
           - Choose constraints:
             - _Top Space to Safe Area_
             - _Center Horizontally in Safe Area_
         - Middle button
           - Choose constraints:
             - _Vertical Spacing_
             - _Center Horizontally_
         - Third button: Choose the same contraints.
     - Update all the frames of your buttons to match the Auto Layout rules we just created.
       - Editor menu > Resolve Auto Layout Issues > Update Frames
4. Connect the new image view to the detail view controller code.
   _`IB Main.Storyboard`_
     - Select one button at a time
       - View > Assistant Editor > Show Assistant Editor from the menu (⌥⌘↵)
         - Connection: _Outlet_
         - Object: _Vieww Controller_
         - Name: _buton1_
         - Type: _UIButton_
         - _Strong_
5. Insert the image flags in the App Bundle.
   - _`Xcode - Assets.xcassets`_
     - **Asset catalogs**
     - **@2x and @3x images**
6. Create an array of strings that will hold the countries for our game, and another instance property for the player's current score.
   - _`ViewController.swift`_ _`countries`_, _`score`_
     - (Code D19-06-Initialize_countries_array_and_score)
7. Fill the _`countries`_ array with the flags we have.
   - _`ViewController.swift`_ `viewDidLoad()`
     - (Code D19-07-Fill_countries_array)
8. Write a method that shows the three first flags in the _`countries_` array.
   - _`ViewController.swift`_ `asqQuestion()`
     - (Code D19-08-Show_the_three_first_flags)
9. Call the asqQuestion() method.
   - _`ViewController.swift`_ `viewDidLoad()`
0. As some flags have white stripes, to avoid confusion with the white background of the screen we should draw a one point gray line around the buttons.
   - _`ViewController.swift`_ `viewDidLoad()`
     - (Code D19-10-Draw_one_point_gray_line_around_the_buttons)

## INSTRUCTIONS [Hacking with Swift Day 20](https://www.hackingwithswift.com/100/20)

1. Setting up the game
   - _`ViewController.swift`_ `asqQuestion()`
     - Show the flags on the screen randomly.
       - (Code D20-01-Show_the_flags_randomly)
   - _`ViewController.swift`_ 
     - Create an integer property that will store whether it's flag 0, 1 or 2 that holds the correct answer.
       - _`correctAnswer`_
       - (Code D20-01-Initialize_correctAnswer_instance_property)
   - _`ViewController.swift`_ `asqQuestion()`
     - Assign a random number between 0 and 2 inclusive to the _`corectAnswer`_ property
       - (Code D20-01-Assing_a_random_number_between_0_and_2)
     - At the top of the screen show the name of the country to guess in uppercased letters.
       - (Code D20-01-Initialize_title_instance_property)
2. Connect the three buttons "tap" action to the _view controller_ code
   - _`IB Main.Storyboard`_
     - Select the first flag button
       - View > Assistant Editor > Show Assistant Editor from the menu (⌥⌘↵)
         - Connection: **_Action_**
         - Object: _Vieww Controller_
         - Name: **_buttonTapped_**
         - Type: _UIButton_
         - _Touch UP Inside_
         - _sender_
     - Connect the other two flag buttons actions to the same _`buttonTapped()_` method.
       - To do that, select each of the remaining two buttons, then Ctrl-drag onto the _`buttonTapped()`_ method that was just created.
   - In order to know which correct button was tapped we are going to assign a Tag number to ech of the buttons.
     - Select one button at a time
       - Attributes inspector (⌥⌘4)
         - First button - Tag: **_0_**
         - Second button - Tag: **_1_**
         - Third button - Tag: **_2_**
3. Create a method in charge of checking the user's answer and adjust player's score.
   - _`ViewController.swift`_ `buttonTapped(_ sender: UIButton)`
     - _`checkUserAnswer(answer: sender.tag)`_
        - (Code D20-03-Check_answer_and_update_score)
   - Show a message evaluating their answer and what their new score is.
     - (Code D20-03-Present_message_with_evaluation_answer_and_updated_score)

## INSTRUCTIONS [Hacking with Swift Day 21 Challenges](https://www.hackingwithswift.com/100/21)

1. Show a text in the navigation bar similar to the one of the following example: 
   - “Which flag corresponds to US? | Score: 3”
2. Keep track of how many questions have been asked and show one final message after they have made 5 answers. This should show their final score..
3. When someone chooses the wrong flag, tell them their mistake in your alert message – something like:
   - “Incorrect! That’s the flag of France”
