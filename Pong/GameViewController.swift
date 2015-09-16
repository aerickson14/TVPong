//
//  GameViewController.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-14.
//  Copyright (c) 2015 Andrew Erickson. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = GameScene(size: self.view.frame.size)
        let skView = self.view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
    }
}
