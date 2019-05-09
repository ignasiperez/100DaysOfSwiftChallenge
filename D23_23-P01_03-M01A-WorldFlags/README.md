# World Flags App

This App lets users scroll through a list of various world flags on main screen. When one of them is tapped it is shown full size on a detail screen.

On the top right of the detail screen there is a button that lets the user share the flag picture and country name.

## INSTRUCTIONS [Day 23 Milestone 1A](https://www.hackingwithswift.com/100/23)

  - Copy the images of the flags in the project.

1. Start with a Single View App template, then change its main ViewController class so that builds on UITableViewController instead.
   - _`Xcode`_
     - Create a new Xcode project.
       - Product Name: _Milestone1_
   - _`ViewController.swift`_
     - This class should inherit from table view controller instead of view controller.
   - _`IB Main.Storyboard`_
     - Delete the view controller and create a new table view controller.
     - Tell Xcode that this storyboard table view controller is the same one we have in our code.
     - Tell the iOS engine that this new table view controller is what should be shown when the app first runs.
     - From our code we'll need to identificate the table view cells that will show the picture's names. While you’re in the Attributes inspector change also the Style option.
       - Identifier: _Country_
       - Style: _Basic_
   - Place the table view controller into a navigation controller
2. Load the list of available flags from the App bundle.
   - Store the name of the images with sufix _`.png`_ of the App bundle into an array called _`countries`_.
     - _`ViewController.swift`_
       - iOS engine calls `tableView(..., numberOfRowsInSection section: Int)` method  to know how many rows should be shown. 
       - iOS engine calls `tableView(..., cellForRowAt indexPath: IndexPath)` method to show the picture's names.
   - Add gray arrows (disclosure indicator) at the right of the table view cells.
    - `IB Main.Storyboard`_
3. Create a new Cocoa Touch Class responsible for the detail view controller, and give it properties for its image view and the image to load.
   - _`Xcode`_
     - Name: _DetailViewController_
   - `IB Main.Storyboard`_
     - Add a new view controller
     - We need to tell Xcode that this storyboard view controller is the same one we have in code inside _`DetailViewController.swift`_.
       - Class: _DetailViewController_
     - Give a name to the new view controller
        - Storyboard ID: _Detail_
   - Add an image view to the view controller
   - Connect the new image view to some code
         - Name: _imageView_
   - Create a property in DetailViewController of type `String` that will hold the name of the image to load
     _`DetailViewController.swift`_
       - _`selectedImage`_
4. You’ll also need to adjust your storyboard to include the detail view controller, including using Auto Layout to pin its image view correctly.
   - `IB Main.Storyboard`_
     - Tell the image view how to size itself for different iPhone and iPad sizes.
   _`DetailViewController.swift`_
     - Create a property of type `String` that will hold the name of the image to load
     - _`selectedImage`_
5. Show the detail screen when any table row is tapped, and have it show the selected image
6. You will need to use UIActivityViewController to share your flag.
7. Bonus tip: try setting the imageView property of the table view cell. Yes, they have one. And yes, it automatically places an image right there in the table view cell – it makes a great preview for every country.
