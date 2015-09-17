//
//  Paddle.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-14.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import SpriteKit

class Paddle: SKSpriteNode {
    
    init() {
        let bodyTexture = SKTexture(imageNamed: "paddle")
        let paddleSize = CGSizeMake(20, 100)
        super.init(texture: bodyTexture, color: UIColor.clearColor(), size: paddleSize)
        physicsBody = SKPhysicsBody(rectangleOfSize: paddleSize)
        physicsBody?.affectedByGravity = false
        physicsBody?.dynamic = false
        physicsBody?.allowsRotation = false
        physicsBody?.collisionBitMask = PhysicsCategory.Wall | PhysicsCategory.Ball
        physicsBody?.categoryBitMask = PhysicsCategory.Paddle
        physicsBody?.restitution = 1
        physicsBody?.linearDamping = 0
        physicsBody?.friction = 0
        physicsBody?.angularDamping = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveToY(yPos: CGFloat) {
        moveToY(yPos, duration: 0)
    }
    
    func moveToY(yPos: CGFloat, duration: NSTimeInterval) {
        moveToY(yPos, duration: duration) {}
    }
    
    func moveToY(yPos: CGFloat, duration: NSTimeInterval, completion: () -> Void) {
        let yPositionAction = SKAction.moveToY(yPos, duration: duration)
        runAction(yPositionAction, completion: completion)
    }
    
    func moveByY(dy: CGFloat) {
        moveByY(dy, duration: 0)
    }
    
    func moveByY(dy: CGFloat, duration: NSTimeInterval) {
        let yPositionAction = SKAction.moveBy(CGVectorMake(0, dy), duration: duration)
        runAction(yPositionAction)
    }
}
