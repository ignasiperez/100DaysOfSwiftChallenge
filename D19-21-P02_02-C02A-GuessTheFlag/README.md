# Guess the flag App

A game that shows some random flags to users and ask them to choose which one belongs to a particular country.

## INSTRUCTIONS [Day 19](https://www.hackingwithswift.com/100/19)

- _`Xcode`_
  - Create a new Xcode project.
    - File > New > Project...
      - Single View App > Next
        - Product Name: _Project2_
        - Language: _Swift_

1. _`IB Main.Storyboard`_
   - Place the table view controller into a navigation controller
     - Click inside the view controller
       - Editor menu Embed In > Navigation Controller.
     - `UINavigationController`
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
   - Connect the new image view to some code
     - Select one button at a time
       - View > Assistant Editor > Show Assistant Editor from the menu (⌥⌘↵)
         - Hold down Ctrl and your mouse button, drag from the image view into your code.
         - Connection: _Outlet_
         - Object: _Vieww Controller_
         - Name: _buton1_
         - Type: _UIButton_
         - _Strong_
2. _`Xcode - Assets.xcassets`_
   - Insert the image flags in the app bundle.
     - **Asset catalogs**
     - **@2x and @3x images**
3. _`ViewController.swift`_
   - Create an array of strings that will hold all the countries that will be used for our game, and at the same time we're going to create another property that will hold the player's current score.
     - _`coutries`_
     - _`score`_
4. _`ViewController.swift`_ `viewDidLoad()`
   - Fill the countries array with the flags we have.
     - **`Array`**
5. _`ViewController.swift`_ `asqQuestion()`
   - Write a method that shows the three first flags in the pictures array.
     - **`UIButton`**, **`UIImage`** 
6. _`ViewController.swift`_ `viewDidLoad()`
   - Call the method asqQuestion()
   - As some flags have white stripes, to avoid confusion with the white background of the screen we should draw a one point gray line around the buttons. 
     - **`UIcolor`**
     - Core animation, **`CALayer`**

## INSTRUCTIONS [Day 20](https://www.hackingwithswift.com/100/20)

1. _`ViewController.swift`_ `asqQuestion()`
   - Show the flags on the screen randomly.
     - `Array`
2. _`ViewController.swift`_
   - Create an integer property that will store whether it's flag 0, 1 or 2 that holds the correct answer.
     - _`correctAnswer`_
3. _`ViewController.swift`_ `asqQuestion()`
   - Assign a  random number between 0 and 2 inclusive to the _`corectAnswer`_ property
     - `Int`, Random numbers
   - At the top of the screen show the name of the country to guess in uppercased letters.
     - `String`
4. _`IB Main.Storyboard`_
   - Connect the "tap" action of our UIButtons to some code
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
5. _`ViewController.swift`_
   - Create a method in charge of checking the user's answer
     - (Code 1)
6. _`ViewController.swift`_ _`checkTheAnswer(answer: Int)`_
   - Check whether the answer was correct.
   - Adjust the player's score up or down.
   - Show a message telling them what their new score is.
     - **`UIAlertController`**
       - title: _title_
       - message: _“Your score is ...”_
       - preferredStyle: .alert)
     - **`UIAlertAction`**
       - title: _“Continue”_
       - style: .default
       - handler: askQuestion

Code 1

```swift
@IBAction func buttonTapped(_ sender: UIButton) {
    checkTheAnswer(answer: sender.tag)
}

private func checkTheAnswer(answer: Int) {
    //TODO:
}
```


## INSTRUCTIONS [Day 21 Challenges 2A](https://www.hackingwithswift.com/100/21)

1. Show a text in the navigation bar like the one of the following Example: “Which flag corresponds to US? | Score: 3”
   - `Array`, `String`
2. Keep track of how many questions have been asked and show one final message after they have made 5 answers. This should show their final score.
   - `UIAlertController`
3. When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Incorrect! That’s the flag of France”
   - `UIAlertController`

