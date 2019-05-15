//
//  ViewController.swift
//  D24-26-Project04-C2 - Easy Browser
//
//  Created by Ignasi Perez-Valls on 10/05/2019.
//  Copyright © 2019 ignasiSwift. All rights reserved.

import UIKit
import WebKit

// D24-02-Inherit_UIViewController_and_implement_WKNavigationDelegate_protocol
class ViewController: UIViewController, WKNavigationDelegate {

    //  ************************************************************
    //  MARK: - Instance properties
    //
    var webView: WKWebView!
    var progressView: UIProgressView!
    
    // D25-03-Websites_allowed_on_this_App
    var websites = ["developer.apple.com", "www.hackingwithswift.com"]
    
    
    //  ************************************************************
    //  MARK: - Override UIViewController methods
    //
    override func loadView() {
        print("\nViewController loadView()")
        
        // D24-02-Make_our_view_the_web_view
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\nViewController viewDidLoad()")
        
        // D25-02-Register_as_an_observer
        webView.addObserver(
            self,
            forKeyPath: #keyPath(WKWebView.estimatedProgress),
            options: .new,
            context: nil)

        // D24-04-Add_a_bar_button_item
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Open…",
            style: .plain,
            target: self,
            action: #selector(openTapped)
        )
        
        
        // D25-01-Show_toolbar_bottom_screen
        setupToolBar()
        
        
        // D24-03-Make_a_URL_request
        // let url = URL(string: "https://www.hackingwithswift.com")!
        // webView.load(URLRequest(url: url))
        
        
        // D24-03-Allow_users_to_swipe-from_left_or_right_edge
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
    
    // D24-5-Setting_title_in_navigationbar_when_page_finish_downloading
    func webView(_ webView: WKWebView,
                 didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    
    // D25-03 Evaluate_URL_to-see-whether_it's_in_our_safe_list
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
        
        // D26-C1-Message_website_not_allowed
        domainNotAuthorizedAlert()
        
        decisionHandler(.cancel)
    }
    
    
    //  ************************************************************
    //  MARK: - Implementation OBSERVER Protocol methods
    //
    
    // D25-02-Listening_observed_value_changes
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
    
    // D25-01-Show_toolbar_bottom_screen
    private func setupToolBar() {
        
        // D26-C2-Two_new_toolbar_items_back_and_forward
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
        
        
        // D25-02-Add_a_progress_view_to_toolbar
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
        
        // D26-C2-Two_new_toolbar_items_back_and_forward
        toolbarItems = [goBack, progressButton, spacer, refresh, goForward]
        
        navigationController?.isToolbarHidden = false
    }
    
    // D24-04-Method_called_when_user_taps_action_button
    //
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
        
        // D25-03-Avoiding_hard_coding
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
    
    
    // D24-04-Download_webpage_from_alert_action
    func openPage(action: UIAlertAction) {
        let url = URL(string: "https://" + action.title!)!
        webView.load(URLRequest(url: url))
    }
    
    
    // D26-C1-Message_website_not_allowed
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
