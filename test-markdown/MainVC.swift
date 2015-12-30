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
    
    override func viewDidLoad() {
        copyMathJaxToDocuments()
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
}
