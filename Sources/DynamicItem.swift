//
//  DynamicItem.swift
//  StellarDemo
//
//  Created by AugustRush on 5/18/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

final class DynamicItem<T: Vectorial>: NSObject, UIDynamicItem {
    var from: T
    var to: T
    var render: (T) -> Void
    var boundaryLimit = false
    var complete = false
    var completion: (() -> Void)?
    weak var behavior: UIDynamicBehavior!
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
    
    deinit {
        //correct target value
        let value = to.convert(toP)
        render(value)
        //completion
        complete = true
        completion?()
    }
    
    //MARK: Update frame
    
    func updateFrame() {
        var current = center
        let hasChanged = fabs(current.y - fromP.y)
        if hasChanged >= change {
            if boundaryLimit {
                current = toP
                //remove behavior
                behavior.cancel()
                //completion
                complete = true
            }
        }
        let value = to.convert(current)
        render(value)
    }
    
    //MARK: UIDynamicItem protocol
    var center: CGPoint {
        didSet {
            updateFrame()
        }
    }
    var transform: CGAffineTransform = CGAffineTransformIdentity
    var bounds: CGRect {
        get {
            return CGRectMake(center.x, center.y, 100, 100)
        }
    }
}
