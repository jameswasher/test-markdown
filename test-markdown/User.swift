//
//  User.swift
//  test-markdown
//
//  Created by Washer on 12/30/15.
//  Copyright © 2015 The Infinite Actuary. All rights reserved.
//

import Foundation

class User {
    class var sharedInstance: User {
        struct Static {
            static var instance: User?
            static var token: dispatch_once_t = 0
        }
        
        
        dispatch_once(&Static.token) {
            Static.instance = User()
        }
        
        return Static.instance!
    }
    
    var flashCardDeck: [Flashcard] = []
}