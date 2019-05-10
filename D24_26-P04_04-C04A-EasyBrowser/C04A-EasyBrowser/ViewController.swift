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
    
    
    //  ************************************************************
    //  MARK: - Override UIViewController methods
    //
    //  3. DOWNLOAD A WEB PAGE
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
        
        // 4. CHOOSE THE WEBSITE
        //    - Add a button to the navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Open…",
            style: .plain,
            target: self,
            action: #selector(openTapped)
        )
        
        // 3. DOWNLOAD A WEB PAGE
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    
    //  ************************************************************
    //  MARK: - Implementation WKNavigationDelegate Protocol methods
    //
    // 5. SETTING THE TITLE IN THE NAVIGATION BAR WHEN THE PAGE FINISH DOWNLOADING
    func webView(_ webView: WKWebView,
                 didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    

    //  ************************************************************
    //  MARK: - Instance methods
    //
    // 4. CHOOSE THE WEBSITE
    //    - When user taps the `Open...` button, iOS engine shows a   message with different websites to choose.
    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page…",
                                   message: nil,
                                   preferredStyle: .actionSheet)
        
        ac.addAction(UIAlertAction(title: "apple.com",
                                   style: .default,
                                   handler: openPage))
        
        ac.addAction(UIAlertAction(title: "hackingwithswift.com",
                                   style: .default,
                                   handler: openPage))
        
        ac.addAction(UIAlertAction(title: "Cancel",
                                   style: .cancel))
        
        ac.popoverPresentationController?.barButtonItem =
            self.navigationItem.rightBarButtonItem
        
        present(ac, animated: true)
    }
    
    // 4. CHOOSE THE WEBSITE
    //  - When user chooses one website in the alert action, iOS engine calls this method.
    func openPage(action: UIAlertAction) {
        let url = URL(string: "https://" + action.title!)!
        webView.load(URLRequest(url: url))
    }

}
