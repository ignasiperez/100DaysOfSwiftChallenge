# Easy Browser App

Functional Web browser embedded in the App.

## INSTRUCTIONS [Hacking with Swift Day 24](https://www.hackingwithswift.com/100/24)

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
   - _`ViewController.swift`_ `webView(..., didFinish navigation: WKNavigation)`
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

## INSTRUCTIONS [Hacking with Swift Day 25](https://www.hackingwithswift.com/100/25)

1. SHOW A TOOLBAR AT THE BOTTOM OF THE SCREEN WITH A REFRESH BUTTON ON THE RIGHT SIDE.
   - _`ViewController.swift`_ `viewDidLoad()`
     - (Code 1)
2. ADD A `UIProgressView` TO OUR TOOLBAR TO SHOW HOW FAR THE PAGE IS THROUGH LOADING
   - _`ViewController.swift`_
     - Declare the _`progressView`_ property of type `UIProgressView`.
   - _`ViewController.swift`_ `viewDidLoad()`  
     - Create a new instance with the default style (Code 2)
     - Add to the _`toolbarItems`_ array the new progress view (Code 3)
     - Register as an observer (Code 4)
     - Listening when an observed value has changed (Code 5)
3. NAVIGATE TO A WEB SITE ONLY IF ITS URL IS IN OUR SAFE LIST
   - _`ViewController.swift`_
     - Refactor our code so there's a shared array of allowed websites (Code 6)
   - _`ViewController.swift`_ `viewDidLoad()`
     - Modify the web view's initial web page so that it's not hard-coded (Code 7)
   - _`ViewController.swift`_`webView(..., decidePolicyFor navigationAction: WKNavigationAction, ...)`
     - Evaluate the URL to see whether it's in our safe list (Code 8)
 
   Code 1

```swift
let spacer = UIBarButtonItem(
    barButtonSystemItem: .flex·····,
    target: ·····,
    action: ·····)

let refresh = UIBarButtonItem(
    barButtonSystemItem: .re·····,
    target: w·····, 
    action: #selector(webView.·····))

toolbarItems = [spacer, refresh]
navigationController?.isToolbarHidden = false
```

Code 2

```swift
progressView = UIProgressView(
      progressViewStyle: .····)
      progressView.size·····()
let progressButton = UIBarButtonItem(
      customView: ·····)
```

Code 3

```swift
toolbarItems = [progressButton, spacer, refresh]
```

Code 4

```swift
 webView.addObserver(
            self,
            forKeyPath: #keyPath(WKWebView.·····),
            options: .·····,
            context: ·····)
```

Code 5

```swift
override func observeValue(forKeyPath keyPath: String?,
                            of object: Any?,
                            change: [NSKeyValueChangeKey : Any]?,
                            context: UnsafeMutableRawPointer?) {
  if keyPath == "esti·····" {
    progressView.progress = ·····(webView.estimatedProgress)
  }
}
```

Code 6

```swift
var websites = ["apple.com", "hackingwithswift.com"]
```

Code 7

```swift
for website in websites {
  ac.addAction(UIAlertAction(title: website,
                              style: .·····,
                              handler: openPage)
  )
}

Code 8

```swift
func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy)
        -> Void) {
  let url = navigationAction.request.·····
        
  if let host = url?.host {
    for website in websites {
      if host.·····(website) {
        decisionHandler(.·····)
          return
      }
    }
  }
        
  decisionHandler(.·····)
}
```

## INSTRUCTIONS [Hacking with Swift Challenges 04A Day 26](https://www.hackingwithswift.com/read/4/6/wrap-up)

1. IF USERS TRY TO VISIT A URL THAT ISN’T ALLOWED, SHOW AN ALERT SAYING IT’S BLOCKED
2. TRY MAKING TWO NEW TOOLBAR ITEMS WITH THE TITLES BACK AND FORWARD
