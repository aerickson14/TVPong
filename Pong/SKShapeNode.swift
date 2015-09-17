//
//  SKShapeNode.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-16.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import SpriteKit

extension SKShapeNode {
    
    func debugPath(rect: CGRect) {
        let path = CGPathCreateWithRect(rect, nil)
        let pathShape = SKShapeNode(path: path)
        
        pathShape.lineWidth = 1
        pathShape.strokeColor = SKColor.greenColor()
        addChild(pathShape)
        pathShape.zPosition = 1000
    }
}
