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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func openGoogle(_ sender: Any){
        let webKitView = WKWebView()
        let newUrl = URL(string: "https://www.google.com")
        
        webKitView.load(URLRequest(url: newUrl!))
        view = webKitView
    }

}
