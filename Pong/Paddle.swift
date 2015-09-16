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
        let paddleSize = CGSizeMake(5, 60)
        super.init(texture: bodyTexture, color: UIColor.clearColor(), size: paddleSize)
        self.physicsBody = SKPhysicsBody(rectangleOfSize: paddleSize)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.dynamic = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.collisionBitMask = PhysicsCategory.Wall | PhysicsCategory.Ball
        self.physicsBody?.categoryBitMask = PhysicsCategory.Paddle
        self.physicsBody?.restitution = 1
        self.physicsBody?.linearDamping = 0
        self.physicsBody?.friction = 0
        self.physicsBody?.angularDamping = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveToY(yPos: CGFloat) {
        let yPositionAction = SKAction.moveToY(yPos, duration: 0)
        self.runAction(yPositionAction)
    }
    
    func moveByY(dy: CGFloat) {
        let yPositionAction = SKAction.moveBy(CGVectorMake(0, dy), duration: 0)
        self.runAction(yPositionAction)
    }
}
