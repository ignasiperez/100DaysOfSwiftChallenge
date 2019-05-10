//
//  ViewController.swift
//  C04A-EasyBrowser
//
//  Created by Ignasi Perez-Valls on 10/05/2019.
//  Copyright © 2019 ignasiSwift. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    //  ************************************************************
    //  MARK: - Instance properties
    //
    var webView: WKWebView!
    var progressView: UIProgressView!
    
    var websites = ["apple.com", "hackingwithswift.com"]
    
    
    //  ************************************************************
    //  MARK: - Override UIViewController methods
    //
    //  D24-04. DOWNLOAD A WEB PAGE
    override func loadView() {
        print("ViewController loadDidLoad()")
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("\nViewController viewDidLoad()")
        
        // D25-2. ADD A `UIProgressView` TO OUR TOOLBAR TO SHOW HOW FAR THE PAGE IS THROUGH LOADING
        //  - Register as an observer
        webView.addObserver(
            self,
            forKeyPath: #keyPath(WKWebView.estimatedProgress),
            options: .new,
            context: nil)


        // D24-4. CHOOSE THE WEBSITE
        //  - Add a button to the navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Open…",
            style: .plain,
            target: self,
            action: #selector(openTapped)
        )
        
        // D25-02. ADD A `UIProgressView` TO OUR TOOLBAR TO SHOW HOW FAR THE PAGE IS THROUGH LOADING
        progressView = UIProgressView(
            progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(
            customView: progressView)

        
        // D25-01. SHOW A TOOLBAR AT THE BOTTOM OF THE SCREEN WITH A REFRESH BUTTON ON THE RIGHT SIDE.
        let spacer = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil, action: nil)
        
        let refresh = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: webView,
            action: #selector(webView.reload))
        
        toolbarItems = [progressButton, spacer, refresh]
        navigationController?.isToolbarHidden = false

        
        // D24-3. DOWNLOAD A WEB PAGE
        // let url = URL(string: "https://www.hackingwithswift.com")!
        // webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        
        // D25-3. NAVIGATE TO A WEB SITE ONLY IF ITS URL IS IN OUR SAFE LIST
        // - Modify the web view's initial web page so that it's not hard-coded.
        let url = URL(string: "https://" + websites[0])!
        webView.load(URLRequest(url: url))

    }
    
    
    //  ************************************************************
    //  MARK: - Implementation WKNavigationDelegate Protocol methods
    //
    // D24-05. SETTING THE TITLE IN THE NAVIGATION BAR WHEN THE PAGE FINISH DOWNLOADING
    func webView(_ webView: WKWebView,
                 didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    
    // D25-3. NAVIGATE TO A WEB SITE ONLY IF ITS URL IS IN OUR SAFE LIST
    //  - Evaluate the URL to see whether it's in our safe list
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy)
        -> Void) {
        let url = navigationAction.request.url
        
        if let host = url?.host {
            for website in websites {
                if host.contains(website) {
                    decisionHandler(.allow)
                    return
                }
            }
        }
        
        decisionHandler(.cancel)
    }
    
    
    
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy)
        -> Void) {
        
    }

    
    
    //  ************************************************************
    //  MARK: - Implementation OBSERVER Protocol methods
    //
    // D24-05. SETTING THE TITLE IN THE NAVIGATION BAR WHEN THE PAGE FINISH DOWNLOADING
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }

    

    //  ************************************************************
    //  MARK: - Instance methods
    //
    // D24-04. CHOOSE THE WEBSITE
    //  - When user taps the `Open...` button, iOS engine shows a   message with different websites to choose.
    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page…",
                                   message: nil,
                                   preferredStyle: .actionSheet)
        
        //ac.addAction(UIAlertAction(title: "apple.com",
        //                           style: .default,
        //                           handler: openPage))
        
        //ac.addAction(UIAlertAction(title: "hackingwithswift.com",
        //                           style: .default,
        //                           handler: openPage))
        
        for website in websites {
            ac.addAction(UIAlertAction(title: website,
                                       style: .default,
                                       handler: openPage)
            )
        }

        
        ac.addAction(UIAlertAction(title: "Cancel",
                                   style: .cancel))
        
        ac.popoverPresentationController?.barButtonItem =
            self.navigationItem.rightBarButtonItem
        
        present(ac, animated: true)
    }
    
    // D24-04. CHOOSE THE WEBSITE
    //  - When user chooses one website in the alert action, iOS engine calls this method.
    func openPage(action: UIAlertAction) {
        let url = URL(string: "https://" + action.title!)!
        webView.load(URLRequest(url: url))
    }

}
