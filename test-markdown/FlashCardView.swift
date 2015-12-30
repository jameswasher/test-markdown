//
//  FlashCardView.swift
//  test-markdown
//
//  Created by Washer on 12/30/15.
//  Copyright © 2015 The Infinite Actuary. All rights reserved.
//

import UIKit

class FlashCardView: UIWebView {
    var flashcard: Flashcard?
    
    func showFront() {
        let urlPath = getDocumentsDirectory().stringByAppendingString("/front.html")
        let url = NSURL(fileURLWithPath: urlPath, isDirectory: false)
        let request = NSURLRequest(URL: url)
        self.loadRequest(request)
    }
    
    func showBack() {
        let urlPath = getDocumentsDirectory().stringByAppendingString("/back.html")
        let url = NSURL(fileURLWithPath: urlPath, isDirectory: false)
        let request = NSURLRequest(URL: url)
        self.loadRequest(request)
    }
}
