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
//    var cityName = ""
//    var cityWeather = ""
//    var cityTemp = ""
    // how properly set these up globally to then receive data later on
    // how propertly subtract to get Kelvin temp
    
    @IBAction func searchButton() {
        let api = API()
        api.weatherSearch(urlSearch: searchField.text!) { dictionary in
            println(dictionary)
            var cityName = dictionary["name"]
            var cityWeather = dictionary["weather"]![0]["description"]!!
            var cityTemp = dictionary["main"]!["temp"]!!
            println(cityName)
            println(cityWeather)
            println(cityTemp)
        }
        self.performSegueWithIdentifier("Search", sender: nil)
    }
    
    
}
