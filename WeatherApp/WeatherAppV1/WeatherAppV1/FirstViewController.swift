//
//  FirstViewController.swift
//  WeatherAppV1
//
//  Created by Alexander Handy on 18/06/2015.
//  Copyright (c) 2015 Alexander Handy. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var searchField: UITextField!
    
    
    @IBAction func searchButton() {
        let api = API()
        var dataOut = api.weatherSearch(urlSearch: searchField.text!)
        println(dataOut)
        self.performSegueWithIdentifier("Search", sender: nil)
    }
}
