# Project 1 - Storm Viewer App

This App lets users scroll through a list of images, then select one to view.

## INSTRUCTIONS [Hacking with Swift Day 16](https://www.hackingwithswift.com/100/16)

1. Setting up.
   - _`Xcode`_
     - Create a new Xcode project.
        - Product Name: _Project1_
        - Language: _Swift_
     - Copy the Storm images in your project.
2. Store the name of the images with prefix _`nssl`_ from the App Bundle into an array called _`pictures`_.
   - _`ViewController.swift`_
     - (Code D16-02-Read_from_App_Bundle_to_an_array)
3. Table setup to show a list of images in main screen.
   - _`ViewController.swift`_
     - Tell this class that instead of inheriting from a _view controller_ should inherits from a _table view controller_.
       - (Code D16-03-Inherit from a table view controller)
   - _`IB Main.Storyboard`_
     - Delete "View Controller Scene" and create a new _table view controller_.
     - Tell Xcode that this storyboard _table view controller_ is the same one we have in code inside _`ViewController.swift`_.
       - Identity Inspector (⌥⌘3)
         - Class: _ViewController_
     - Tell the iOS engine that this new _table view controller_ is what should be shown when the app first runs.
       - Attributes inspector (⌥⌘4)
         - View Controller: _Is Initial View Controller_
     - From our code we'll need to identificate the table view cells that will show the picture's names. While you’re in the Attributes inspector change also the Style option.
       - Document Outline (Editor > Show Document Outline | Hide Document Outline)
         - Select "Table View Cell"
           - Attributes inspector (⌥⌘4)
             - Identifier: _Picture_
             - Style: _Basic_
4. Place the _table view controller_ into a _navigation controller_.
   - _`IB Main.Storyboard`_
       - Click inside the view controller
         - Editor menu Embed In > Navigation Controller.
5. Make the _table view_ show the list of "nssl" pictures
   _`ViewController.swift`_
     - (Code D16-05-Return_the_number_of_rows_in_a_given_section)
     - (Code D16-05-Write_the_name_of_each_picture_in_each_cell_of_the_table_view)

## INSTRUCTIONS [Hacking with Swift Day 17](https://www.hackingwithswift.com/100/17)

1. Create a detail screnn that will be shown when the user taps any row
   - _`Xcode`_
     - New > File > iOS > Cocoa Touch Class
       - Name: _DetailViewController_
       - Subclass Of: _UIViewController_
   - _`IB Main.Storyboard`_
     - Add a new view controller
       - Object Library (⌘⇧L)
     - Tell Xcode that this storyboard view controller is the same one we have in code inside _`DetailViewController.swift`_.
       - Identity Inspector (⌥⌘3)
       - Class: _DetailViewController_
     - Give a name to the new view controller
       - Identity Inspector (⌥⌘3)
         - Storyboard ID: _Detail_
2. Add an _image view_ to the detail screen
   - _`IB Main.Storyboard`_
     - Object Library (⌘⇧L)
     - Tell the _image view_ how to size itself for different iPhone and iPad sizes. This will be done with the help of the Auto Layout constraints.
       - Select the image view
         - Editor menu > RESOLVE Auto Layout Issues > Reset To Suggested Constraints (⇧⌥⌘=)
3. Connect the new _image view_ to the _detail view controller_ code.
   - _`IB Main.Storyboard`_
     - Select the image view
       - View > Assistant Editor > Show Assistant Editor from the menu (⌥⌘↵)
           - Connection: _Outlet_
           - Object: _Detail Vieww Controller_
           - Name: _imageView_
           - Type: _UIImageView_
           - _Strong_
   - _`DetailViewController.swift`_
     - Create a property called _`selectedImage`_ of type `String` that will hold the name of the image to load.
       - (Code D17-03-Declare_Instance_Property_selectedImage)
4. Show the detail screen when any table row is tapped, and have it show the selected image.
   - _`ViewController.swift`
     - When the user taps one of the rows of the table view the iOS engine calls `tableView(..., didSelectRowAt indexPath: IndexPath)`
       - (Code D17-04-Put_the_detail_view_controller_in_the_foreground)
   - _`DetailViewController.swift`_ `viewDidLoad()`
     - Make the image actually load into the image view.
       - (Code D17-04-Load_image_into_the_image_view)
   - _`IB Main.Storyboard`_
     - Change the default setting that makes images stretch to fit the screen.
       - Select the image view
          - Attributes inspector (⌥⌘4)
          - Content Mode: _Aspect Fill_
   - _`DetailViewController.swift`_ `viewWillAppear()` `viewWillDisappear()`
     - Allow users to view the images full screen with no navigation bar getting in their way
       - (Code D17-04-Toggle_bars_on_top_of_the_screen)
5. Add gray arrows (Disclosure Indicator) at the right of the table view cells.
   - _`IB Main.Storyboard`_
     - Select "Picture"
       - Accessory: _Disclosure Indicator_
6. Place the text "Storm Viewer" in the gray bar at the top of the main screen.
   - _`ViewController.swift`_ `viewDidLoad()`
     - (Code D17-06-Initialize_title_instance_property)
7. Enable large titles across the App.
   - `ViewController.swift`_ `viewDidLoad()`
     - (Code D17-07-Large_titles_across_the_App)
8. Apple recomends the use of large titles only on the first screen of any App.
   - `DetailViewController.swift`_ `viewDidLoad()`
     - (Code D17-08-No_large_titles_on_view_controller)

## INSTRUCTIONS [Hacking with Swift Day 18 Challenges](https://www.hackingwithswift.com/100/18)

1. Select the text label inside your _table view cell_ and adjust its font size to something larger.
   - _`IB Main.Storyboard`_
     - Select Title lable in table view cell
         - Attributes inspector (⌥⌘4)
2. In your _table view_, show the image names in sorted order, so “nssl0033.jpg” comes before “nssl0034.jpg”
   - _`ViewController.swift`_ `viewDidLoad()`
     - (Code D18-02-Show_image_names_in_sorted_order)
3. Rather than show image names in the detail _title bar_ , show “Picture X of Y”
   - _`DetailViewController.swift`_ `viewDidLoad()`
     - where Y is the total number of images
     - and X is the selected picture’s position in the array.
     - (Code D18-03-Show_Picture_X_of_Y)
