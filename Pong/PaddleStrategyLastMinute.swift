//
//  PaddleStrategyLastMinute.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-16.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import UIKit

class PaddleStrategyLastMinute: PaddleStrategy {
    
    //use this to wait until a previous move has finished
    var reacted = false
    var halfWayPoint: CGFloat
    
    init(halfWayPoint: CGFloat) {
        self.halfWayPoint = halfWayPoint
    }
    
    func update(paddle: Paddle, ball: Ball) {
        if ball.position.x > halfWayPoint && !reacted {
            let dy = ball.position.y - paddle.position.y
            //have the paddle move anywhere from nowhere to overshooting it by 1.5x the distance
            let projectionPercent = CGFloat.random(0.0, b: 1.5)
            let projection: CGFloat = dy * projectionPercent
            paddle.moveToY(ball.position.y + projection, duration:0.5) {
                self.reacted = false
            }
            reacted = true
        }
    }
}
