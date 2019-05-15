# Storm Viewer Social App

Extension of the Storm Viewer App.

Now users can share images with their friends and save images to their device’s Photo Library.

## INSTRUCTIONS [Hacking with Swift Day 22](https://www.hackingwithswift.com/100/22)

1. ADD AN ACTION BAR BUTTON SYSTEM ITEM ON THE RIGHT SIDE OF THE NAVIGATION ITEM
   - _`DetailViewController.swift`_ `viewDidLoad()`
     - (Code D22-01-Add_a_bar_button_system_item)
2. CREATE A METHOD THAT IS CALLED BY THE UNDERLYING OBJECTIVE-C ENGINE WHEN THE USER PRESSES THE ACTION BUTTON.
   - _`DetailViewController.swift`_ `shareTapped()`
     - Inside this method (Code D22-02-Method_called_when_user_taps_action_button):
       - Convert the storm image displayed on the detail screen to JPEG format with a compression quality of 80%
       - Create an activity view controller to share content with other apps and services and tell iOS that it should be anchored to the right bar button Item of our navigation item.
3. SHOW A MESSAGE ASKING WHETHER THE USER IS OK WITH THE APP WRITING TO THEIR PHOTO LIBRARY.
   - _`Xcode Info.plist`_
     - Inside **`Info.plist`** file
       - Privacy - Photo Library Additions Usage Description: _We need to save photos you like._

Code D22-01-Add_a_bar_button_system_item

```swift
navigationItem.rightBarButtonItem = 
       UIBarButtonItem(barButtonSystemItem: .action,
       target: self,
       action: #selector(shareTapped))
```

Code D22-02-Method_called_when_user_taps_action_button

```swift
@objc func shareTapped() {
    guard let image = 
    imageView.image?.jpegData(compressionQuality: 0.8) else {
      print("No image found")
      return
    }

    let avc = UIActivityViewController(activityItems: [image],
                                      applicationActivities: [])
    
    avc.popoverPresentationController?.barButtonItem = 
        navigationItem.rightBarButtonItem
    present(avc, animated: true)
}
```

## INSTRUCTIONS [Hacking with Swift Day 22 Challenge 3A](https://www.hackingwithswift.com/read/3/3/wrap-up)

1. ADD THE IMAGE NAME TO THE LIST OF ITEMS THAT ARE SHARED
   - _`DetailViewController.swift`_ `shareTapped()`
