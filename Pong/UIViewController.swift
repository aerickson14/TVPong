//
//  UIViewController.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-26.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func addPlayPauseRecognizer(selectorName: String) {
        let pauseGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector(selectorName))
        pauseGestureRecognizer.allowedPressTypes = [NSNumber(integer: UIPressType.PlayPause.rawValue)]
        self.view?.addGestureRecognizer(pauseGestureRecognizer)
    }
    
    func addSwipeRecognizer(direction: UISwipeGestureRecognizerDirection, selectorName: String) {
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: Selector(selectorName))
        swipeRecognizer.direction = direction
        self.view?.addGestureRecognizer(swipeRecognizer)
    }
}
