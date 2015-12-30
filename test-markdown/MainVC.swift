//
//  MainVC.swift
//  test-markdown
//
//  Created by James on 12/24/15.
//  Copyright © 2015 The Infinite Actuary. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    
    @IBOutlet weak var testTypeSegmentedControl: UISegmentedControl!
    
    var user = User.sharedInstance
    
    override func viewDidLoad() {
        copyMathJaxToDocuments()
        createSampleDeck()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let destinationVC = segue.destinationViewController as? FlaschardVC {
            if testTypeSegmentedControl.selectedSegmentIndex == 0 {
                destinationVC.testType = TestType.HTML
            } else {
                destinationVC.testType = TestType.Image
            }

        }
    }
    
    private func createSampleDeck() {
        print("creating sample deck")
        
        var frontMarkdown = "What are the aspects of product strategy alignment?"
        var backMarkdown = "## &ldquo;Significant misalignment is a formula for failure&rdquo; \n * Mission \n * Vision \n * Strategy \n * Culture \n * Core competencies \n * Target markets \n * Products"
        
        let flashcard1 = Flashcard(frontMarkdown: frontMarkdown, backMarkdown: backMarkdown, frontImage: UIImage(named: "front1")!, backImage: UIImage(named: "back1")!)
        
        frontMarkdown = "Describe the accounting treatment of retroactive reinsurance"
        backMarkdown = "\n* The ceded reserves are recorded as a negative write in item in the balance sheet \n* Any gain is recorded as \n  - other income in the income statement \n  - special surplus in the balance sheet"
        
        let flashcard2 = Flashcard(frontMarkdown: frontMarkdown, backMarkdown: backMarkdown, frontImage: UIImage(named: "front2")!, backImage: UIImage(named: "back2")!)
        
        frontMarkdown = "What is the quadratic formula?"
        backMarkdown = "When $a &#92;ne 0$, there are two solutions to &#92;(ax^2 + bx + c = 0&#92;) and they are $$x = {-b &#92;pm &#92;sqrt{b^2-4ac} &#92;over 2a}.$$"
        
        let flashcard3 = Flashcard(frontMarkdown: frontMarkdown, backMarkdown: backMarkdown, frontImage: UIImage(named: "front1")!, backImage: UIImage(named: "back1")!)
        
        user.flashCardDeck.append(flashcard3)
        user.flashCardDeck.append(flashcard1)
        user.flashCardDeck.append(flashcard2)

    }
}
