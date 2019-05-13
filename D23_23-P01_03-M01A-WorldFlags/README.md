# World Flags App

This App lets users scroll through a list of various world flags on main screen. When one of them is tapped it is shown full size on a detail screen.

On the top right of the detail screen there is a button that lets the user share the flag picture and country name.

## INSTRUCTIONS [Hacking with Swift Day 23 Milestone 1A](https://www.hackingwithswift.com/100/23)

1. SETTING UP  - Copy the images of the flags in the project.
   - _`Xcode`_
     - Create a new Xcode project.
       - Product Name: **_Milestone1_**
   - Insert the image flags ib the App Bundle.
2. TABLE SETUP TO SHOW A LIST OF COUNTRIES IN MAIN SCREEN.
   - _`ViewController.swift`_
     - Tell this class that instead of inheriting from a view controller should inherits from a table view controller.
   - _`IB Main.Storyboard`_
     - Delete the view controller and create a new table view controller.
     - Tell Xcode that this storyboard table view controller is the same one we have in our code.
     - We need to tell Xcode that this storyboard table view controller is the same one we have in code inside _`ViewController.swift`_.
       - Identity Inspector (⌥⌘3)
         - Class: _ViewController_
     - We need to tell the iOS engine that this new table view controller is what should be shown when the app first runs.
       - Attributes inspector (⌥⌘4)
         - View Controller: _Is Initial View Controller_
     - Tell the iOS engine that this new table view controller is what should be shown when the app first runs.
     - From our code we'll need to identificate the table view cells that will show the counries names. While you’re in the Attributes inspector change also the Style option.
       - Identifier: **_Country_**
       - Style: _Basic_
3. PLACE THE TABLE VIEW CONTROLLER INTO A NAVIGATION CONTROLLER.
   - _`IB Main.Storyboard`_
       - Click inside the view controller
         - Editor menu Embed In > Navigation Controller.
4. MAKE THE TABLE VIEW SHOW THE LIST OF IMAGES WITH SUFFIX _`.png`_
   - _`ViewController.swift`_
   - Store the name of the images into an array called _`countries`_.
   - iOS engine calls `tableView(..., numberOfRowsInSection section: Int)` method  to know how many rows should be shown.
   - iOS engine calls `tableView(..., cellForRowAt indexPath: IndexPath)` method to show the picture's names.
5. ADD GRAY ARROWS (DISCLOSURE INDICATOR) AT THE RIGTH OF THE TABLE VIEW CELLS.
   - _`IB Main.Storyboard`_
     - Select "Country"
       - Accessory: _Disclosure Indicator_
6. CREATE A DETAIL SCREEN THAT WILL BE SHOWN WHEN THE USER TAPS ANY ROW
   - _`Xcode`_
     - New > File > iOS > Cocoa Touch Class
       - Name: **_DetailViewController_**
       - Subclass Of: _UIViewController_
   - `IB Main.Storyboard`_
     - Add a new view controller
     - We need to tell Xcode that this storyboard view controller is the same one we have in code inside _`DetailViewController.swift`_.
       - Class: _DetailViewController_
     - Give a name to the new view controller
        - Storyboard ID: _Detail_
     - Add an image view to the view controller
7. CONNECT THE NEW IMAGE VIEW TO THE DETAIL VIEW CONTROLLER CODE
   - _`IB Main.Storyboard`_
     - Name: _imageView_
   - _`DetailViewController.swift`_
     - Create a property of type `String` that will hold the name of the image to load
       - _`selectedImage`_
8. SHOW THE DETAIL SCREEN WHEN ANY TABLE ROW IS TAPPED, AND HAVE IT SHOW THE SELECTED IMAGE
9. YOU WILL NEED TO USE UIActivityViewController TO SHARE YOUR FLAG.
0. BONUS TIP: TRY SETTING THE imageView PROPERTY OF THE TABLE VIEW CELL. YES, THEY HAVE ONE. AND YES, IT AUTOMATICALLY PLACES AN IMAGE RIGHT THERE IN THE TABLE VIEW CELL – IT MAKES A GREAT PREVIEW FOR EVERY COUNTRY.

