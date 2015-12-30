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

