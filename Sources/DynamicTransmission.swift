//
//  DynamicTransmission.swift
//  StellarDemo
//
//  Created by AugustRush on 9/20/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

protocol DynamicTransmission {
    
    var completed: Bool { get }
    func progress() -> CFTimeInterval
}

private let SolveForReverse = { (f: CFTimeInterval) in
    return 1 - f
}

private let SolveForUnReverse = { (f: CFTimeInterval) in
    return f
}

class BasicTransmission: DynamicTransmission {
    var duration: CFTimeInterval = 0.25
    var delay: CFTimeInterval = 0.0
    var speed: Double = 1.0
    var autoreverses = false
    var repeatCount = 0
    var timingCurve: TimingSolvable = TimingFunctionType.Default.easing()
    private var isReversing = false
    private var solveProgressBlock = SolveForUnReverse
    private lazy var beginTime: CFTimeInterval = {
        return CACurrentMediaTime()
    }()
    private lazy var epsilon: Double = {
        return 1.0 / (self.duration * 1000.0)
    }()
    //MARK: DynamicTransimission protocol
    var completed: Bool = false
    
    func progress() -> CFTimeInterval {
        let currentInterval = CACurrentMediaTime() - beginTime - delay
        var progress = (max(0.0, currentInterval) * speed) / duration
        
        if progress >= 1.0 {
            isReversing = autoreverses ? !isReversing : false
            if repeatCount == 0 {
                if isReversing {
                    progress = 0.0
                    beginTime = CACurrentMediaTime()
                    solveProgressBlock = SolveForReverse
                } else {
                    progress = 1.0
                    completed = true
                }
            }else {
                if isReversing == false {
                    repeatCount -= 1
                    solveProgressBlock = SolveForUnReverse
                } else {
                    solveProgressBlock = SolveForReverse
                }
                progress = 0.0
                beginTime = CACurrentMediaTime()
            }
        }

        let solveP = solveProgressBlock(progress)
        let adjustProgress = timingCurve.solveOn(time: solveP, epslion: epsilon)
        return adjustProgress
    }
    
}
