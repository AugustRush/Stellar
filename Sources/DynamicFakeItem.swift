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
    var to: T
    var render: (T) -> Void
    var complete = false
    internal var fromP: CGPoint
    internal var toP: CGPoint
    private var change: CGFloat
    
    init(from: T, to: T, render: (T) -> Void) {
        self.from = from
        self.to = to
        self.fromP = from.reverse()
        self.toP = to.reverse()
        self.render = render
        self.center = self.fromP
        self.change = fabs(self.toP.y - self.fromP.y)
    }
    
    //MARK: UIDynamicItem protocol
    var center: CGPoint {
        didSet {
            let hasChanged = fabs(center.y - fromP.y)
            if hasChanged >= change {
                complete = true
            }
            let value = to.convert(center)
            self.render(value)
        }
    }
    var transform: CGAffineTransform = CGAffineTransformIdentity
    var bounds: CGRect {
        get {
            return CGRectMake(center.x, center.y, 100, 100)
        }
    }

}
