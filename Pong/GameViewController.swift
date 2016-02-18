//
//  GameViewController.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-14.
//  Copyright (c) 2015 Andrew Erickson. All rights reserved.
//

import UIKit
import SpriteKit

protocol PauseGameDelegate {
    func didPauseGame()
    func didUnpauseGame()
}

class GameViewController: UIViewController, PauseGameDelegate {
    
    var skView: SKView?
    var gameScene: GameScene?
    var gameConfig = GameConfig()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skView = self.view as? SKView
        skView?.showsFPS = false
        skView?.showsNodeCount = false
        skView?.ignoresSiblingOrder = true
        startGame()
    }
    
    func startGame() {
        gameScene = GameScene(size: self.view.frame.size, gameConfig: gameConfig)
        gameScene?.pauseDelegate = self
        gameScene?.scaleMode = .AspectFill
        skView?.presentScene(gameScene)
    }
    
    func didPauseGame() {
        gameScene?.paused = true
        gameScene?.gameIsPaused = true
        let pauseMenuScene = PauseMenuScene(fileNamed: "PauseMenuScene")
        if let _pauseMenuScene = pauseMenuScene {
            _pauseMenuScene.pauseGameDelegate = self
            _pauseMenuScene.scaleMode = .AspectFill
            skView?.presentScene(_pauseMenuScene)
        }
    }
    
    func didUnpauseGame() {
        skView?.presentScene(gameScene)
    }
}
