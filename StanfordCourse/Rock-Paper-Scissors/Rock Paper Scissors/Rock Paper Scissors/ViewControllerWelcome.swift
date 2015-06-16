//
//  ViewControllerWelcome.swift
//  Rock Paper Scissors
//
//  Created by Alexander Handy on 15/06/2015.
//  Copyright (c) 2015 Alexander Handy. All rights reserved.
//

import UIKit

class ViewControllerWelcome: UIViewController {

    @IBOutlet weak var PlayerName: UITextField!
    
    @IBAction func GoToGame() {
        // perform segue
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if(segue.identifier == "Start") {
            var GameVC = segue!.destinationViewController as ViewController;
            GameVC.playerName = PlayerName.text!
        }
    }

}