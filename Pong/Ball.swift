//
//  Ball.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-14.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import SpriteKit

class Ball: SKSpriteNode {
    
    init() {
        let bodyTexture = SKTexture(imageNamed: "ball")
        let ballSize = CGSizeMake(20, 20)
        super.init(texture: bodyTexture, color: UIColor.clearColor(), size: ballSize)
        physicsBody = SKPhysicsBody(rectangleOfSize: ballSize)
        physicsBody?.affectedByGravity = false
        physicsBody?.dynamic = true
        physicsBody?.allowsRotation = false
        physicsBody?.collisionBitMask = PhysicsCategory.Wall | PhysicsCategory.Paddle
        physicsBody?.categoryBitMask = PhysicsCategory.Ball
        physicsBody?.contactTestBitMask = PhysicsCategory.Wall
        physicsBody?.restitution = 1
        physicsBody?.linearDamping = 0
        physicsBody?.friction = 0
        physicsBody?.angularDamping = 0
        physicsBody?.usesPreciseCollisionDetection = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pushInRandomDirection() {
        physicsBody?.velocity = PositionHelper.randomStartVector(300)
    }
}
