//
//  ViewController.swift
//  test-markdown
//
//  Created by James on 12/23/15.
//  Copyright © 2015 The Infinite Actuary. All rights reserved.
//

import UIKit

enum TestType {
    case HTML
    case Image
}

class FlaschardVC: UIViewController {

    @IBOutlet weak var webView: FlashCardView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var thumbsDownButton: UIButton!
    @IBOutlet weak var thumbsUpButton: UIButton!
    
    var showFront = true
    var currentCardIndex = 0
    var deckOfCards: [Flashcard]!
    var testType: TestType!
    
    var user = User.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
    }

    
    @IBAction func backButtonPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func toggleFrontBack(sender: UIButton) {
        showFront = !showFront
        refreshUI()
    }
 
    @IBAction func didKnowCard(sender: UIButton) {
        nextCard()
        refreshUI()
    }
    
    @IBAction func didNotKnowCard(sender: UIButton) {
        nextCard()
        refreshUI()
    }
    
    func nextCard() {
        showFront = true
        
        // for now just circle through the cards
        if currentCardIndex < deckOfCards.count - 1 {
            currentCardIndex += 1
        } else {
            currentCardIndex = 0
        }
    }
    
    func refreshUI() {
        let currentCard = deckOfCards[currentCardIndex]
        
        currentCard.writeFlashcardToFile()
        
        if showFront {
            thumbsDownButton.hidden = true
            thumbsUpButton.hidden = true
            if testType == TestType.HTML {
                webView.showFront()
            } else {
                imageView.image = currentCard.frontImage
            }
        } else {
            // show back
            thumbsDownButton.hidden = false
            thumbsUpButton.hidden = false
            if testType == TestType.HTML {
                webView.showBack()
            } else {
                imageView.image = currentCard.backImage
            }
            
        }
    }
}

