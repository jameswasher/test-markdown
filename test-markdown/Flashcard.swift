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
    private var frontMarkdown: String?
    private var backMarkdown: String?
    var frontImage: UIImage?
    var backImage: UIImage?
    
    var frontHTML: String? {
        if let frontHeader = contentsOfFile("FrontHeader", ofType: "html"), let footer = contentsOfFile("Footer", ofType: "html"), let markdown = self.frontMarkdown {
            return frontHeader + m.transform(markdown) + footer
        }
        
        return nil
    }
    
    var backHTML: String? {
        if let backHeader = contentsOfFile("BackHeader", ofType: "html"), let footer = contentsOfFile("Footer", ofType: "html"), let markdown = self.backMarkdown {
            return backHeader + m.transform(markdown) + footer
        }
        
        return nil
    }
    

    
    init() {
        
    }
    
    convenience init(frontMarkdown: String, backMarkdown: String) {
        self.init()
        self.frontMarkdown = frontMarkdown
        self.backMarkdown = backMarkdown
    }
    
    convenience init(frontMarkdown: String, backMarkdown: String, frontImage: UIImage, backImage: UIImage) {
        self.init()
        self.frontMarkdown = frontMarkdown
        self.backMarkdown = backMarkdown
        self.frontImage = frontImage
        self.backImage = backImage
    }
    
    func contentsOfFile(file: String, ofType: String) -> String? {
        if let filepath = NSBundle.mainBundle().pathForResource(file, ofType: ofType) {
            do {
                let contents = try NSString(contentsOfFile: filepath, usedEncoding: nil) as String
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
    
    func writeFlashcardToFile() {
        let frontfile = getDocumentsDirectory().stringByAppendingString("/front.html")
        let backfile = getDocumentsDirectory().stringByAppendingString("/back.html")
        
        do {
            try self.frontHTML!.writeToFile(frontfile, atomically: false, encoding: NSUTF8StringEncoding)
        } catch {
            print("unable to write to front.html")
        }
        
        do {
            try self.backHTML!.writeToFile(backfile, atomically: false, encoding: NSUTF8StringEncoding)
        } catch {
                print("unable to write to back.html")
        }
        
    }
    
    
    
}