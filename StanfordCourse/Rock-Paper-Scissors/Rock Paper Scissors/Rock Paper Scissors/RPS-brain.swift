//
//  RPS-brain.swift
//  Rock Paper Scissors
//
//  Created by Alexander Handy on 12/06/2015.
//  Copyright (c) 2015 Alexander Handy. All rights reserved.
//

import Foundation

class Game {
    
    func play(player1: String, player2: String) -> String {
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
    
}

