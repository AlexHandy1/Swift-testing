//
//  APIWeather.swift
//  APITester
//
//  Created by Alexander Handy on 16/06/2015.
//  Copyright (c) 2015 Alexander Handy. All rights reserved.
//

import Foundation

class Weather {
    func loadShots(completion: ((AnyObject) -> Void)!) {
        var urlString = "http://api.openweathermap.org/data/2.5/weather?q=London,uk"
        
        let session = NSURLSession.sharedSession()
        let shotsUrl = NSURL(string: urlString)
        
        var task = session.dataTaskWithURL(shotsUrl!) {
            (data, response, error) -> Void in
        
        if error != nil  {
            println(error.localizedDescription)
        } else {
            
        }
      }
        task.resume()
    }
}
