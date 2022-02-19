//
//  Game.swift
//  Bullseye
//
//  Created by Aafrin Sayani on 2021-12-23.
//

import Foundation


struct Game{
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    
    
    func points(slidervalue: Int) -> Int {
        
        let diff = abs(target - slidervalue)
        let bonus: Int
        
        if diff == 0 {
            bonus = 100
        }
        else if diff <= 2 {
            bonus = 50
        }
        else {
            bonus = 0
        }
        return 100 - diff + bonus
    }
    
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
            
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}