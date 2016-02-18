//
//  PauseMenuScene.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-25.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import SpriteKit

class PauseMenuScene: SKScene {
    
    var pauseGameDelegate: PauseGameDelegate?
    
    override func didMoveToView(view: SKView) {
        addPlayPauseRecognizer("unpauseGame")
    }
    func unpauseGame() {
        pauseGameDelegate?.didUnpauseGame()
    }
}