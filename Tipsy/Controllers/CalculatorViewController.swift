//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Firebrand Dev on 17/06/2025.
//  Copyright © 2025 Firebrand Dev. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    
    var tipsyBrain = TipsyBrain()
    
    var share: Float = 0.0
    var persons = 2
    var price: Float = 0.0
    var billPerPerson = 0.0
    var percentage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tenPctButton.isSelected = false
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        percentage = sender.currentTitle!
        
        sender.isSelected = true
        
        billTextField.endEditing(true)
        
        if tenPctButton.isSelected {
            share = 0.1
        } else if twentyPctButton.isSelected {
            share = 0.2
        } else {
            share = 0.0
        }
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        persons = Int(sender.value)
        splitNumberLabel.text = String(persons)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        price = Float(billTextField.text!) ?? 0.0
                
        billPerPerson = Double(tipsyBrain.calulateBill(price, share, persons))
        
        self.performSegue(withIdentifier: "goToBill", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToBill" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.billValue = String(tipsyBrain.getBill())
            destinationVC.people = String(tipsyBrain.getPeople())
            destinationVC.tip = percentage
        }
    }
}
