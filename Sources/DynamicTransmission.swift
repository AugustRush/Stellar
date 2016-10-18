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
    func progress() -> TimeInterval
}

private let SolveForReverse = { (f: TimeInterval) in
    return 1.0 - f
}

private let SolveForUnReverse = { (f: TimeInterval) in
    return f
}

////// Just like basic Animation TimingFunction

class BasicTransmission: DynamicTransmission {
    var duration: TimeInterval = 0.25
    var delay: TimeInterval = 0.0
    var speed: Double = 1.0
    var autoreverses = false
    var repeatCount: UInt = 0
    var timingCurve: TimingSolvable = TimingFunctionType.Default.easing()
    private var isReversing = false
    private var solveProgressBlock = SolveForUnReverse
    private lazy var beginTime: TimeInterval = {
        return CACurrentMediaTime()
    }()
    private lazy var epsilon: Double = {
        return 1.0 / (self.duration * 1000.0)
    }()
    //MARK: DynamicTransimission protocol
    var completed: Bool = false
    
    func progress() -> TimeInterval {
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

/// Spring Aniamtion Easing

class SpringTransmission: DynamicTransmission {
    var damping = 8.0 // > 0
    var stiffness = 100.0 // > 0
    var mass = 1.0 // > 0
    var initialVelocity = 0.0 // > 0 && < 1
    private lazy var solver: SpringSolver = {
        let solver = SpringSolver(damping: self.damping, stiffness: self.stiffness, mass: self.mass, initialVelocity: self.initialVelocity)
        return solver!
    }()
    private lazy var beginTime: TimeInterval = {
        return CACurrentMediaTime()
    }()
    
    var delay: TimeInterval = 0.0
    var completed: Bool {
        get {
            return self.solver.hasCorverd()
        }
    }
    
    func progress() -> TimeInterval {
        
        let currentInterval = CACurrentMediaTime() - self.beginTime - self.delay
        let progress = solver.solveOn(time: max(0.0, currentInterval))
        return progress
    }
    
    private class SpringSolver {
        var damping: Double
        var stiffness: Double// > 0
        var mass: Double // > 0
        var initialVelocity: Double
        private var initialPosition = -1.0
        // The time step that the solver uses, in seconds.
        private var solverDt = 0.001
        private var thresholdFactor = 0.001
        private var lastTime = 0.0
        private var accumulatedTime = 0.0
        private var currentPosition: Double = 0.0
        private var currentVelocity: Double = 0.0
        private var currentAcceleration: Double = 0.0
        private var start = false
        private var thresholdPosition = 0.0
        private var thresholdVelocity = 0.0
        private var thresholdAcceleration = 0.0
        
        //MARK: Init
        init?(damping: Double, stiffness: Double, mass: Double, initialVelocity: Double) {
            if damping < 0.0 ||
                mass < 0.0 ||
                stiffness < 0.0 ||
                initialVelocity < 0.0 {
                assert(false, "damping, stiffness, mass , initialVelocity should > 0.0!")
                return nil
            }
            
            self.damping = damping
            self.stiffness = stiffness
            self.mass = mass
            self.initialVelocity = initialVelocity
            let threshold = norm(dimensions: 1, values: [initialPosition]) * thresholdFactor
            self.thresholdPosition = threshold / 2; // half a unit
            self.thresholdVelocity = 25.0 * threshold; // 5 units per second, squared for comparison
            self.thresholdAcceleration = 625.0 * threshold * threshold; // 5 units per second squared, squared for comparison
            self.currentVelocity = initialVelocity
            self.currentPosition = initialPosition
        }
        
        //MARK: Public methods
        func solveOn(time: TimeInterval) -> Double {
            start = true
            if time < lastTime {
                return 0.0
            }
            
            self.accumulatedTime += (time - lastTime)
            var t = lastTime
            lastTime = time
            
            var curPosition, curVelocity, prevPosition, preVelocity: Double
            
            curPosition = self.currentPosition
            curVelocity = self.currentVelocity
            prevPosition = curPosition
            preVelocity = curVelocity
            
            while self.accumulatedTime >= self.solverDt {
                prevPosition = curPosition
                preVelocity = curVelocity
                
                integrate(position: &prevPosition, velocity: &preVelocity, t: &t, dt: &solverDt, outputPosition: &curPosition, outputVelocity: &curVelocity)
                t += solverDt
                self.accumulatedTime -= solverDt
            }
            
            let alpha = self.accumulatedTime / solverDt
            var advancedPosition = 0.0
            var advancedVelocity = 0.0
            
            interpolate(prevPosition, preVelocity, curPosition, curVelocity, alpha, &advancedPosition, &advancedVelocity)
            self.currentPosition = advancedPosition
            self.currentVelocity = advancedVelocity
            
            return self.currentPosition - self.initialPosition
        }
        
        func hasCorverd() -> Bool {
            if !start {
                return false
            }
            
            if fabs(self.currentPosition) >= self.thresholdPosition {
                return false
            }
            
            let velocityConverged = (squaredNorm(dimensions: 1, values: [self.currentVelocity]) < self.thresholdVelocity)
            let accelerationConverged = (squaredNorm(dimensions: 1, values: [self.currentAcceleration]) < self.thresholdAcceleration)
            
            return velocityConverged && accelerationConverged
        }
        
        //MARK: Private methods
        
        private func interpolate(_ previousPositionVector: Double,_ previousVelocityVector: Double,_ currentPositionVector: Double,_ currentVelocityVector: Double, _ alpha: Double, _ outputPositionVector: inout Double, _ outputVelocityVector: inout Double) -> Void {
            let currentPositionTimesAlpha = currentPositionVector * alpha
            let currentVelocityTimesAlpha = currentVelocityVector * alpha
            
            outputPositionVector = (1 - alpha) * previousPositionVector
            outputVelocityVector = (1 - alpha) * previousVelocityVector
            
            outputPositionVector += currentPositionTimesAlpha
            outputVelocityVector += currentVelocityTimesAlpha
        }
        
        private func integrate(position: inout Double, velocity: inout Double, t: inout Double, dt: inout Double, outputPosition: inout Double, outputVelocity: inout Double) -> Void {
            var derivativePositionA = 0.0
            var derivativePositionB = 0.0
            var derivativePositionC = 0.0
            var derivativePositionD = 0.0
            var derivativeVelocityA = 0.0
            var derivativeVelocityB = 0.0
            var derivativeVelocityC = 0.0
            var derivativeVelocityD = 0.0
            var dpdt = 0.0
            var dvdt = 0.0
            var dpdtTimesDt = 0.0
            var dvdtTimesDt = 0.0
            
            evalute(&position, &velocity, t, &derivativePositionA, &derivativeVelocityA)
            
            evaluateWithDerivative(&position, &velocity, t: t, dt*0.5, &derivativePositionA, &derivativeVelocityA, &derivativePositionB, &derivativeVelocityB)
            evaluateWithDerivative(&position, &velocity, t: t, dt*0.5, &derivativePositionB, &derivativeVelocityB, &derivativePositionC, &derivativeVelocityC)
            evaluateWithDerivative(&position, &velocity, t: t, dt, &derivativePositionC, &derivativeVelocityC, &derivativePositionD, &derivativeVelocityD)
            
            derivative(ax: derivativePositionA, bx: derivativePositionB, cx: derivativePositionC, dx: derivativePositionD, output: &dpdt)
            derivative(ax: derivativeVelocityA, bx: derivativeVelocityB, cx: derivativeVelocityC, dx: derivativeVelocityD, output: &dvdt)
            
            dpdtTimesDt = dt * dpdt
            dvdtTimesDt = dt * dvdt
            
            outputPosition = position + dpdtTimesDt
            outputVelocity = velocity + dvdtTimesDt
            
            self.currentAcceleration = dvdt
            
        }
        
        private func evalute(_ positionVector: inout Double, _ velocityVector: inout Double, _ t: Double, _ deltaPosition: inout Double, _ deltaVelocity: inout Double) -> Void {
            deltaPosition = velocityVector
            
            acceleration(&positionVector, &velocityVector, t, &deltaVelocity);
        }
        
        private func evaluateWithDerivative(_ initialPositionVector: inout Double, _ initialVelocityVector: inout Double, t: Double,_ dt: Double, _ inputDeltaPosition: inout Double, _ inputDeltaVelocity: inout Double, _ outputDeltaPosition: inout Double, _ outputDeltaVelocity: inout Double) -> Void {
            
            let dpdt = inputDeltaPosition * dt
            let dvdt = inputDeltaVelocity * dt
            var positionVector = initialPositionVector + dpdt
            var velocityVector = initialVelocityVector + dvdt
            
            outputDeltaPosition = velocityVector
            acceleration(&positionVector, &velocityVector, t + dt, &outputDeltaVelocity)
        }
        
        func derivative(ax: Double, bx: Double, cx: Double, dx: Double, output: inout Double) -> Void {
            output = bx + cx
            output *= 2.0
            output += ax
            output += dx
            output *= (1.0/6.0)
        }
        
        private func acceleration(_ positionVector: inout Double, _ velocityVector: inout Double, _ t: Double, _ accelerationVector: inout Double) {
            var intermediate1, intermediate2: Double
            intermediate1 = (-stiffness/mass) * positionVector
            intermediate2 = (damping/mass) * velocityVector
            accelerationVector = intermediate1 - intermediate2
        }
        
        
        private func squaredNorm(dimensions: Int, values: [Double]) -> Double {
            var result = 0.0
            for i in 0..<dimensions {
                result += values[i] * values[i]
            }
            
            return result
        }
        
        private func norm(dimensions: Int, values: [Double]) -> Double {
            return sqrt(squaredNorm(dimensions: dimensions, values: values))
        }
        
    }
}


