// Playground - noun: a place where people can play

import UIKit
import XCPlayground

var postEndpoint : String = "http://jsonplaceholder.typicode.com/posts/1"

var urlRequest = NSURLRequest(URL: NSURL(string: postEndpoint)!)

NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue(), completionHandler:{
    (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
    if let anError = error
    {
        // got an error in getting the data, need to handle it
        println("error calling GET on /posts/1")
    }
    else // no error returned by URL request
    {
        // parse the result as json, since that's what the API provides
        var jsonError: NSError?
        let post = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as NSDictionary
        if let aJSONError = jsonError
        {
            // got an error while parsing the data, need to handle it
            println("error parsing /posts/1")
        }
        else
        {
            // now we have the post, let's just print it to prove we can access it
            println("The post is: " + post.description)
            
            // the post object is a dictionary
            // so we just access the title using the "title" key
            // so check for a title and print it if we have one
            if var postTitle = post["title"] as? String
            {
                println("The title is: " + postTitle)
            }
        }
    }
})