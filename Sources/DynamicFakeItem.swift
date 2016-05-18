//
//  DynamicFakeItem.swift
//  StellarDemo
//
//  Created by AugustRush on 5/18/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class DynamicFakeItem<T:Physical>: NSObject, UIDynamicItem {
    var from: T
    var to: CGPoint
    var render: (T) -> Void
    var complete = false
    
    init(from: T, to: (CGFloat,CGFloat), render: (T) -> Void) {
        self.from = from
        self.to = CGPointMake(to.0, to.1)
        self.render = render
    }
    
    //MARK: UIDynamicItem protocol
    var center: CGPoint = CGPointZero {
        didSet {
            var current = center
            if current.y >= to.y {
                current = to
                complete = true
            }
            self.render(from.convert(current))
        }
    }
    var transform: CGAffineTransform = CGAffineTransformIdentity
    var bounds: CGRect {
        get {
            return CGRectMake(0, 0, 100, 100)
        }
    }

}
