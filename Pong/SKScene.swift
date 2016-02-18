//
//  SKScene.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-26.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import SpriteKit

extension SKScene {
    
    //TODO: move to using the view controller extension
    func addPlayPauseRecognizer(selectorName: String) {
        let pauseGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector(selectorName))
        pauseGestureRecognizer.allowedPressTypes = [NSNumber(integer: UIPressType.PlayPause.rawValue)]
        self.view?.addGestureRecognizer(pauseGestureRecognizer)
    }
    
    func addMenuButtonRecognizer(selectorName: String) {
        let pauseGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector(selectorName))
        pauseGestureRecognizer.allowedPressTypes = [NSNumber(integer: UIPressType.Menu.rawValue)]
        self.view?.addGestureRecognizer(pauseGestureRecognizer)
    }
}
