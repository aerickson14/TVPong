//
//  Paddle.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-14.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import SpriteKit

class Paddle: SKSpriteNode {
    
    let yRange: NSRange
    
    init(minY: CGFloat, maxY: CGFloat, size: CGSize) {
        let bodyTexture = SKTexture(imageNamed: "paddle")
        let paddleSize = size
        self.yRange = NSMakeRange(Int(minY), Int(maxY-minY+1))
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
    
    func moveToY(var yPos: CGFloat, duration: NSTimeInterval, completion: () -> Void) {
        yPos = restrictYPos(yPos)
        let yPositionAction = SKAction.moveToY(yPos, duration: duration)
        runAction(yPositionAction, completion: completion)
    }
    
    func moveByY(dy: CGFloat) {
        moveByY(dy, duration: 0)
    }
    
    func moveByY(dy: CGFloat, duration: NSTimeInterval) {
        let yPos = restrictYPos(self.position.y + dy)
        let yPositionAction = SKAction.moveToY(yPos, duration: duration)
        runAction(yPositionAction)
    }
    
    private func restrictYPos(yPos: CGFloat) -> CGFloat {
        if yPos < CGFloat(yRange.location) {
            return CGFloat(yRange.location)
        } else if yPos > CGFloat(yRange.endLocation) {
            return CGFloat(yRange.endLocation)
        }
        
        return yPos
    }
}
