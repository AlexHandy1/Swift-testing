// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func Game(player1: String, player2: String) -> String {
    var Output = ""
    if player1 == player2 {
        Output = "Go again"
    }
    else if player1 == "Rock" && player2 == "Scissors" || player1 == "Scissors" && player2 == "Paper" || player1 == "Paper" && player2 == "Rock"{
        Output = "Player 1 wins"
    } else {
        Output = "Player 2 wins"
    }
    return Output
}

Game("Rock", "Scissors")
Game("Scissors", "Scissors")
Game("Paper", "Scissors")

//one big function that takes a string argument and returns a string outcome

//steps
// - get basic logic working (DONE)
// - try and design MVC >> particularly the M
//    - View have player 1 buttons that sends title to input method
//    - Look into random word generation/ sample for Swift
// - link to UI - can you add pictures that include text? e.g. a rock
// add model in
// add view which has rock, paper, scissors buttons for player 1
// link to a method and hardcode player2
// add a result bar which updates outcome