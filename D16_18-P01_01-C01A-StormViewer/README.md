# Storm Viewer App

This App lets users scroll through a list of images, then select one to view.

## INSTRUCTIONS [Hacking with Swift Day 16](https://www.hackingwithswift.com/100/16)

1. SETTING UP
   - _`Xcode`_
     - Create a new Xcode project.
       - File > New > Project...
         - Single View App > Next
           - Product Name: _Project1_
           - Language: _Swift_
     - Copy the Storm images in your project.
2. STORE THE NAME OF THE IMAGES WITH PREFIX _`nssl`_ from THE APP BUNDLE INTO AN ARRAY CALLED _`pictures`_.
   - _`ViewController.swift`_
     - (Code D16-02-Read from App Bundle to an array)
3. TABLE SETUP TO SHOW A LIST OF IMAGES IN MAIN SCREEN.
   - _`ViewController.swift`
     - Tell this class that instead of inheriting from a view controller should inherits from a table view controller. (Code D16-03-Inherit from a table view controller)
   - _`IB Main.Storyboard`_
     - Access to the Xcode Graphical Editor (Interface Builder, IB) through  _`Main.Storyboard`_. 
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
     - Place the table view controller into a navigation controller
       - Click inside the view controller
         - Editor menu Embed In > Navigation Controller.
       - **`UINavigationController`**
4. _`ViewController.swift`_
   - Make the table view show the list of “nssl” pictures
      - iOS engine calls `tableView(..., numberOfRowsInSection section: Int)` method  to know how many rows should be shown. (Code D16-03-Return the number of rows in a given section)
      - iOS engine calls `tableView(..., cellForRowAt indexPath: IndexPath)` method to show the picture's names. (Code D16-03-Write the name of each picture in each cell of the table view)

Code D16-02-Read from App Bundle to an array

```swift
let fm = FileManager.default
let path = Bundle.main.resourcePath!
let items = try! fm.contentsOfDirectory(atPath: path)
        
for item in items {
    if item.hasPrefix("nssl") {
      pictures.append(item)
  }
}
```

Code D16-03-Inherit from a table view controller

```swift
class ViewController: UITableViewController {
```

Code D16-03-Return the number of rows in a given section

```swift
override func tableView(_ tableView: UITableView,
                        numberOfRowsInSection section: Int) -> Int {
  return pictures.count
}
```

Code D16-03-Write the name of each picture in each cell of the table view

```swift
override func tableView(_ tableView: UITableView,
                        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let cell = tableView.dequeueReusableCell(withIdentifier: "Picture",
                                           for: indexPath)

  cell.textLabel?.text = pictures[indexPath.row]

  return cell
}
```

## INSTRUCTIONS [Hacking with Swift Day 17](https://www.hackingwithswift.com/100/17)

1. CREATE A DETAIL SCREEN THAT WILL BE SHOWN WHEN THE USER TAPS ANY ROW
   - _`Xcode`_
     - Create a new screen that will be shown when the user taps any row.
     - New > File > iOS > Cocoa Touch Class
       - Name: _DetailViewController_
       - Subclass Of: _UIViewController_
   - _`IB Main.Storyboard`_
     - Add a new view controller
       - Object Library (⌘⇧L)
         - `UIViewController`
     - Tell Xcode that this storyboard view controller is the same one we have in code inside _`DetailViewController.swift`_.
       - Identity Inspector (⌥⌘3)
       - Class: _DetailViewController_
     - Give a name to the new view controller
       - Identity Inspector (⌥⌘3)
         - Storyboard ID: _Detail_
2. ADD AN IMAGE VIEW TO THE DETAIL SCREEN
   - _`IB Main.Storyboard`_
     - Object Library (⌘⇧L)
       - `UIImageView`
     - Tell the image view how to size itself for different iPhone and iPad sizes. This will be done with the help of the Auto Layout constraints.
       - Select the image view 
         - Editor menu > RESOLVE Auto Layout Issues > Reset To Suggested Constraints (⇧⌥⌘=)
3. CONNCET THE NEW IMAGE VIEW TO THE DETAIL VIEW CONTROLLER CODE
   - _`IB Main.Storyboard`_
     - Select the image view
       - View > Assistant Editor > Show Assistant Editor from the menu (⌥⌘↵)
         - Hold down Ctrl and your mouse button, drag from the image view into your code.
           - Connection: _Outlet_
           - Object: _Detail Vieww Controller_
           - Name: _imageView_
           - Type: _UIImageView_
           - _Strong_
   - _`DetailViewController.swift`_
     - Create a property in DetailViewController of type `String` that will hold the name of the image to load
       - (Code D17-03-Declare_Instance_Property_selectedImage)
4. SHOW THE DETAIL SCREEN WHEN ANY TABLE ROW IS TAPPED, AND HAVE IT SHOW THE SELECTED IMAGE.
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
5. ADD GRAY ARROWS (DISCLOSURE INDICATOR) AT THE RIGTH OF THE TABLE VIEW CELLS.
   - _`IB Main.Storyboard`_
     - Select "Picture"
       - Accessory: _Disclosure Indicator_
6. PLACE THE TEXT "Storm Viewer" IN THE GRAY BAR AT THE TOP OF THE MAIN SCREEN
   - _`ViewController.swift`_ `viewDidLoad()`
   - Place the text "Storm Viewer" in the gray bar at the top
     - (Code D17-06-Initialize_title_Instance_Property)
7. ENABLE LARGE TITLES ACROSS THE APP
   - `ViewController.swift`_ `viewDidLoad()`
     - (Code D17-07-Large_titles_across_the_App)
8. APPLE RECOMMEDS YOU USE LARGE TITLES ONLY ON THE FIRST SCREEN OF YOUR APP.
   - `DetailViewController.swift`_ `viewDidLoad()`
     - (Code D17-08-No_large_titles_on_view_controller)

Code D17-03-Declare_Instance_Property_selectedImage

```swift
var selectedImage: String?
```

Code D17-04-Put_the_detail_view_controller_in_the_foreground

```swift
override func tableView(_ tableView: UITableView, 
                        didSelectRowAt indexPath: IndexPath) {
  // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
  if let vc =  
    storyboard?.instantiateViewController(
      withIdentifier: "Detail") as? DetailViewController {
    // 2: success! Set its selectedImage property
    vc.selectedImage = pictures[indexPath.row]
    // 3: now push it onto the navigation controller
    navigationController?.pushViewController(vc, animated: true)
  }
```

Code D17-04-Load_image_into_the_image_view

```swift
if let imageToLoad = selectedImage {
    imageView.image  = UIImage(named: imageToLoad)
}
```

Code D17-04-Toggle_bars_on_top_of_the_screen)

```swift
override func viewWillAppear(_ animated: Bool) {
  super.viewWillAppear(animated)
  navigationController?.hidesBarsOnTap = true
}

override func viewWillDisappear(_ animated: Bool) {
  super.viewWillDisappear(animated)
  navigationController?.hidesBarsOnTap = false
}
```

Code D17-06-Initialize_title_Instance_Property

```swift
title = "Storm Viewer"
```

Code D17-07-Large_titles_across_the_App

```swift
navigationController?.navigationBar.prefersLargeTitles = true
```

Code D17-08-No_large_titles_on_view_controller

```swift
navigationItem.largeTitleDisplayMode = .never
```

## INSTRUCTIONS [Hacking with Swift Day 18 Challenges](https://www.hackingwithswift.com/100/18)

1. SELECT THE TEXT LABEL INSIDE YOUR TABLE VIEW CELL AND ADJUST ITS FONT SIZE TO SOMETHING LARGER.
   - _`IB Main.Storyboard`_
     - Select Title lable in table view cell
         - Attributes inspector (⌥⌘4)
2. IN YOUR MAIN TABLE VIEW, SHOW THE IMAGE NAMES IN SORTED ORDER, SO “nssl0033.jpg” COMES BEFORE “nssl0034.jpg”
   - _`ViewController.swift`_ `viewDidLoad()`
3. RATHER THAN SHOW IMAGE NAMES IN THE DETAIL TITLE BAR, SHOW “Picture X of Y”
   - _`DetailViewController.swift`_ `viewDidLoad()`
     - where Y is the total number of images 
     - and X is the selected picture’s position in the array.
