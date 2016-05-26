//
//  DynamicItemBasic.swift
//  StellarDemo
//
//  Created by AugustRush on 5/23/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

private let SolveForReverse = { (f: CFTimeInterval) in
    return 1 - f
}

private let SolveForUnReverse = { (f: CFTimeInterval) in
    return f
}

final class DynamicItemBasic<T: Interpolatable>: NSObject, UIDynamicItem {
    
    var duration: CFTimeInterval = 0.25
    var delay: CFTimeInterval = 0.0
    var timingFunction = TimingFunctionType.Default.timingFunction()
    var from: T
    var to: T
    var render: (T) -> Void
    var autoReverse = false
    var repeatCount = 0
    var completion: ((Bool) -> Void)?
    //External data to store (performance)
    var externalData: Any?
    
    weak var behavior: UIDynamicBehavior!
    private var complete = false
    private var isReversing = false
    private var solveProgress = SolveForUnReverse
    private lazy var beginTime: CFTimeInterval = {
        return CACurrentMediaTime()
    }()
    private lazy var epsilon: Double = {
        return 1.0 / (self.duration * 1000.0)
    }()
    
    //MARK: Life cycle methods
    init(from: T, to: T, render: (T) -> Void) {
        self.from = from
        self.to = to
        self.render = render
    }
    
    deinit {
        //do some thing
    }
    
    //MARK: update frame
    private func updateFrame() {
        let startTime = beginTime
        var currentTime = CACurrentMediaTime() - startTime - delay
        currentTime = max(0, currentTime)
        var progress = currentTime / duration
        if progress >= 1.0 {
            isReversing = autoReverse ? !isReversing : false
            if repeatCount == 0 {
                if isReversing {
                    progress = 0.0
                    beginTime = CACurrentMediaTime()
                    solveProgress = SolveForReverse
                } else {
                    progress = 1.0
                    behavior.cancel()
                    complete = true
                    self.completion?(complete)
                }
            }else {
                if isReversing == false {
                    repeatCount -= 1
                    solveProgress = SolveForUnReverse
                } else {
                    solveProgress = SolveForReverse
                }
                progress = 0.0
                beginTime = CACurrentMediaTime()
            }
        }
        let solveP = solveProgress(progress)
        let adjustProgress = timingFunction.solve(Scalar(solveP), epsilon: epsilon)
        let value = from.interpolate(adjustProgress, to: to, externalData: externalData)
        self.render(value)
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
