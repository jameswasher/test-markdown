//
//  Flashcard.swift
//  test-markdown
//
//  Created by James on 12/24/15.
//  Copyright © 2015 The Infinite Actuary. All rights reserved.
//

import Foundation
import UIKit

class Flashcard {
    private var m = Markdown()
    private var frontMarkdown: String!
    private var backMarkdown: String!
    var frontImage: UIImage!
    var backImage: UIImage!
    
    var frontHTML: String? {
        if let frontHeader = contentsOfFile("FrontHeader", ofType: "html"), let footer = contentsOfFile("Footer", ofType: "html") {
            return frontHeader + m.transform(self.frontMarkdown) + footer
        }
        
        return nil
    }
    
    var backHTML: String? {
        if let backHeader = contentsOfFile("BackHeader", ofType: "html"), let footer = contentsOfFile("Footer", ofType: "html") {
            return backHeader + m.transform(self.backMarkdown) + footer
        }
        
        return nil
    }
    
    init(frontMarkdown: String, backMarkdown: String, frontImage: UIImage, backImage: UIImage) {
        self.frontMarkdown = frontMarkdown
        self.backMarkdown = backMarkdown
        self.frontImage = frontImage
        self.backImage = backImage
    }
    
    func contentsOfFile(file: String, ofType: String) -> String? {
        if let filepath = NSBundle.mainBundle().pathForResource(file, ofType: ofType) {
            do {
                let contents = try NSString(contentsOfFile: filepath, usedEncoding: nil) as String
                print(contents)
                return contents
            } catch {
                // contents could not be loaded
                print("could not be loaded")
                return nil
            }
        } else {
            // example.txt not found!
            print("not found")
            return nil
        }
        
    }
    
}