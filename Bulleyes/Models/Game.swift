//
//  Game.swift
//  Bulleyes
//
//  Created by Артем Ворфоломеев on 07.06.2021.
//

import Foundation

// Игровая логика

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 34, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 3450, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 30, date: Date()))
        }
    }
    
    func points(sliderValue: Double) -> Int {
        let intSliderValue = Int(sliderValue.rounded())
        let difference = abs(intSliderValue - target)
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
            bonus = 50
        } else {
            bonus = 0
        }
        return 100 - difference + bonus
    }
    
    mutating func addToLeaderboard (points: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEntries.sort{ $0.score > $1.score }
    }
    
    mutating func endRound(points: Int) {
        score += points
        round += 1
        addToLeaderboard(points: points)
    }
    
    mutating func startNewRound() {
        target = Int.random(in: 1...100)
    }
    
    mutating func restart () {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
