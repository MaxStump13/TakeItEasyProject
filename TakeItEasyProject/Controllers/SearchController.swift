//
//  SearchController.swift
//  TakeItEasyProject
//
//  Created by admin on 6/16/22.
//

import UIKit
import WebKit

class SearchController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Design Elements
        let front = Design()
        view.layer.insertSublayer((front.gradient(boundary: view)), at: 0)
        let webKitView = WKWebView()
        let newUrl = URL(string: "https://www.google.com")
        
        webKitView.load(URLRequest(url: newUrl!))
        view = webKitView
    }

}
