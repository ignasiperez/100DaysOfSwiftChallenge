# Storm Viewer Social App 

Extension of the Storm viewer App. 

Now users can share images with their friends and save images to their device’s Photo Library.

## INSTRUCTIONS [Day 22](https://www.hackingwithswift.com/100/22)

1. _`DetailViewController.swift`_ `viewDidLoad()`
   - Create a system action bar button item on the right side of the naviagation item.
   - (Code 1)
   - **`UINavigationItem`**, **`UIBarButtonItem`**
2. _`DetailViewController.swift`_ `shareTapped()`
   - Create a method that is called by the underlying Objective-C engine when the user presses the action button.
   - **`@objc`**
   - Inside this method:
     - Convert the storm image displayed on the detail screen to JPEG format with a compression quality of 80%
       - `UIImageView`,`UIImage`, (Code 2)
     - Create an activity view controller to share content with other apps and services and tell iOS that it should be anchored to the right bar button Item of our navigation item.
     - **`UIActivityViewController`**, **`UINavigationItem`** (Code 2)
3. _`Xcode Info.plist`_
   - Show a message asking whether the user is OK with the app writing to their Photo Library.
     - Inside **`Info.plist`** file
       - Privacy - Photo Library Additions Usage Description: _We need to save photos you like._

Code 1

```swift
navigationItem.right... = 
       UIBarButtonItem(barButton...: .action,
       target: ...,
       action: #se...(shareTapped))
```

Code 2

```swift
@objc func shareTapped() {
    guard let image = 
    imageView.image?.jpegData(compressionQuality: ...) else {
        print("No image found")
        return
    }

    let avc = UIActivityViewController(activity...: [...],
                                      applicationActivities: [])
    
    avc.popoverPresen...?.barButtonItem =
        navigationItem.right...
    present(..., animated: true)
}
```

## INSTRUCTIONS [Day 22 Challenge 3A](https://www.hackingwithswift.com/read/3/3/wrap-up)

1. _`DetailViewController.swift`_ `shareTapped()`
   - Add the image name to the list of items that are shared.
     - `UIActivityViewController`
