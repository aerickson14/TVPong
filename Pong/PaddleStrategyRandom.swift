//
//  PaddleStrategyRandom.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-16.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import UIKit

class PaddleStrategyRandom: PaddleStrategy {
    
    func update(paddle: Paddle, ball: Ball) {
        let randomChoice = Int.random(0...3)
        if randomChoice == 1 {
            let dy = ball.position.y - paddle.position.y
            if (dy > 0) {
                paddle.moveByY(dy/4)
            } else if (dy < 0) {
                paddle.moveByY(dy/4)
            }
        }
    }
}
