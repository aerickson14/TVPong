//
//  GameScene.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-14.
//  Copyright (c) 2015 Andrew Erickson. All rights reserved.
//

import SpriteKit

struct PhysicsCategory {
    static let Wall : UInt32 = 0b1
    static let Paddle : UInt32 = 0b10
    static let Ball : UInt32 = 0b100
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let scoreboard = Scoreboard()
    let ball = Ball()
    var userPaddle: UserPaddle?
    var computerPaddle: ComputerPaddle?
    var wall: Wall?
    var pauseDelegate: PauseGameDelegate?
    var gameIsPaused = false
    var gameConfig: GameConfig
    
    init(size: CGSize, gameConfig: GameConfig) {
        self.gameConfig = gameConfig
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        
        addPlayPauseRecognizer("didPressPause")
        
        if !gameIsPaused {
            addMenuButtonRecognizer("didPressPause")
            setupGame()
            
            physicsWorld.gravity = CGVectorMake(0, 0)
            physicsWorld.contactDelegate = self
        } else {
            gameIsPaused = false
        }
    }
    
    private func setupGame() {
        backgroundColor = UIColor.blackColor()
        
        ball.difficulty = gameConfig.difficulty
        ball.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(frame))
        addChild(ball)
        ball.pushInRandomDirection()
        
        let paddleSize = CGSizeMake(20, 100)
        let minY: CGFloat = frame.origin.y + 0.5*paddleSize.height
        let maxY: CGFloat = frame.origin.y + frame.height - 0.5*paddleSize.height
        userPaddle = UserPaddle(minY: minY, maxY: maxY, size: paddleSize)
        if let _userPaddle = userPaddle {
            _userPaddle.position = CGPointMake(_userPaddle.frame.width + 50, CGRectGetMidY(frame))
            addChild(_userPaddle)
        }
        
        computerPaddle = ComputerPaddle(minY: minY, maxY: maxY, size: paddleSize, ball: ball, strategy: PaddleStrategyUnbeatable(difficulty: gameConfig.difficulty))
        if let _computerPaddle = computerPaddle {
            _computerPaddle.position = CGPointMake(frame.width - _computerPaddle.frame.width - 50, CGRectGetMidY(self.frame))
            addChild(_computerPaddle)
        }
        
        wall = Wall(rect: frame)
        if let _wall = wall {
            addChild(_wall)
        }
        
        scoreboard.position = CGPointMake(CGRectGetMidX(frame), frame.height - scoreboard.frame.height - 50)
        scoreboard.zPosition = 5
        addChild(self.scoreboard)
    }
    
    private func resetBall() {
        ball.removeFromParent()
        
        let delayAction = SKAction.waitForDuration(3.0)
        let addNewBallAction = SKAction.runBlock { [weak self] () -> Void in
            if let weakSelf = self {
                weakSelf.ball.position = CGPointMake(CGRectGetMidX(weakSelf.frame), CGRectGetMidY(weakSelf.frame))
                weakSelf.addChild(weakSelf.ball)
                weakSelf.ball.pushInRandomDirection()
            }
        }
        let resetBallAction = SKAction.sequence([delayAction, addNewBallAction])
        runAction(resetBallAction)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let prevLoc = touch.previousLocationInView(self.view)
            let curLoc = touch.locationInView(self.view)
            let dy = prevLoc.y - curLoc.y
            userPaddle?.moveByY(dy)
        }
    }
    
    func didPressPause() {
        pauseDelegate?.didPauseGame()
    }
   
    override func update(currentTime: CFTimeInterval) {
        computerPaddle?.update()
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        if isContactBetween(contact, categoryA: PhysicsCategory.Ball, categoryB: PhysicsCategory.Wall) == true {
            if contact.contactPoint.x < 25 {
                computerPoint()
            } else if contact.contactPoint.x > frame.width - 25 {
                userPoint()
            }
        } else if isContactBetween(contact, categoryA: PhysicsCategory.Ball, categoryB: PhysicsCategory.Paddle) == true {
            ball.adjustSpeed(BallSpeedUpFactor)
        }
    }
    
    private func isContactBetween(contact: SKPhysicsContact, categoryA: UInt32, categoryB: UInt32) -> Bool {
        let aHitB = contact.bodyA.categoryBitMask == categoryA && contact.bodyB.categoryBitMask == categoryB
        let bHitA = contact.bodyA.categoryBitMask == categoryB && contact.bodyB.categoryBitMask == categoryA
        
        return aHitB || bHitA
    }
    
    func computerPoint() {
        scoreboard.giveComputerPoint()
        resetBall()
    }
    
    func userPoint() {
        scoreboard.giveUserPoint()
        resetBall()
    }
}
