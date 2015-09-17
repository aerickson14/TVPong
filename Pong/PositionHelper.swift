//
//  PositionHelper.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-14.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import UIKit

class PositionHelper {
    
    /**
    * We dont want to use -0.5 < dx < 0.5 because we dont want the initial velocity to be directly up or down
    * similarly we dont want -0.5 < dy < 0.5 because we dont want the initial velocity to be right at a paddle
    */
    class func randomStartVector(speed: CGFloat) -> CGVector {
        var dx = randomBetweenNumbers(0.5, secondNum: 1)
        if Int.random(0...1) == 1 {
            dx *= -1
        }
        
        var dy = randomBetweenNumbers(0.5, secondNum: 1)
        if Int.random(0...1) == 1 {
            dy *= -1
        }
        
        return CGVectorMake(dx*speed, dy*speed)
    }
    
    private class func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}