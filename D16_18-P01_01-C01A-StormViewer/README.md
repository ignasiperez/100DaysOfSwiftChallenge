# Storm Viewer App

This App lets users scroll through a list of images, then select one to view.

## INSTRUCTIONS [Day 16](https://www.hackingwithswift.com/100/16)

- Create a new Xcode project.
  - Xcode
- Copy the Storm images in your Xcode project.
  - Xcode
1. Store the name of the images with prefix _`nssl`_ of the App bundle into an array called _`pictures`_.
   - **`FileManager`**, **`Bundle`**, **`Array`**, **`String`**
2. In order to have a list of images in our main screen, we have to tell the class _`ViewController`_ that instead of inheriting from a view controller now inherits from a table view controller.
   - **`UITableViewController`**
3. Access to the Xcode Graphical Editor (Interface Builder, IB) through the _`Main.Storyboard`_. We have to delete "View Controller Scene" and create a new table view controller.
   - **`UITableViewController`**
4. We need to tell Xcode that this storyboard table view controller is the same one we have in code inside _`ViewController.swift`_.
   - Identity Inspector (Alt+Cmd+3)
5. We need to tell the iOS engine that this new table view controller is what should be shown when the app first runs.
   - Attributes inspector (Alt+Cmd+4)
     - View Controller: _Is Initial View Controller_
6. From our code we'll need to identificate the table view cells that will show the picture's names. While you’re in the Attributes inspector, change also the Style option.
   - Document Outline (Editor > Show Document Outline | Hide Document Outline)
     - Select "Table View Cell"
   - Attributes inspector (Alt+Cmd+4)
     - Identifier: _Picture_
     - Style: _Basic_
7. Place the table view controller into a navigation controller
   - Editor menu Embed In > Navigation Controller.
   - **`UINavigationController`**
8. Make the table view show the list of “nssl” pictures
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