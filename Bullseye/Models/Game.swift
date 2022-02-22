//
//  Game.swift
//  Bullseye
//
//  Created by Aafrin Sayani on 2021-12-23.
//

import Foundation

struct LeaderBoardEntry {
    let score: Int
    let date: Date
    
    
    
}
struct Game{
    
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderBoardEntries : [LeaderBoardEntry] = []
    
    
    
    
    
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
    
    mutating func addToLeaderBoard(points: Int) {
        leaderBoardEntries.append(LeaderBoardEntry(score: points, date: Date()))
        leaderBoardEntries.sort { $0.score > $1.score}
        
    }
    
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
            
        addToLeaderBoard(points: points)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
