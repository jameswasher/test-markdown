//
//  Functions.swift
//  test-markdown
//
//  Created by Washer on 12/29/15.
//  Copyright © 2015 The Infinite Actuary. All rights reserved.
//

import Foundation

func getDocumentsDirectory() -> NSString {
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
    let documentsDirectory = paths[0]
    return documentsDirectory
}


func copyMathJaxToDocuments() {
    let fileManager = NSFileManager.defaultManager()
    
    if let mathJaxBundle = NSBundle.mainBundle().resourcePath?.stringByAppendingString("/MathJax") {
        let mathJaxDocuments = getDocumentsDirectory().stringByAppendingString("/MathJax")
        
        // if MathJax directory doesn't exist then create it
        if !fileManager.fileExistsAtPath(mathJaxDocuments) {
            do {
                try fileManager.createDirectoryAtPath(mathJaxDocuments, withIntermediateDirectories: false, attributes: nil)
                print("created MathJax directory")
            } catch {
                print("unable to create MathJax directory")
            }
        }
        
        do {
            let fileList = try fileManager.contentsOfDirectoryAtPath(mathJaxBundle)
            for file in fileList {
                let newFilePath = mathJaxDocuments.stringByAppendingString("/\(file)")
                let oldFilePath = mathJaxBundle.stringByAppendingString("/\(file)")
                
                do {
                    try fileManager.copyItemAtPath(oldFilePath, toPath: newFilePath)
                    print("copying \(file)")
                } catch {
                    print("unable to copy \(file)")
                }
            }
        } catch {
            print("unable to get fileList of MathJaxBundle")
        }
        
    }
    
}

