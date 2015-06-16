//
//  ViewController2.swift
//  Rock Paper Scissors
//
//  Created by Alexander Handy on 14/06/2015.
//  Copyright (c) 2015 Alexander Handy. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    var toPass: String!
    
    @IBOutlet weak var Outcome: UILabel!

    @IBAction func Printtest() {
        println(toPass)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(toPass)
        Outcome.text = toPass
    }
}
