# Project 4-C2 - Easy Browser App

Functional Web browser embedded in the App.

## INSTRUCTIONS [Hacking with Swift Day 24](https://www.hackingwithswift.com/100/24)

1. Setting up.
   - Create a new Xcode project
     - Product Name: _Project4_
   - Place the table view controller into a navigation controller

2. Use of a delegation solution to tell `WKWebView` that we want to be informed when any page navigation happens.
   - _`ViewController.swift`_
     - Import **`WebKit`** Framework
     - Declare `webView` property of type `WKWebView`
   - _`ViewController.swift`_ `loadView()`
     - Make our _view_ (the root view of the _view controller_) the _web view_.
       - (Code D24-02-Make_our_view_the_web_view)
   - _`ViewController.swift`_
     - Inherit from `UIViewController` and implement `WKNavigationDelegate` protocol.
       - (Code D24-02-Inherit_UIViewController_and_implement_WKNavigationDelegate_protocol)
3. Download a web page.
   - _`ViewController.swift`_ `viewDidView()`
     - Make a URL request to "https://www.hackingwithswift.com"
       - (Code D24-03-Make_a_URL_request)
     - Allow users to swipe from the left or right edge to move backward or forward in their web browsing.
       - (Code D24-03-Allow_users_to_swipe-from_left_or_right_edge)
4. Choose the website.
   - _`ViewController.swift`_ `viewDidLoad()`
     - Add an action bar button item on the right side of the navigation item with title "Open..."
       - (Code D24-04-Add_a_bar_button_item)
   - _`ViewController.swift`_ _`openTapped()`_
     - When user taps the _`Open...`_ button, iOS engine shows a message with different websites to choose.
        - (Code D24-04-Method_called_when_user_taps_action_button)
   - _`ViewController.swift`_ _`openPage(action: UIAlertAction)`_
     - When user chooses one website in the _alert action_, iOS engine calls this instance method. 
       - (Code D24-04-Download_webpage_from_alert_action)
5. Setting the title in the navigation bar when the page finish downloading.
   - _`ViewController.swift`_ `webView(..., didFinish navigation: WKNavigation)`
     - (Code D24-5-Setting_title_in_navigationbar_when_page_finish_downloading)

## INSTRUCTIONS [Hacking with Swift Day 25](https://www.hackingwithswift.com/100/25)

1. Show a toolbar at the bottom of the screen with a refresh button on the right side.
   - _`ViewController.swift`_ `viewDidLoad()`
     - (Code D25-01-Show_toolbar_bottom_screen)
2. Add a `UIProgressView` to our _toolbar_ to show how far the page is through loading.
   - _`ViewController.swift`_
     - Declare the _`progressView`_ property of type `UIProgressView`.
   - _`ViewController.swift`_ `setupToolBar()()`  
     - Create a new instance of `UIProgressView` and add to the _`toolbarItems`_ array the new progress view.
       - (Code D25-02-Add_a_progress_view_to_toolbar)
   - _`ViewController.swift`_ `viewDidLoad()`
     - Register as an observer.
       - (Code D25-02-Register_as_an_observer)
     - Listening when an observed value has changed 
       - (Code D25-02-Listening_observed_value_changes)
3. Navigate to a web site only if its URL is in our safe list.
   - _`ViewController.swift`_
     - Create a array called _`websites`_ with the websites allowed on this App.
       - (Code D25-03-Websites_allowed_on_this_App)
   - _`ViewController.swift`_ `openTapped()`
     - Modify the web view's initial web page so that it's not hard-coded (Code 7)
       - (Code D25-03-Avoiding_hard_coding)
   - _`ViewController.swift`_`webView(..., decidePolicyFor navigationAction: WKNavigationAction, ...)`
     - Evaluate the URL to see whether it's in our safe list (Code 8)
       - (Code D25-03 Evaluate_URL_to-see-whether_it's_in_our_safe_list)

## INSTRUCTIONS [Hacking with Swift Day 26 Challenge 2](https://www.hackingwithswift.com/read/4/6/wrap-up)

1. If users try to visit a url that isn’t allowed, show an alert saying it’s blocked.
   - (Code D26-C1-Message_website_not_allowed)
2. Try making two new _toolbar items_ with the titles back and forward.
   - (Code D26-C2-Two_new_toolbar_items_back_and_forward)
