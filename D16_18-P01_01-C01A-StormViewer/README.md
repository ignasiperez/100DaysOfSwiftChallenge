# Storm Viewer App

This App lets users scroll through a list of images, then select one to view.

## INSTRUCTIONS [Day 16](https://www.hackingwithswift.com/100/16)

- _`Xcode`_
  - Create a new Xcode project.
    - File > New > Project...
      - Single View App > Next
        - Product Name: _Project1_
        - Language: _Swift_
  - Copy the Storm images in your project.

1. _`ViewController.swift`_
   - Store the name of the images with prefix _`nssl`_ of the App bundle into an array called _`pictures`_.
       - **`FileManager`**, **`Bundle`**, **`Array`**, **`String`**
   - In order to have a list of images in our main screen, we have to tell this class that instead of inheriting from a view controller now inherits from a table view controller.
       - **`UITableViewController`**
2. _`IB Main.Storyboard`_
   - Access to the Xcode Graphical Editor (Interface Builder, IB) through the _`Main.Storyboard`_. 
   - We have to delete "View Controller Scene" and create a new table view controller.
     - **`UITableViewController`**
   - We need to tell Xcode that this storyboard table view controller is the same one we have in code inside _`ViewController.swift`_.
     - Identity Inspector (⌥⌘3)
       - Class: _ViewController_
   - We need to tell the iOS engine that this new table view controller is what should be shown when the app first runs.
       - Attributes inspector (⌥⌘4)
         - View Controller: _Is Initial View Controller_
   - From our code we'll need to identificate the table view cells that will show the picture's names. While you’re in the Attributes inspector change also the Style option.
     - Document Outline (Editor > Show Document Outline | Hide Document Outline)
       - Select "Table View Cell"
         - Attributes inspector (⌥⌘4)
           - Identifier: _Picture_
           - Style: _Basic_
3. _`Xcode`_
   - Place the table view controller into a navigation controller
     - Editor menu Embed In > Navigation Controller.
       - **`UINavigationController`**
4. _`ViewController.swift`_
   - Make the table view show the list of “nssl” pictures
      - iOS engine calls `tableView(..., numberOfRowsInSection section: Int)` method  to know how many rows should be shown. (Code 1)
      - iOS engine calls `tableView(..., cellForRowAt indexPath: IndexPath)` method to show the picture's names. (Code 2)

Code 1

```swift
override func tableView(_ tableView: UITableView, 
                        numberOfRowsInSection section: Int) -> Int {
    //TODO: Return the number of images in the pictures array
}
```

Code 2

```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //TODO: let cell = tableView.dequeueReusableCell(withIdentifier: ..., for: ...)
    //TODO: cell.textLabel?.text = pictures[...]
    return cell
}
```

## INSTRUCTIONS [Day 17](https://www.hackingwithswift.com/100/17)

- _`Xcode`_
  - Create a new screen that will be shown when the user taps any row.
    - New > File > iOS > Cocoa Touch Class
      - Name: _DetailViewController_
      - Subclass Of: _UIViewController_

1. _`IB Main.Storyboard`_
   - Add a new view controller
     - Object Library (⌘⇧L)
       - `UIViewController`
   - Give a name to the new view controller
      - Identity Inspector (⌥⌘3)
      - Storyboard ID: _Detail_
   - Add an image view to the view controller
      - Object Library (⌘⇧L)
         - `UIImageView`
   - Tell the image view how to size itself for different iPhone and iPad sizes.
     - This will be done with the help of the Auto Layout constraints
        - Select the image view 
          - Editor menu > RESOLVE Auto Layout Issues > Reset To Suggested Constraints (⇧⌥⌘=)
   - Connect the new image view to some code
     - Select the image view
       - View > Assistant Editor > Show Assistant Editor from the menu (⌥⌘↵)
         - Hold down Ctrl and your mouse button, drag from the image view into your code.
         - Connection: _Outlet_
         - Object: _Detail Vieww Controller_
         - Name: _imageView_
         - Type: _UIImageView_
         - _Strong_
2. _`DetailViewController.swift`_
   - Create a property in DetailViewController of type `String` that will hold the name of the image to load
     - _`selectedImage`_
3. _`ViewController.swift`_
   - Show the detail screen when any table row is tapped, and have it show the selected image
     - When the user taps one of the rows of the table view the iOS engine calls `tableView(..., didSelectRowAt indexPath: IndexPath)` (Code 1)
4. _`DetailViewController.swift`_ `viewDidLoad()`
   - Make the image actually load into the image view.
     - (Code 2)
5. _`IB Main.Storyboard`_
     - Change the default setting that makes that all the images are being stretched to fit the screen.
       - Select the image view
         - Attributes inspector (⌥⌘4)
         - Content Mode: _Aspect Fill_
6. _`DetailViewController.swift`_ `viewWillAppear()` `viewWillDisappear()`
   - Allow users to view the images full screen with no navigation bar getting in their way
     - **`UINavigationController`**
7. _`IB Main.Storyboard`_
   - Add gray arrows (disclosure indicator) at the right of the table view cells.
     - Select "Picture"
       - Accessory: _Disclosure Indicator_
8. _`ViewController.swift`_ `viewDidLoad()`
   - Place the text "Storm Viewer" in the gray bar at the top
     - `title`
9. _`DetailViewController.swift`_
   - Place the name of the selected image in the gray bar at the top
     - `title`
10._`ViewController.swift`_ `viewDidLoad()`
   - Enables large titles across our app
     - `UINavigationBar`
11._`DetailViewController.swift`_ `viewDidLoad()`
   - Apple recommends you use large titles only on the first screen of your app.
     - UINavigationItem

Code 1

```swift
override func tableView(_ tableView: UITableView, 
                        didSelectRowAt indexPath: IndexPath) {
     // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
     if let vc =  
          storyboard?.instantiateViewController(
               withIdentifier: "...") as? ... {
          // 2: success! Set its selectedImage property
          vc.selected... = pictures[...]
          // 3: now push it onto the navigation controller
	     navigationController?.push...(..., animated: true)
     }
}
````

Code 2

```swift
if let imageToLoad = selectedImage {
    imageView.im...  = UIImage(named: ...)
}
```
