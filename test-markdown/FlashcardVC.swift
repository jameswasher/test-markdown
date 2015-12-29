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

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var thumbsDownButton: UIButton!
    @IBOutlet weak var thumbsUpButton: UIButton!
    
    var showFront = true
    var currentCardIndex = 0
    var deckOfCards: [Flashcard] = []
    var testType: TestType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var frontMarkdown = "What are the aspects of product strategy alignment?"
        var backMarkdown = "## &ldquo;Significant misalignment is a formula for failure&rdquo; \n * Mission \n * Vision \n * Strategy \n * Culture \n * Core competencies \n * Target markets \n * Products"

        let flashcard1 = Flashcard(frontMarkdown: frontMarkdown, backMarkdown: backMarkdown, frontImage: UIImage(named: "front1")!, backImage: UIImage(named: "back1")!)
        
        frontMarkdown = "Describe the accounting treatment of retroactive reinsurance"
        backMarkdown = "\n* The ceded reserves are recorded as a negative write in item in the balance sheet \n* Any gain is recorded as \n  - other income in the income statement \n  - special surplus in the balance sheet"
        
        let flashcard2 = Flashcard(frontMarkdown: frontMarkdown, backMarkdown: backMarkdown, frontImage: UIImage(named: "front2")!, backImage: UIImage(named: "back2")!)
        
        frontMarkdown = "What is the quadratic formula?"
        backMarkdown = "When $a &#92;ne 0$, there are two solutions to &#92;(ax^2 + bx + c = 0&#92;) and they are $$x = {-b &#92;pm &#92;sqrt{b^2-4ac} &#92;over 2a}.$$"
        
        let flashcard3 = Flashcard(frontMarkdown: frontMarkdown, backMarkdown: backMarkdown, frontImage: UIImage(named: "front1")!, backImage: UIImage(named: "back1")!)
        
        deckOfCards.append(flashcard3)
        deckOfCards.append(flashcard1)
        deckOfCards.append(flashcard2)


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
                let urlPath = NSBundle.mainBundle().pathForResource("front", ofType: "html")
                let url = NSURL(fileURLWithPath: urlPath!, isDirectory: false)
                let request = NSURLRequest(URL: url)
                webView.loadRequest(request)
            } else {
                imageView.image = currentCard.frontImage
            }
        } else {
            // show back
            thumbsDownButton.hidden = false
            thumbsUpButton.hidden = false
            if testType == TestType.HTML {
                let urlPath = NSBundle.mainBundle().pathForResource("back", ofType: "html")
                let url = NSURL(fileURLWithPath: urlPath!, isDirectory: false)
                let request = NSURLRequest(URL: url)
                webView.loadRequest(request)
            } else {
                imageView.image = currentCard.backImage
            }
            
        }
    }
}

