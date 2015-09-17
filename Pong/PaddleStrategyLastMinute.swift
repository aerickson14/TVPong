//
//  PaddleStrategyLastMinute.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-16.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import UIKit

class PaddleStrategyLastMinute: PaddleStrategy {
    
    var reacted = false
    
    func update(paddle: Paddle, ball: Ball) {
        if ball.position.x > 960 && !reacted {
            let dy = ball.position.y - paddle.position.y
            let projection: CGFloat = (dy < 0) ? 100 : -100
            paddle.moveToY(ball.position.y, duration:0.5) {
                self.reacted = false
            }
            reacted = true
        }
    }
}
