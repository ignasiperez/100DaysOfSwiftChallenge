# Milestone P01-03 - World Flags App

This App lets users scroll through a list of various world flags on main screen. When one of them is tapped it is shown full size on a detail screen.

On the top right of the detail screen there is a button that lets the user share the flag picture and country name.

## INSTRUCTIONS [Hacking with Swift Day 23 Milestone P01-03](https://www.hackingwithswift.com/100/23)

1. Setting up  - Copy the images of the flags in the project.
   - _`Xcode`_
     - Create a new Xcode project.
       - Product Name: **_MilestoneP01-03_**
   - Insert the image flags in the App Bundle.
2. Table setup to show a list of countries in main screen.
   - _`ViewController.swift`_
     - Tell this class that instead of inheriting from a _view controller_ should inherits from a _table view controller_.
   - _`IB Main.Storyboard`_
     - Delete the _view controller_ and create a new _table view controller_.
     - Tell Xcode that this storyboard _table view controller_ is part of the class _`ViewController.swift`_.
     - Tell the iOS engine that this new table view controller is what should be shown when the app first runs.
       - Attributes inspector (⌥⌘4)
         - View Controller: _Is Initial View Controller_
     - From our code we'll need to identificate the table view cells that will show the counries names. While you’re in the Attributes inspector change also the Style option.
       - Identifier: **_Country_**
       - Style: _Basic_
3. Place the _table view controller_ into a _navigation controller_.
   - _`IB Main.Storyboard`_
     - Editor menu Embed In > Navigation Controller.
4. Make the _table view_ show the list of images with suffix _`.png`_
   - _`ViewController.swift`_
   - Store the name of the images into an array called _`countries`_.
   - iOS engine calls `tableView(..., numberOfRowsInSection section: Int)` method  to know how many rows should be shown.
   - iOS engine calls `tableView(..., cellForRowAt indexPath: IndexPath)` method to show the coutries names.
5. Add gray arrows (Disclosure Indicator) at the right of the table view cells.
   - _`IB Main.Storyboard`_
     - Select "Country"
       - Accessory: _Disclosure Indicator_
6. Create a detail screen that will be shown when the user taps any row.
   - _`Xcode`_
     - New > File > iOS > Cocoa Touch Class
       - Name: **_DetailViewController_**
       - Subclass Of: _UIViewController_
   - `IB Main.Storyboard`_
     - Add a new _view controller_
     - We need to tell Xcode that this storyboard _view controller_ is part of the class _`DetailViewController.swift`_.
       - Class: _DetailViewController_
     - Give a name to the new view controller
        - Storyboard ID: _Detail_
     - Add an image view to the view controller
7. Connect the new _image view_ to the _detail view controller_ code.
   - _`IB Main.Storyboard`_
     - Name: _imageView_
   - _`DetailViewController.swift`_
     - Create a property of type `String` that will hold the name of the image to load
       - _`selectedImage`_
8. Show the detail screen when any table row is tapped, and have it show the selected image.
   - _`ViewController.swift`
     - When the user taps one of the rows of the table view the iOS engine calls `tableView(..., didSelectRowAt indexPath: IndexPath)`
       - (Code D23-08-Put_the_detail_view_controller_in_the_foreground)
   - _`DetailViewController.swift`_ `viewDidLoad()`
     - Make the image actually load into the image view.
       - (Code D23-08-Load_image_into_the_image_view)
9. You will nedd to use `UIActivityViewController`to share your flag.
0. Bonus tip: Try setting the _`imageview`_ property of the table view cell. 
   - Yes, they have one. And yes, it automatically places an image right there in the _table view cell_ – it makes a great preview for every country.
