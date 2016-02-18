//
//  StartMenuViewController.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-26.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import UIKit

class StartMenuViewController: UIViewController {
    
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var difficultyButton: UIButton!
    @IBOutlet weak var gameTypeButton: UIButton!
    
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var gameTypeLabel: UILabel!
    
    var gameConfig = GameConfig()
    
    override func viewDidLoad() {
        addSwipeRecognizer(.Left, selectorName: "handleSwipeLeft")
        addSwipeRecognizer(.Right, selectorName: "handleSwipeRight")
    }
    
    @IBAction func startGamePressed(sender: AnyObject) {
        NSLog("start game")
    }
    
    @IBAction func difficultyPressed(sender: AnyObject) {
        handleSwipe(.Right, inView: difficultyButton)
    }
    
    @IBAction func gameTypePressed(sender: AnyObject) {
        handleSwipe(.Right, inView: gameTypeButton)
    }
    
    func handleSwipeLeft() {
        if let focusedView = UIScreen.mainScreen().focusedView {
            handleSwipe(.Left, inView: focusedView)
        }
    }
    
    func handleSwipeRight() {
        if let focusedView = UIScreen.mainScreen().focusedView {
            handleSwipe(.Right, inView: focusedView)
        }
    }
    
    func handleSwipe(direction: UISwipeGestureRecognizerDirection, inView:UIView) {
        switch(inView) {
        case difficultyButton:
            changeDifficulty(direction)
        case gameTypeButton:
            changeGameType(direction)
        case startGameButton:
            break
        default:
            break
        }
    }
    
    func changeDifficulty(direction: UISwipeGestureRecognizerDirection) {
        gameConfig.difficulty = (direction == .Left) ? gameConfig.prevDifficulty() : gameConfig.nextDifficulty()
        difficultyLabel.text = gameConfig.difficulty.rawValue
    }
    
    func changeGameType(direction: UISwipeGestureRecognizerDirection) {
        gameConfig.gameType = (direction == .Left) ? gameConfig.prevGameType() : gameConfig.nextGameType()
        gameTypeLabel.text = gameConfig.gameType.rawValue
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "StartGameSegue" {
            if let gameViewController = segue.destinationViewController as? GameViewController {
                gameViewController.gameConfig = gameConfig
            }
        }
    }
}
