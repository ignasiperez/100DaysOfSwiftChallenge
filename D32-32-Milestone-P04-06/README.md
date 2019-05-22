# Milestone P04-06 - Shopping List App

This App lets users add products to a shopping list. They can also clear the list and start again.

## INSTRUCTIONS [Hacking with Swift Day 32 Milestone P04-06](https://www.hackingwithswift.com/100/32)

1. Setting up.
   - _`Xcode`_
     - Create a new _Single View App_ project.
       - Product Name: _MilestoneP04-06_
   - Table setup to show a list of products in main screen.
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
               - Identifier: _Product_
               - Style: _Basic_
   - Place the _table view controller_ into a _navigation controller_.
     - _`IB Main.Storyboard`_
        - Editor menu Embed In > Navigation Controller.
2. Make the table view show the list of products.
   - _`ViewController.swift`
     - Array: _`products`_,
     - Cell identifier: _Product_
3. Add a product.
   - Add an _action bar button system item_ on the right side of the _navigation item_.
      - _`DetailViewController.swift`_ `viewDidLoad()`
   - Create a method that is called by the underlying objective-c engine when the user presses the `.add` action button.
     - _`DetailViewController.swift`_ `addProductTapped()`
         - Create an activity view controller with an editable text input field.
4. Add a _left bar button item_ that calls _`clearShoppingListTapped()`_, so users can restart with a new list of products.
   - _`DetailViewController.swift`_ `viewDidLoad()`
