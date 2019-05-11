//
//  ViewController.swift
//  C04A-EasyBrowser
//
//  Created by Ignasi Perez-Valls on 10/05/2019.
//  Copyright © 2019 ignasiSwift. All rights reserved.

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    //  ************************************************************
    //  MARK: - Instance properties
    //
    var webView: WKWebView!
    var progressView: UIProgressView!
    
    var websites = ["developer.apple.com", "www.hackingwithswift.com"]
    
    
    //  ************************************************************
    //  MARK: - Override UIViewController methods
    //
    override func loadView() {
        print("\nViewController loadView()")
        
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
        
        
        setupToolBar()
        
        
        // D24-3. DOWNLOAD A WEB PAGE
        // let url = URL(string: "https://www.hackingwithswift.com")!
        // webView.load(URLRequest(url: url))
        
        
        webView.allowsBackForwardNavigationGestures = true
        
        
        // D25-3. NAVIGATE TO A WEB SITE ONLY IF ITS URL IS IN OUR SAFE LIST
        // - Modify the web view's initial web page so that it's not hard-coded.
        let url = URL(string: "https://" + websites[0])!
        print("- before webView.load(URLRequest(url: url))")
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
    
    
    // D25-03. NAVIGATE TO A WEB SITE ONLY IF ITS URL IS IN OUR SAFE LIST
    //  - Evaluate the URL to see whether it's in our safe list
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy)
        -> Void
        ) {
        print("\nViewController webView(..., decidePolicyFor..., ...)")
        
        let url = navigationAction.request.url
        
        if let host = url?.host {
            print("- host: \(host)")
            for website in websites {
                print("- website: \(website)")
                if host.contains(website) {
                    print("- before decisionHandler(.allow)")
                    decisionHandler(.allow)
                    return
                }
            }
        }
        
        domainNotAuthorizedAlert()
        
        decisionHandler(.cancel)
    }
    
    
    //  ************************************************************
    //  MARK: - Implementation OBSERVER Protocol methods
    //
    // D25-02. ADD A `UIProgressView` TO OUR TOOLBAR TO SHOW HOW FAR THE PAGE IS THROUGH LOADING
    //  - Listening when an observed value has changed
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
    private func setupToolBar() {
        
        // D26-02. TRY MAKING TWO NEW TOOLBAR ITEMS WITH THE TITLES BACK AND FORWARD
        let goBack = UIBarButtonItem(title: "Back",
                                     style: .plain,
                                     target: self,
                                     action: #selector(goBackTapped)
        )
        
        let goForward = UIBarButtonItem(title: "Forward",
                                     style: .plain,
                                     target: self,
                                     action: #selector(goForwardTapped)
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
        
        toolbarItems = [goBack, progressButton, spacer, refresh, goForward]
        
        navigationController?.isToolbarHidden = false
    }
    
    
    // D24-04. CHOOSE THE WEBSITE
    //  - When user taps the `Open...` button, iOS engine shows a message with different websites to choose.
    @objc func openTapped() {
        print("\nViewController openTapped()")
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
    
    
    // D26-01. IF USERS TRY TO VISIT A URL THAT ISN’T ALLOWED, SHOW AN ALERT SAYING IT’S BLOCKED
    private func domainNotAuthorizedAlert(){
        print("\nViewController domainNotAuthorizedAlert()")
        
        let ac = UIAlertController(title: "DOMAIN NOT AUTHORIZED",
                                   message: "Sorry, this page is not on your list of allowed domains",
                                   preferredStyle: .alert
        )
        
        ac.addAction(UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: nil))
        
        if presentedViewController == nil {
            present(ac, animated: true)
        }
    }
    
    
    @objc func goBackTapped(){
        webView.goBack()
    }
    
    
    @objc func goForwardTapped(){
        webView.goForward()
    }

}
