//
//  ViewController.swift
//  Rock Paper Scissors
//
//  Created by Alexander Handy on 12/06/2015.
//  Copyright (c) 2015 Alexander Handy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Game()
    
    var playerName: String!
    
    @IBOutlet weak var Result: UILabel!
    
    @IBOutlet weak var welcomePlayer: UILabel!
    
    @IBAction func Choice(sender: UIButton) {
        var choice = sender.currentTitle!
        let player2choices = ["Rock", "Paper", "Scissors"]
        let randomIndex = Int(arc4random_uniform(UInt32(player2choices.count)))
        var player2choice = player2choices[randomIndex]
        Result.text! = game.play(choice, player2: player2choice)
        if (Result.text! == "Player 1 wins") {
           self.performSegueWithIdentifier("Player1Win", sender: nil)
        } else if(Result.text! == "Player 2 wins") {
            self.performSegueWithIdentifier("Player2Win", sender: nil)
        } else {
            println(Result.text!)
        }
    }


    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if(segue.identifier == "Player1Win") {
            var Player1VC = segue!.destinationViewController as ViewController2;
            Player1VC.toPass = "Player 1 Wins"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(playerName)
        if (playerName != nil) {
            welcomePlayer.text = "Welcome \(playerName)!" }
        
        else {
            welcomePlayer.text = "You're back, have another go"
        }
    }
}



