//
//  DynamicItemBasic.swift
//  StellarDemo
//
//  Created by AugustRush on 5/23/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

final class DynamicItemBasic<T: Interpolatable>: NSObject, UIDynamicItem {
    
    var duration: CFTimeInterval = 0.25
    var timingFunction = TimingFunctionDefault
    var from: T
    var to: T
    var render: (T) -> Void
    var complete = false
    //For external data to store (performance)
    var externalData: Any?
    
    var behavior: UIDynamicBehavior!
    private lazy var beginTime: CFTimeInterval = {
        return CACurrentMediaTime()
    }()
    private lazy var epsilon: Double = {
        return 1.0 / (self.duration * 1000.0)
    }()
    
    init(from: T, to: T, render: (T) -> Void) {
        self.from = from
        self.to = to
        self.render = render
    }
    
    //MARK: UIDynamicItem protocol
    var center: CGPoint = CGPointZero {
        didSet {
            let startTime = beginTime
            let currentTime = CACurrentMediaTime() - startTime
            var progress = currentTime / duration
            if progress >= 1.0 {
                progress = 1.0
                complete = true
                behavior.cancel()
            }
            let adjustProgress = timingFunction.solve(Scalar(progress), epsilon: epsilon)
            let value = from.interpolate(adjustProgress, to: to, externalData: externalData)
            self.render(value)
        }
    }
    
    var transform: CGAffineTransform = CGAffineTransformIdentity
    var bounds: CGRect {
        get {
            return CGRectMake(0.0, 0.0, 100.0, 100.0)
        }
    }
}
