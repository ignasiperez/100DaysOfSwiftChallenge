# Project 7 - Whitehouse Petitions App

This App lets users scroll through a list of images, then select one to view.

## INSTRUCTIONS [Hacking with Swift Day 33](https://www.hackingwithswift.com/100/33)

1. Setting up.
   - _`Xcode`_
     - Create a new _Single View App_ project.
       - Product Name: _Project7_
     - Create two new Swift files
       - _Petition.swift_, _Petitions.swift_
2. Table setup to show a list of petitions in main screen.
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
     - From our code we'll need to identificate the _table view cells_ that will show the petitions. While you’re in the Attributes Inspector change also the Style option.
       - Select "Table View Cell"
         - Attributes inspector (⌥⌘4)
           - Identifier: _Cell_
           - Accessory: _Disclosure Indicator_
           - Style: _Subtitle_
     - Place the _table view controller_ into a _navigation controller_ and a _tab bar controller_
       - Editor menu Embed In > Navigation Controller
       - Editor menu Embed IN > Tab Bar Controller
     - Add _Most Recent_ button in the tab bar
       - Select in _Navigation Controller Scene_ _Tab Bar Item_
         - Attributes inspector (⌥⌘4)
         - System Item: _Most Recent_
     - From our code we'll need to identificate this new view controller.
       - Select in _Navigation Controller
         - Identity Inspector (⌥⌘3)
           - Storyboard ID: _NavController_
   - _`ViewController.swift`_
     - Make the skeleton for the table view show the list of petitions
       - Make an empty array of type `String`.
         - _`petitions`_
   - _`ViewController.swift`_  `tableView(..., cellForRowAt indexPath: IndexPath)`
       - Show subtitles
         - (Code D33-02-Skeleton_cell_shows_subtitles)
3. Define the custom structs _`Petition`_ and _`Petitions`_
   - _`Petition.swift`_, _`Petitions.swift`_
      - (Code D33-03-Define_custom_struct_Petition)
      - (Code D33-03-Define_custom_struct_Petitions)
4. create an instance property array called _`petitions`_ that will store our petitions.
   - _`ViewController.swift`_
      - (Code D33-04-Initialize_petitions_empty_arrays)
5. Fill the table view with Whitehouse petitions
   - Obtain JSON data from Whitehouse server through a URL connection.
     - _`ViewController.swift`_ `viewDidLoad()`
       - (Code D33-05-Obtain_JSON_data_from_server_through_a_URL_connection)
   - Parse the Whitehouse petitions into our data type _`Petition`_
      - _`ViewController.swift`_ _`parse(json: Data)`_
        - (Code D33-05-Parse_the_Whitehouse Petitions)
