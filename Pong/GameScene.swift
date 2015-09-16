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
    let userPaddle = UserPaddle()
    var computerPaddle: ComputerPaddle?
    var wall: Wall?
    
    override init(size: CGSize) {
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        setupGame()
        
        self.physicsWorld.gravity = CGVectorMake(0, 0)
        self.physicsWorld.contactDelegate = self
        
    }
    
    private func setupGame() {
        self.ball.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(self.ball)
        self.ball.pushInRandomDirection()
        
        self.userPaddle.position = CGPointMake(10, CGRectGetMidY(self.frame))
        self.addChild(self.userPaddle)
        
        self.computerPaddle = ComputerPaddle(ball: ball)
        if let _computerPaddle = self.computerPaddle {
            _computerPaddle.position = CGPointMake(self.frame.width-10, CGRectGetMidY(self.frame))
            self.addChild(_computerPaddle)
        }
        
        self.wall = Wall(rect: self.frame)
        if let _wall = self.wall {
            self.addChild(_wall)
        }
        
        self.scoreboard.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.height - self.scoreboard.frame.height)
        self.scoreboard.zPosition = 5
        self.addChild(self.scoreboard)
    }
    
    private func resetBall() {
        self.ball.removeFromParent()
        
        let delayAction = SKAction.waitForDuration(3.0)
        let addNewBallAction = SKAction.runBlock { () -> Void in
            self.ball.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
            self.addChild(self.ball)
            self.ball.pushInRandomDirection()
        }
        let resetBallAction = SKAction.sequence([delayAction, addNewBallAction])
        self.runAction(resetBallAction)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let prevLoc = touch.previousLocationInView(self.view)
            let curLoc = touch.locationInView(self.view)
            let dy = prevLoc.y - curLoc.y
            userPaddle.moveByY(dy)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        computerPaddle?.update()
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        if contact.contactPoint.x < 5 {
            computerPoint()
        } else if contact.contactPoint.x > self.frame.width - 5 {
            userPoint()
        }
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
