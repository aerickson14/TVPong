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
    var strategy: PaddleStrategy
    
    init(minY: CGFloat, maxY: CGFloat, size: CGSize, ball: Ball, strategy: PaddleStrategy) {
        self.ball = ball
        self.strategy = strategy
        super.init(minY: minY, maxY: maxY, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        strategy.update(self, ball: ball)
    }
}
