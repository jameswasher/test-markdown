//
//  MathJaxTest.swift
//  test-markdown
//
//  Created by Washer on 12/29/15.
//  Copyright © 2015 The Infinite Actuary. All rights reserved.
//

import UIKit

class MathJaxTest: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    let flashcard = Flashcard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.scrollView.scrollEnabled = true
        webView.scalesPageToFit = true

        // Do any additional setup after loading the view.
        
        let urlPath = NSBundle.mainBundle().pathForResource("sample", ofType: "html", inDirectory: "MathJax/test")
        let url = NSURL(fileURLWithPath: urlPath!, isDirectory: false)
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }


}
