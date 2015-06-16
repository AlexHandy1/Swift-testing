//
//  ViewController.swift
//  CalculatorRestart
//
//  Created by Alexander Handy on 10/06/2015.
//  Copyright (c) 2015 Alexander Handy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
   
    @IBOutlet weak var NewDisplay: UILabel!
    
    var nowTyping = false
  
   
    @IBAction func pressDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if nowTyping {
            NewDisplay.text = NewDisplay.text! + digit
        } else {
            NewDisplay.text = digit
            nowTyping = true
        }
    }
    
   
    @IBAction func Operation(sender: UIButton) {
        let operation = sender.currentTitle!
        if nowTyping {Enter()}
        
        switch operation {
        case "+": performOperation({$0 + $1})
            
        case "-": performOperation({$1 - $0})
            
        case "/": performOperation({$1 / $0})
            
        case "x": performOperation({$0 * $1})
            
        default: break
        }

    }
    
    var stack = Array<Double>()
    
    
    @IBAction func Enter() {
        nowTyping = false
        stack.append(displayValue)
        println(stack)
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if stack.count >= 2 {
            displayValue = operation(stack.removeLast(), stack.removeLast())
            Enter()
        }
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(NewDisplay.text!)!.doubleValue
        } set {
         NewDisplay.text = "\(newValue)"
            nowTyping = false
        }
    }

}