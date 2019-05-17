# Project 5 - Word Scramble App

This App lets users scroll through a list of images, then select one to view.

## INSTRUCTIONS [Hacking with Swift Day 27](https://www.hackingwithswift.com/100/27)

1. Setting up.
   - _`Xcode`_
     - Create a new Xcode project.
       - Product Name: _Project5_
     - Copy file _start.txt_ from GitHub (https://github.com/twostraws/HackingWithSwift) to your project . It is placed in the _project5-files_ folder.
   - Table setup to show a list of images in main screen.
     - _`ViewController.swift`_
       - Instead of inheriting from a _view controller_ should inherits from a _table view controller_.
     - _`IB Main.Storyboard`_
       - Delete "View Controller Scene" and create a new _table view controller_.
       - Tell Xcode that this storyboard _table view controller_ is closely related with class _`ViewController.swift`_.
         - Identity Inspector (⌥⌘3)
           - Class: _ViewController_
       - Tell iOS engine that _table view controller_ is what should be shown when the app first runs.
         - Attributes inspector (⌥⌘4)
           - View Controller: _Is Initial View Controller_
       - From our code we'll need to identificate the _table view cells_ that will show the word's names. While you’re in the Attributes Inspector change also the Style option.
         - Document Outline (Editor > Show Document Outline | Hide Document Outline)
           - Select "Table View Cell"
             - Attributes inspector (⌥⌘4)
               - Identifier: _Word_
               - Style: _Basic_
   - Place the _table view controller_ into a _navigation controller_.
     - _`IB Main.Storyboard`_
        - Editor menu Embed In > Navigation Controller.
2. Reading from disk: `contentsOf`.
   - _`ViewController.swift`_
     - Make two new empty arrays of type `String`.
       - _`allWords`_ will hold all the words in the input file, and
       - _`usedWords`_ will hold all the words the player has currently used in the game.
       - (Code D27-02-Initialize_allWords_and_usedWords_empty_arrays)
   - _`ViewController.swift`_ `viewDidLoad()` _`loadTextFile(...)`_
     - (Code D27-02-Load_text_file_from_bundle_into_an_array)
       - Finding the path to our start.txt file.
       - Loading the contents of that file.
       - Splitting the content of a file into an array
3. Start the game.
   - _`ViewController.swift`_ `viewDidLoad()` _`starGame()`_
      - This method will be called every time we want to generate a new word for the player to work with.
      - (Code D27-03-Generate_new_word_to_play)
4. Make the table view show the list of "used words"
   - _`ViewController.swift`
     - Array: _`usedWords`_,
     - Cell identifier: _Word_
5. Pick a word, any word: `UIAlertController`
   - Add an _action bar button system item_ on the right side of the _navigation item_.
      - _`DetailViewController.swift`_ `viewDidLoad()`
        - (Code D27-05-Add_a_bar_button_system_item)
   - Create a method that is called by the underlying objective-c engine when the user presses the `.add` action button.
     - _`DetailViewController.swift`_ `promptForAnswer()`
       - (Code D27-05-Method_called_when_user_taps_add_action_button)
         - Create an activity view controller with an editable text input field.

## INSTRUCTIONS [Hacking with Swift Day 28](https://www.hackingwithswift.com/100/28)

1. Insert one word.
   - Create the skeleton of the three checks always returning true.
     - _`ViewController.swift` _`isPossible(word: String)`_ _`isOriginal(word: String)`_ _`isReal(word: String)`_
   - Add the inserted word to the _table view_ only if passes the three checks. (At this point we are using the skeletons)
     - _`ViewController.swift`_ _`submit(_ answer: String)`_
       - (Code D28-01-Check_inserted_word_and_add_it_to_table_view)
2. Impelement the three check methods.
3. Give feedback to users through messages.

## INSTRUCTIONS [Hacking with Swift Day 29](https://www.hackingwithswift.com/100/29)

1. Disallow answers that are shorter than three letters or are just our start word.
   - (Code D29-01-Disallow_short_answers_and_repeated_start_word)
2. Refactor all the `else` statements we just added so that they call a new method called _`showErrorMessage()`_.
   - This should accept an error message and a title, and do all the `UIAlertController` work from there.
   - _`ViewController.swift`_ _`submit(_ answer: String)`_
   - (Code D29-02-Show_error_message)
3. Add a _left bar button item_ that calls _`startGame()`_, so users can restart with a new word whenever they want to.
   - _`DetailViewController.swift`_ `viewDidLoad()`
   - (Code D29-03-Add_refresh_button_at_the_top_left_of_the_screen)

## KEY CONCEPTS

- Returns a random element from a collection
  - `Array func randomElement() -> Element?`
  - (Code D27-03-Generate_new_word_to_play)
- Reloading table data
  - `UITableView func reloadData()`
  - (Code D27-03-Generate_new_word_to_play)
- Inserting rows into a table
  - `UITableView func insertRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation)`
  - (Code D28-01-Check_inserted_word_and_add_it_to_table_view)
- Add text fields to UIAlertController so that you can accept user input
  - `UIAlertController func addTextField()`
  - (Code D27-05-Method_called_when_user_taps_add_action_button)
- Creating a String from URL
  - `String init(contentsOf: URL)`
  - (Code D27-02-Load_text_file_from_bundle_into_an_array)
- Splitting the content of a string into an array
  - `NSString func components(separatedBy separator: String) -> [String]`
  - (Code D27-02-Load_text_file_from_bundle_into_an_array)
- Closures
  - Avoiding strong reference cycles telling Swift what variables we don't want strong references for.
    - Weak references
    - (Code D27-05-Method_called_when_user_taps_add_action_button)
    