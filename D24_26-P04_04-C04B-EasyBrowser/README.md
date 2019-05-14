# Easy Browser C04B App

Extension of the Easy Browser App.

Now users from main screen can choose their website from a list.

## INSTRUCTIONS [Hacking with Swift Day 26 Challenge 4B](https://www.hackingwithswift.com/read/4/6/wrap-up)

1. REFACTOR: RENAME VIEW CONTROLLER TO DETAIL VIEW CONTROLLER
   - _`ViewController.swift`_
     - Look for the code _`class ViewController`_
       - Right click over _`ViewController`_ and choose _Refactor > Rename...
         - Change _`ViewControlller`_ for _`DetailViewController`_
   - _`DetailViewController.swift`_
     - Change the initialization of the instance property array websites
       - (Code D26-01-Declare_property_websites)
   - _`IB Main.Storyboard`_
     - Delete the navigation view controller
     - Give a name to the view controller
       - Identity Inspector (⌥⌘3)
         - Storyboard ID: _Detail_
2. CREATE A MAIN SCREEN THAT WILL SHOW THE LIST OF AUTHORIZED WEB SITES
   - _`Xcode`_
     - New > File > iOS > Cocoa Touch Class
       - Name: _ViewController_
       - Subclass Of: _UITableViewController_
   - _`IB Main.Storyboard`_
     - Add a new view controller
       - Object Library (⌘⇧L)
         - `UITableViewController`
   - _`ViewController.swift`_
     - Initialize the instance property array websites
       - (Code D26-02-Initilize_property_websites)
3. TABLE SETUP TO SHOW A LIST OF AUTHORIZED WEB SITES.
   - _`IB Main.Storyboard`_
     - Tell Xcode that this storyboard view controller is the same one we have in code inside _`ViewController.swift`_.
       - Identity Inspector (⌥⌘3)
       - Class: _ViewController_
       - Tell the iOS engine that this new table view controller is what should be shown when the app first runs.
       - Attributes inspector (⌥⌘4)
         - View Controller: _Is Initial View Controller_
     - From our code we'll need to identificate the table view cells that will show the web sites names. While you’re in the Attributes inspector change also the Style option.
       - Document Outline (Editor > Show Document Outline | Hide Document Outline)
         - Select "Table View Cell"
           - Attributes inspector (⌥⌘4)
             - Identifier: _Website_
             - Style: _Basic_
4. PLACE THE TABLE VIEW CONTROLLER INTO A NAVIGATION CONTROLLER.
   - _`IB Main.Storyboard`_
       - Click inside the view controller
         - Editor menu Embed In > Navigation Controller.
5. MAKE THE TABLE VIEW SHOW THE LIST OF AUTHORIZED WEB SITES
   - _`ViewController.swift`_
     - iOS engine calls `tableView(..., numberOfRowsInSection section: Int)` method  to know how many rows should be shown.
     - iOS engine calls `tableView(..., cellForRowAt indexPath: IndexPath)` method to show the websites names.
6. ADD GRAY ARROWS (DISCLOSURE INDICATOR) AT THE RIGTH OF THE TABLE VIEW CELLS.
7. SHOW THE DETAIL SCREEN WHEN ANY TABLE ROW IS TAPPED.
8. PLACE THE TEXT "Easy Browser" IN THE GRAY BAR AT THE TOP OF THE MAIN SCREEN.
9. ENABLE LARGE TITLES ACROSS THE APP.
0. SELECT THE TEXT LABEL INSIDE YOUR TABLE VIEW CELL AND ADJUST ITS FONT SIZE TO SOMETHING LARGER.

Code D26-01-Change_property_websites

```swift
// var websites = ["developer.apple.com", "www.hackingwithswift.com"]
var websites: [String]!
```

Code D26-02-Initilize_property_websites

```swift
var websites = ["developer.apple.com", "www.hackingwithswift.com"]
```
