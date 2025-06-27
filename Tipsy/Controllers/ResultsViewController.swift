//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Firebrand Dev on 17/06/2025.
//  Copyright © 2025 Firebrand Dev. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var billValue: String?
    var people: String?
    var tip: String?

    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = billValue
        settingsLabel.text = "Split between \(people!) people, with \(tip!) tip."
        
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
