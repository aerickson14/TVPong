//
//  MenuScene.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-22.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import SpriteKit

let StartGameLabelCategoryName = "startGameLabel"

class MenuScene: SKScene {
    
    var startGameLabel: SKLabelNode?
    var startGameDelegate: StartGameDelegate?
    var gameIsPaused = false
    
    override func didMoveToView(view: SKView) {
        startGameLabel = childNodeWithName(StartGameLabelCategoryName) as? SKLabelNode
        if gameIsPaused {
            startGameLabel?.text = "Unpause Game"
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if gameIsPaused {
            startGameDelegate?.didUnpauseGame()
        } else {
            startGameDelegate?.didStartGame()
        }
    }
}
