//
//  ComputerPaddle.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-15.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import SpriteKit

class ComputerPaddle: Paddle {
    
    var ball: Ball
    
    init(ball: Ball) {
        self.ball = ball
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        moveToY(self.ball.position.y)
    }
}
