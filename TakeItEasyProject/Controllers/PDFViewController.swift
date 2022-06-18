//
//  PDFViewController.swift
//  TakeItEasyProject
//
//  Created by Liban Abdinur on 6/17/22.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {
    
    var pdfName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let pdfView = PDFView(frame: view.bounds)
        pdfView.autoScales = true
        
        let filePath = Bundle.main.url(forResource: pdfName, withExtension: "pdf")
        pdfView.document = PDFDocument(url: filePath!)
        
        view.addSubview(pdfView)
        
    }
    

    

}
