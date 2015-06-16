//
//  ViewController.swift
//  APITester
//
//  Created by Alexander Handy on 16/06/2015.
//  Copyright (c) 2015 Alexander Handy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func Send() {
        let api = Copy()
        api.search()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

