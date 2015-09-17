//
//  Scoreboard.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-15.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import SpriteKit

class Scoreboard: SKShapeNode {
    
    var userScore = 0
    var computerScore = 0
    var computerScoreLabel = SKLabelNode(text: "")
    var userScoreLabel = SKLabelNode(text: "")
    
    override init() {
        super.init()
        path = CGPathCreateWithRect(CGRectMake(-100, -10, 200, 50), nil)
        lineWidth = 0
        
        computerScoreLabel.position = CGPointMake(50, 0)
        computerScoreLabel.fontColor = UIColor.whiteColor()
        computerScoreLabel.verticalAlignmentMode = .Center
        computerScoreLabel.horizontalAlignmentMode = .Center
        computerScoreLabel.fontSize = 50
        addChild(computerScoreLabel)
        
        userScoreLabel.position = CGPointMake(-50, 0)
        userScoreLabel.fontColor = UIColor.whiteColor()
        userScoreLabel.verticalAlignmentMode = .Center
        userScoreLabel.horizontalAlignmentMode = .Center
        userScoreLabel.fontSize = 50
        addChild(userScoreLabel)
        
        updateUI()
        
        //debugPath(frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func giveComputerPoint() {
        computerScore++
        updateUI()
    }
    
    func giveUserPoint() {
        userScore++
        updateUI()
    }
    
    private func updateUI() {
        computerScoreLabel.text = String(computerScore)
        userScoreLabel.text = String(userScore)
    }
}
