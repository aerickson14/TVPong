//
//  CGFloat.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-23.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import SpriteKit

extension CGFloat {
    
    static func random(a: CGFloat, b: CGFloat) -> CGFloat {
        let range = abs(b-a)
        let step = CGFloat.random()
        return CGFloat.min(a, b: b) + (range * step)
    }
    
    static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX))
    }
    
    static func min <T : Comparable> (a: T, b: T) -> T {
        if a > b {
            return b
        }
        
        return a
    }

}