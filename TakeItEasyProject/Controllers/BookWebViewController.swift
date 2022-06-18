//
//  BookWebViewController.swift
//  TakeItEasyProject
//
//  Created by Liban Abdinur on 6/16/22.
//

import UIKit
import WebKit

class BookWebViewController: UIViewController {
    
    var bookName: String = ""
    var bookTitle: String = ""
    var previewUrlString = ""
    var bookID = ""
    var urlString = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(bookID,bookTitle)
        bookTitle = bookTitle.replacingOccurrences(of: " ", with: "_")
        let myView = WKWebView(frame: view.bounds)
        myView.load(URLRequest(url: URL(string: bookName)!))
        myView.autoresizesSubviews = true
        view.addSubview(myView)

       
    }
    


}
