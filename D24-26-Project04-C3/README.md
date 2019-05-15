# Project 4-C3 Easy Browser with table view App

Extension of the _Easy Browser_ App.

Now users from main screen can choose websites from a list.

## INSTRUCTIONS [Hacking with Swift Day 26 Challenge 3](https://www.hackingwithswift.com/read/4/6/wrap-up)

1. Refactor: Rename class _`ViewController`_ to  _`DetailViewController`_
   - _`ViewController.swift`_
     - Look for the code _`class ViewController`_
       - Right click over _`ViewController`_ and choose _Refactor > Rename...
         - Change _`ViewControlller`_ for _`DetailViewController`_
   - _`DetailViewController.swift`_
     - Change the initialization of the instance property array websites.
       - (Code D26-C3-01-Declare_property_websites)
   - _`IB Main.Storyboard`_
     - Delete the _navigation view controller_.
     - Give a name to the _view controller_.
       - Identity Inspector (⌥⌘3)
         - Storyboard ID: _Detail_
2. Create a main screen that will show the list of authorized web sites.
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
       - (Code D26-C3-02-Initilize_property_websites)
3. Table setup to show a list of authorized web sites.
   - _`IB Main.Storyboard`_
     - Tell Xcode that this storyboard _view controller_ is part of the class _`ViewController.swift`_.
       - Identity Inspector (⌥⌘3)
       - Class: _ViewController_
       - Tell the iOS engine that this new _table view controller_ is what should be shown when the app first runs.
       - Attributes inspector (⌥⌘4)
         - View Controller: _Is Initial View Controller_
     - From our code we'll need to identificate the table view cells that will show the web sites names. While you’re in the Attributes inspector change also the Style option.
       - Document Outline (Editor > Show Document Outline | Hide Document Outline)
         - Select "Table View Cell"
           - Attributes inspector (⌥⌘4)
             - Identifier: _Website_
             - Style: _Basic_
4. Place the _table view controller_ into a _navigation controller_.
   - _`IB Main.Storyboard`_
         - Editor menu Embed In > Navigation Controller.
5. Make the _table view_ show the list of authoized websites.
   - _`ViewController.swift`_
     - iOS engine calls `tableView(..., numberOfRowsInSection section: Int)` method  to know how many rows should be shown.
     - iOS engine calls `tableView(..., cellForRowAt indexPath: IndexPath)` method to show the websites names.
6. Add gray arrows (disclosure indicator) at the rigth of the _table view cells_.
7. Show the detail screen when any table row is tapped.
8. Place the text "easy browser" in the gray bar at the top of the main screen.
9. Enable large titles across the app.
10. Select the text label inside your table view cell and adjust its font size to something larger.
