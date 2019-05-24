//
//  DetailViewController.swift
//  D33-35-Project07 - Whitehouse Petitions
//
//  Created by Ignasi Perez-Valls on 24/05/2019.
//  Copyright © 2019 ignasiSwift. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    //  ************************************************************
    //  MARK: - Instance properties
    //
    var webView: WKWebView!
    var detailItem: Petition?
    
    
    //  ************************************************************
    //  MARK: - Override UIViewController methods
    //
    
    // D34-02-Make_our_view_the_web_view
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let detailItem = detailItem else { return }
        
        // D34-03-Create_a_Web_page
        let html = """
        <html>
          <head>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <style> body { font-size: 150%; } </style>
          </head>
          <body>
            \(detailItem.body)
          </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)

    }
    
}
