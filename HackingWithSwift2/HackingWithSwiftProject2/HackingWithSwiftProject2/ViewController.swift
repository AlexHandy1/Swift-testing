//
//  ViewController.swift
//  HackingWithSwiftProject2
//
//  Created by Alexander Handy on 22/06/2015.
//  Copyright (c) 2015 Alexander Handy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Button1: UIButton!
    
    @IBOutlet weak var Button2: UIButton!
    
    @IBOutlet weak var Button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    
    //remember if don't include in method then gets funny about randomly having variables out
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Button1.layer.borderWidth = 1
        Button2.layer.borderWidth = 1
        Button3.layer.borderWidth = 1
        
        Button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        Button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        Button3.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        
        countries += ["estonia","france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        Button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        Button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        Button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        
        correctAnswer = Int(arc4random_uniform(3))
        title = countries[correctAnswer].uppercaseString
        //how does this push the country name into nav bar? Where else being used
    }
    
    @IBAction func ButtonTapped(sender: UIButton) {
        var messageTitle: String
        // this is an example of using the set argument from the button e.g. get the tag attribute from the sender which is the button
        if sender.tag == correctAnswer {
            messageTitle = "correct"
            score += 1
        } else {
            messageTitle = "incorrect"
            score -= 1
        }
        
        let messageText = "Your score is \(score)"
        
        let ac = UIAlertController(title: messageTitle, message: messageText, preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        presentViewController(ac, animated: true, completion: nil)
        
    }
    


}

