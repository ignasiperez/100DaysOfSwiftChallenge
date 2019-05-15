# Project 3-C1 - Storm Viewer with Sharing App

Extension of the Storm Viewer App.

Now users can share images with their friends and save images to their device’s Photo Library.

## INSTRUCTIONS [Hacking with Swift Day 22 Challence 1](https://www.hackingwithswift.com/read/3/2/uiactivityviewcontroller-explained)

1. Add an _action bar button system item_ on the right side of the _navigation item_.
   - _`DetailViewController.swift`_ `viewDidLoad()`
     - (Code D22-01-Add_a_bar_button_system_item)
2. Create a method that is called by the underlying objective-c engine when the user presses the action button.
   - _`DetailViewController.swift`_ `shareTapped()`
     - Inside this method (Code D22-Method_called_when_user_taps_action_button):
       - Convert the storm image displayed on the detail screen to JPEG format with a compression quality of 80%
       - Create an activity view controller to share content with other apps and services and tell iOS that it should be anchored to the right bar button Item of our navigation item.
3. Show a message asking whether the user is ok with the app writing to their photo library.
   - _`Xcode Info.plist`_
     - Inside **`Info.plist`** file
       - Privacy - Photo Library Additions Usage Description: _We need to save photos you like._

## INSTRUCTIONS [Hacking with Swift Day 22 Challenge 1](https://www.hackingwithswift.com/read/3/3/wrap-up)

1. Add the image name to the list of items that are shared.
   - _`DetailViewController.swift`_ `shareTapped()`
     - (Code D22-C1-Add_image_name_to_list_of_items)
