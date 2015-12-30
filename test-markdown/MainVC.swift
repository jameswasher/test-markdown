//
//  MainVC.swift
//  test-markdown
//
//  Created by James on 12/24/15.
//  Copyright © 2015 The Infinite Actuary. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    var user = User.sharedInstance
    
    @IBOutlet weak var cardsInDeckLabel: UILabel!
    @IBOutlet weak var practiceDeckButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        copyMathJaxToDocuments()
        updateUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let destinationVC = segue.destinationViewController as? FlaschardVC {
            
            if segue.identifier == "ImageTest" {
                destinationVC.testType = TestType.Image
            } else {
                destinationVC.testType = TestType.HTML
            }
            
            if segue.identifier == "PracticeDeck" {
                destinationVC.deckOfCards = user.flashCardDeck
            } else {
                destinationVC.deckOfCards = createSampleDeck()
            }
            
        }
    }
    
    func updateUI() {
        cardsInDeckLabel.text = "Number of Cards in Deck: \(user.flashCardDeck.count)"
        if user.flashCardDeck.count == 0 {
            practiceDeckButton.enabled = false
        } else {
            practiceDeckButton.enabled = true
        }
    }
    
    private func createSampleDeck() -> [Flashcard] {
        print("creating sample deck")
        
        var deck: [Flashcard] = []
        
        var frontMarkdown = "What are the aspects of product strategy alignment?"
        var backMarkdown = "## &ldquo;Significant misalignment is a formula for failure&rdquo; \n * Mission \n * Vision \n * Strategy \n * Culture \n * Core competencies \n * Target markets \n * Products"
        
        let flashcard1 = Flashcard(frontMarkdown: frontMarkdown, backMarkdown: backMarkdown, frontImage: UIImage(named: "front1")!, backImage: UIImage(named: "back1")!)
        
        frontMarkdown = "Describe the accounting treatment of retroactive reinsurance"
        backMarkdown = "\n* The ceded reserves are recorded as a negative write in item in the balance sheet \n* Any gain is recorded as \n  - other income in the income statement \n  - special surplus in the balance sheet"
        
        let flashcard2 = Flashcard(frontMarkdown: frontMarkdown, backMarkdown: backMarkdown, frontImage: UIImage(named: "front2")!, backImage: UIImage(named: "back2")!)
        
        
        deck.append(flashcard1)
        deck.append(flashcard2)
        
        return deck
    }
}
