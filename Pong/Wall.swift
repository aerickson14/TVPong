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
        path = CGPathCreateWithRect(rect, nil)
        physicsBody = SKPhysicsBody(edgeLoopFromRect: rect)
        physicsBody?.categoryBitMask = PhysicsCategory.Wall
        physicsBody?.collisionBitMask = PhysicsCategory.Ball | PhysicsCategory.Paddle
        physicsBody?.restitution = 1
        physicsBody?.linearDamping = 0
        physicsBody?.friction = 0
        physicsBody?.angularDamping = 0
        
        //debugPath(rect)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
