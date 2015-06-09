//
//  ViewController.swift
//  Calculator
//
//  Created by Alexander Handy on 08/06/2015.
//  Copyright (c) 2015 Alexander Handy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var CalcDisplay: UILabel!
    
    var pressingDigit: Bool = false
    
    @IBAction func PressDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if pressingDigit {
            CalcDisplay.text = CalcDisplay.text! + digit
        } else {
            CalcDisplay.text = digit
            pressingDigit = true
        }
    }
}

