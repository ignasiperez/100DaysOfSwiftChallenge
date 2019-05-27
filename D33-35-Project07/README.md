# Project 7 - Whitehouse Petitions App

This App lets users scroll through a list of images, then select one to view.

## INSTRUCTIONS [Hacking with Swift Day 33](https://www.hackingwithswift.com/100/33)

1. Setting up.
   - _`Xcode`_
     - Create a new _Single View App_ project.
       - Product Name: **_Project7_**
     - Create two new Swift files
       - **_Petition.swift_**, **_Petitions.swift_**
2. Table setup to show a list of petitions in main screen.
   - _`ViewController.swift`_
     - Instead of inheriting from a _view controller_ should inherits from a _table view controller_.
   - _`IB Main.Storyboard`_
     - Delete "View Controller Scene" and create a new _table view controller_.
     - Tell Xcode that this storyboard _table view controller_ is closely related with class _`ViewController.swift`_.
       - Identity Inspector (⌥⌘3)
         - Class: **_ViewController_**
     - Tell iOS engine that _table view controller_ is what should be shown when the app first runs.
       - Attributes inspector (⌥⌘4)
         - View Controller: **_Is Initial View Controller_**
     - From our code we'll need to identificate the _table view cells_ that will show the petitions. While you’re in the _Attributes Inspector_ change also the _Style_ option.
       - Select "Table View Cell"
         - Attributes inspector (⌥⌘4)
           - Identifier: **_Cell_**
           - Accessory: **_Disclosure Indicator_**
           - Style: **_Subtitle_**
     - Place the _table view controller_ into a _navigation controller_ and a _tab bar controller_.
       - Editor menu Embed In > Navigation Controller
       - Editor menu Embed IN > Tab Bar Controller
     - Add _Most Recent_ button in the tab bar.
       - Select in _Navigation Controller Scene_ _Tab Bar Item_
         - Attributes inspector (⌥⌘4)
         - System Item: **_Most Recent_**
     - From our code we'll need to identificate this new _view controller_.
       - Select in _Navigation Controller_
         - Identity Inspector (⌥⌘3)
           - Storyboard ID: **_NavController_**
   - _`ViewController.swift`_
     - Make the skeleton for the _table view_ show the list of petitions
       - Make an empty array of type `String`.
         - _`petitions`_
   - _`ViewController.swift`_  `tableView(..., cellForRowAt indexPath: IndexPath)`
       - Show subtitles in the _table view cells_.
         - (Code D33-02-Skeleton_cell_shows_subtitles)
3. Define the data structures we need to load the JSON data.
   - _`Petition.swift`_, _`Petitions.swift`_
      - (Code D33-03-Define_custom_struct_Petition)
      - (Code D33-03-Define_custom_struct_Petitions)
4. create an instance property array called _`petitions`_ that will store our petitions.
   - _`ViewController.swift`_
      - (Code D33-04-Initialize_petitions_empty_arrays)
5. Fill the table view with Whitehouse petitions.
   - Obtain JSON data from Whitehouse server through a URL connection.
     - _`ViewController.swift`_ `viewDidLoad()`
       - (Code D33-05-Obtain_JSON_data_from_server_through_a_URL_connection)
   - Parse the Whitehouse petitions into our data type _`Petition`_
      - _`ViewController.swift`_ _`parse(json: Data)`_
        - (Code D33-05-Parse_the_Whitehouse Petitions)
   - Make for each table cell print out the title value of our Petition object and as subtile the body of the WhiteHouse petition.
     - _`ViewController.swift`_ _`tableView(..., cellForRowAt indexPath: IndexPath)`_
       - (Code D33-05-Print_out_title_and_body)

We want to modify this so that the cells print out the title value of our Petition object, but we also want to use the subtitle text label that got added when we 

## INSTRUCTIONS [Hacking with Swift Day 34](https://www.hackingwithswift.com/100/34)

1. Create a detail screen that will be shown when the user taps a Whitehouse petition from the list.
   - _`Xcode`_
     - New > File > iOS > Cocoa Touch Class
       - Name: **_DetailViewController_**
       - Subclass Of: **_UIViewController_**
2. Make the _detail view controller_ displays HTML content.
   - _`DetailViewController.swift`_
     - Import **`WebKit`** Framework
     - Declare `detailItem` instance property of type `Petition`
   - _`DetailViewController.swift`_ `loadView()`
     - Make our _view_ (the root view of the _view controller_) the _web view_.
       - (Code D34-02-Make_our_view_the_web_view)
3. Display a custom HTML string in our webview when user selects a Whitehouse petition from the list.
   - _`DetailViewController.swift`_ `viewDidLoad()`
     - Create the HTML string.
       - (Code D34-03-Create_HTML_content)
   - _`ViewController.swift`_  `tableView(..., didSelectRowAt indexPath: IndexPath)`
     - Display the custom HTML string
       - (Code D34-03-Display_custom_HTML_content)
4. Add a second _view controller_ into our _tab bar_

     - ff

## INSTRUCTIONS [Hacking with Swift Day 35](https://www.hackingwithswift.com/100/35)

1. Create a second _view controller_ that will show popular petitions.
   - _`AppDelegate.swift`_ `application(..., didFinishLaunchingWithOptions launchOptions: ...)`
     - (Code D35-01-Insert_a_second_view_controller_with_popular_petitions_into_our_tab_bar)
2. Add error messages
   - _`ViewController.swift`_  `showError()`

## INSTRUCTIONS [Hacking with Swift Day 35 Challenges](https://www.hackingwithswift.com/read/7/6/wrap-up)

1. Add a Credits button to the top-right corner using UIBarButtonItem. When this is tapped, show an alert telling users the data comes from the We The People API of the Whitehouse.
2. Let users filter the petitions they see. 
   - This involves creating a second array of filtered items that contains only petitions matching a string the user entered.
   - Use a UIAlertController with a text field to let them enter that string. This is a tough one, so I’ve included some hints below if you get stuck.
3. Experiment with the HTML – this isn’t a HTML or CSS tutorial, but you can find lots of resources online to give you enough knowledge to tinker with the layout a little.
