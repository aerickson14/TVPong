//
//  NSRange.swift
//  Pong
//
//  Created by Andrew Erickson on 2015-09-18.
//  Copyright © 2015 Andrew Erickson. All rights reserved.
//

import Foundation

extension NSRange {
    var endLocation: Int {
        get {
            return self.location + self.length
        }
    }
}