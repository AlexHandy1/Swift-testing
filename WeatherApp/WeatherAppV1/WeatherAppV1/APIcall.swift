//
//  APIcall.swift
//  WeatherAppV1
//
//  Created by Alexander Handy on 18/06/2015.
//  Copyright (c) 2015 Alexander Handy. All rights reserved.
//

import Foundation

class API {
    func weatherSearch(#urlSearch: String) -> Dictionary<String,AnyObject>
    {
        let urlPath = "http://api.openweathermap.org/data/2.5/weather?q=" + urlSearch
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            println("Task completed")
            if(error != nil) {
                // If there is an error in the web request, print it to the console
                println(error.localizedDescription)
            }
            var err: NSError?
            if let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as? NSDictionary {
                var dataOut = jsonResult as Dictionary<String,AnyObject>
                return dataOut
                if(err != nil) {
                    // If there is an error parsing JSON, print it to the console
                    println("JSON Error \(err!.localizedDescription)")
                }
                if let results: NSArray = jsonResult["results"] as? NSArray {
                    dispatch_async(dispatch_get_main_queue(), {
                        println(results)
                    })
                }
            }
        })
        task.resume()
    }
}

//AlamoFire (gem install cocoapods)
//look into multi-threading - calling first line with initial value before reprocessing (like asynchronicity)
//property observers
//return a value as a dictionary
//if a closure, have to return as a Void?
