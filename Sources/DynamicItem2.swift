//
//  DynamicItem2.swift
//  StellarDemo
//
//  Created by AugustRush on 5/21/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

//for 4 latitude
final class DynamicItem2<T: Vectorial2>: NSObject, UIDynamicItem {
    
    var from: T
    var to: T
    var render: (T) -> Void
    var complete = false
    var boundaryLimit = false
    var completion: (() -> Void)?
    internal var fromR: CGRect
    internal var toR: CGRect
    weak var behavior: UIDynamicBehavior!
    private var change: (x: CGFloat,y: CGFloat,z: CGFloat,w: CGFloat)
    var referenceChangeLength: CGFloat
    
    init(from: T, to: T, render: (T) -> Void) {
        self.from = from
        self.to = to
        self.render = render
        //
        self.fromR = from.reverse()
        self.toR = to.reverse()
        //
        let x = toR.minX - fromR.minX
        let y = toR.minY - fromR.minY
        let z = toR.width - fromR.width
        let w = toR.height - fromR.height
        self.change = (x,y,z,w)
        //
        let originChange = sqrt(x*x + y*y)
        let sizeChange = sqrt(z*z + w*w)
        self.referenceChangeLength = max(originChange, sizeChange)
        print(self.referenceChangeLength)
    }
    
    deinit {
        self.render(to)
        complete = true
        completion?()
    }
    
    //MARK: Update frame
    
    func updateFrame() {
        let yChange = center.y
        let progress = yChange / referenceChangeLength
        let curX = fromR.minX + change.x * progress;
        let curY = fromR.minY + change.y * progress;
        let curZ = fromR.width + change.z * progress;
        let curW = fromR.height + change.w * progress;
        
        let rect = CGRectMake(curX, curY, curZ, curW)
        var curV = from.convert(rect)
        if progress >= 1.0 {
            if boundaryLimit {
                curV = to
                behavior.cancel()
                complete = true
            }
        }
        self.render(curV)
    }
    
    //MARK: UIDynamicItem protocol
    var center: CGPoint = CGPointZero {
        didSet {
            updateFrame()
        }
    }
    
    var transform: CGAffineTransform = CGAffineTransformIdentity
    var bounds: CGRect {
        get {
            return CGRectMake(0.0, 0.0, 100.0, 100.0)
        }
    }
}
