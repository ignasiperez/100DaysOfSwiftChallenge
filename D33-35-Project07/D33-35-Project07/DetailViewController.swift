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
        
        // D34-03-Create_HTML_content
        let html = """
        <html>
          <head>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <style>
              body { font-family: helvetica neue; font-size: 130%; }
              h1 {
                font-size: 30px;
                text-transform: uppercase;
              }
            </style>
          </head>
          <body>
          Petitions: \(detailItem.signatureCount) </br>
            <h1>\(detailItem.title)</h1>
            \(detailItem.body)
          </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
    }
    
}
