# Easy Browser App

Functional Web browser embedded in the App.

## INSTRUCTIONS [Day 24](https://www.hackingwithswift.com/100/24)

1. SETTING UP
   - Create a new Xcode project
     - Product Name: _Project4_
   - Place the table view controller into a navigation controller

2. USE OF A DELEGATION SOLUTION TO TELL `WKWebView` THAT WE WANT TO BE INFORMED WHEN ANY PAGE NAVIGATION HAPPENS
   - _`ViewController.swift`_
     - Import **`WebKit`** Framework
     - Add `webView` property of type `WKWebView`
     - Add method `loadView()` (Code 1)
     - Implement the `WKNavigationDelegate` protocol

3. DOWNLOAD A WEB PAGE
   - _`ViewController.swift`_ `loadView()`
     - Create the constant _`url`_ of type `URL`
       - "https://www.hackingwithswift.com"
     - Create a new `URLRequest` object from the url, and give it to our web view to load.
     - Allow users to swipe from the left or right edge to move backward or forward in their web browsing.
       
4. CHOOSE THE WEBSITE
   - _`ViewController.swift`_ `viewDidLoad()`
     - Add a button to the navigation bar (Code 2)
       - _`Open...`_
   - _`ViewController.swift`_ _`openTapped()`_
     - When user taps the _`Open...`_ button, iOS engine shows a message with different websites to choose. (Code 3)
   - _`ViewController.swift`_ _`openPage(action: UIAlertAction)`_
     - When user chooses one website in the alert action, iOS engine calls to _`openPage(action: UIAlertAction)`_ instance method. (Code 4)
5. SETTING THE TITLE IN THE NAVIGATION BAR WHEN THE PAGE FINISH DOWNLOADING
   - _`ViewController.swift`_ _`webView(..., didFinish navigation: WKNavigation)`_
     - (Code 5) 

Code 1

```swift
override func loadView() {
  webView = WKWebView()
  webView.navigation····· = self
  view = ·····
}
```

Code 2

```swift
navigationItem.right····· = UIBarButtonItem(
  title: "Open…", 
  style: .·····, 
  target: ·····, 
  action: #selector(openTapped)
)
```

Code 3

```swift
@objc func openTapped() {
  let ac = UIAlertController(title: "Open page…",
                              message: nil,
                              preferredStyle: .action·····)

  ac.addAction(UIAlertAction(title: "apple.com", 
                              style: .·····, 
                              handler: openPage))

  ac.addAction(UIAlertAction(title: "hackingwithswift.com", 
                              style: .·····, 
                              handler: openPage))

  ac.addAction(UIAlertAction(title: "Cancel", 
                              style: .·····))

  ac.popoverPresentation...?.barButtonItem = 
                            self.navigation·····.rightBarButtonItem

  present(·····, animated: true)
}
```

Code 4

```swift
func openPage(action: UIAlertAction) {
  let url = URL(string: "https://" + a·····.title!)!
  webView.load(U·····(url: url))
}
```

Code 5

```swift
func webView(_ webView: WKWebView,
             didFinish navigation: WKNavigation!) {
  title = webView.·····
}
```
