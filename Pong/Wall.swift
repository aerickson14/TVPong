//
//  Wall.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-14.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import SpriteKit

class Wall: SKShapeNode {
    
    init(rect: CGRect) {
        super.init()
        self.path = CGPathCreateWithRect(rect, nil)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: rect)
        self.physicsBody?.categoryBitMask = PhysicsCategory.Wall
        self.physicsBody?.collisionBitMask = PhysicsCategory.Ball | PhysicsCategory.Paddle
        self.physicsBody?.restitution = 1
        self.physicsBody?.linearDamping = 0
        self.physicsBody?.friction = 0
        self.physicsBody?.angularDamping = 0
        
        //debugPath(rect)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
