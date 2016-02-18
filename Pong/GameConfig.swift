//
//  GameConfig.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-26.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import Foundation

enum GameDifficulty: String {
    case Easy = "Easy"
    case Normal = "Normal"
    case Hard = "Hard"
    case Insane = "Insane"
}

enum GameType: String {
    case Classic = "Classic"
    case Hockey = "Hockey"
}

class GameConfig {
    
    var difficulty: GameDifficulty = .Normal
    var gameType: GameType = .Classic
    
    init() {
        
    }
    
    func difficulties() -> [GameDifficulty] {
        return [.Easy, .Normal, .Hard, .Insane]
    }
    
    func prevDifficulty() -> GameDifficulty {
        for (index, difficulty) in difficulties().enumerate() {
            if self.difficulty == difficulty {
                if (index == 0) {
                    return .Insane
                }
                return difficulties()[index-1]
            }
        }
        
        return .Normal
    }
    
    func nextDifficulty() -> GameDifficulty {
        for (index, difficulty) in difficulties().enumerate() {
            if self.difficulty == difficulty {
                if (index == difficulties().count-1) {
                    return .Easy
                }
                return difficulties()[index+1]
            }
        }
        
        return .Normal
    }
    
    func gameTypes() -> [GameType] {
        return [.Classic, .Hockey]
    }
    
    func prevGameType() -> GameType {
        for (index, gameType) in gameTypes().enumerate() {
            if self.gameType == gameType {
                if (index == 0) {
                    return .Hockey
                }
                return gameTypes()[index-1]
            }
        }
        
        return .Classic
    }
    
    func nextGameType() -> GameType {
        for (index, gameType) in gameTypes().enumerate() {
            if self.gameType == gameType {
                if (index == gameTypes().count-1) {
                    return .Classic
                }
                return gameTypes()[index+1]
            }
        }
        
        return .Classic
    }
}