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
        self.physicsBody = SKPhysicsBody(rectangleOfSize: ballSize)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.dynamic = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.collisionBitMask = PhysicsCategory.Wall | PhysicsCategory.Paddle
        self.physicsBody?.categoryBitMask = PhysicsCategory.Ball
        self.physicsBody?.contactTestBitMask = PhysicsCategory.Wall
        self.physicsBody?.restitution = 1
        self.physicsBody?.linearDamping = 0
        self.physicsBody?.friction = 0
        self.physicsBody?.angularDamping = 0
        self.physicsBody?.usesPreciseCollisionDetection = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pushInRandomDirection() {
        self.physicsBody?.velocity = PositionHelper.randomStartVector(300)
    }
}
