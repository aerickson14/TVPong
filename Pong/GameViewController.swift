//
//  GameViewController.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-14.
//  Copyright (c) 2015 Andrew Erickson. All rights reserved.
//

import UIKit
import SpriteKit

protocol ScenePauseDelegate {
    func didPauseGame()
}

protocol StartGameDelegate {
    func didStartGame()
    func didUnpauseGame()
}

class GameViewController: UIViewController, ScenePauseDelegate, StartGameDelegate {
    
    var skView: SKView?
    var menuScene: MenuScene?
    var gameScene: GameScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skView = self.view as? SKView
        skView?.showsFPS = false
        skView?.showsNodeCount = false
        skView?.ignoresSiblingOrder = true
        showMenu()
    }
    
    func showMenu() {
        menuScene = MenuScene(fileNamed: "MenuScene")
        menuScene?.startGameDelegate = self
        menuScene?.scaleMode = .AspectFill
        skView?.presentScene(menuScene)
    }
    
    func didStartGame() {
        gameScene = GameScene(size: self.view.frame.size)
        gameScene?.pauseDelegate = self
        gameScene?.scaleMode = .AspectFill
        skView?.presentScene(gameScene)
    }
    
    func didPauseGame() {
        gameScene?.paused = true
        gameScene?.gameIsPaused = true
        menuScene?.gameIsPaused = true
        skView?.presentScene(menuScene)
    }
    
    func didUnpauseGame() {
        skView?.presentScene(gameScene)
    }
}
