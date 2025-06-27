//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Firebrand Dev on 17/06/2025.
//  Copyright © 2025 Firebrand Dev. All rights reserved.
//


import Foundation

struct TipsyBrain {
    var tipsy: Tipsy?
    
    mutating func calulateBill(_ bill: Float, _ tipSize: Float, _ persons: Int) -> Float {
        let tip = bill * tipSize
        let amount = (bill + tip) / Float(persons)
        let totalBill = round(amount * 100) / 100
        
        tipsy = Tipsy(bill: totalBill, tip: tip, persons: persons)
        
        return Float(totalBill)
    }
    
    func getBill() -> Float {
        return (tipsy?.bill ?? 0.0)
    }
    
    func getPeople() -> Int {
        return tipsy?.persons ?? 2
    }
}
