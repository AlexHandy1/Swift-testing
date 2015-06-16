//
//  ViewController.swift
//  Calculator MVC
//
//  Created by Alexander Handy on 11/06/2015.
//  Copyright (c) 2015 Alexander Handy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Display: UILabel!
    
    var nowTyping = false
    
    var brain = CalculatorBrain()
  
    @IBAction func EnterDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if nowTyping {
            Display.text = Display.text! + digit
        } else {
            Display.text = digit
            nowTyping = true
        }

    }
    @IBAction func operate(sender: UIButton) {
        if nowTyping {
            Enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.pushOperand(displayValue) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }
    
    @IBAction func Enter() {
        var nowTyping = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    var displayValue: Double {
        get {
            return  NSNumberFormatter().numberFromString(Display.text!)!.doubleValue
        }
        set {
            Display.text = "\(newValue)"
        }
    }
    

}

