//
//  AddCardVC.swift
//  test-markdown
//
//  Created by Washer on 12/30/15.
//  Copyright © 2015 The Infinite Actuary. All rights reserved.
//

import UIKit

class AddCardVC: UIViewController {

    @IBOutlet weak var frontMarkdownTextView: UITextView!
    @IBOutlet weak var backMarkdownTextView: UITextView!
    
    var user = User.sharedInstance
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationVC = segue.destinationViewController as? FlaschardVC {
            destinationVC.testType = TestType.HTML
            destinationVC.deckOfCards = [createCard()]
        }
    }
    
    @IBAction func addCardPressed(sender: UIButton) {
        let card = createCard()
        user.flashCardDeck.append(card)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func createCard() -> Flashcard {
        return Flashcard(frontMarkdown: frontMarkdownTextView.text, backMarkdown: backMarkdownTextView.text)
    }
}
