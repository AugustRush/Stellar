//
//  DynamicItem.swift
//  StellarDemo
//
//  Created by AugustRush on 9/20/16.
//  Copyright © 2016 August. All rights reserved.
//

import Foundation

public protocol DynamicItem {
    
    func snapshot(to: Self, progress: Double) -> Self
}

extension DynamicItem {
    
    ////Default Easing type
    public func animateTo(_ to: Self, duration: TimeInterval = 0.25, delay: TimeInterval = 0.0, timingFunction: TimingFunctionType = .Default, render: @escaping (Self) -> Void, completion: (() -> Void)? ) -> Void {
        let transimission = BasicTransmission()
        transimission.timingCurve = timingFunction.easing()
        transimission.duration = duration
        transimission.delay = delay
        
        let animation = Animation<Self>()
        animation.from = self
        animation.to = to
        animation.transmission = transimission
        animation.render = render
        animation.completion = completion
        
        let identifier = String(unsafeBitCast(animation, to: Int.self))
        Animator.shared.addAnimation(animation, forKey: identifier)
    }
    
    public func animateTo(_ to: Self, duration: TimeInterval, timingFunction: TimingFunctionType = .Default, render: @escaping (Self) -> Void, completion: (() -> Void)? = nil) -> Void {
        animateTo(to, duration: duration, delay: 0.0, timingFunction: timingFunction, render: render, completion: completion)
    }
    
    ////// Custom Easing
    public func animateTo(_ to: Self, duration: TimeInterval = 0.25, delay: TimeInterval, easing: @escaping (Double) -> Double, render: @escaping (Self) -> Void, completion: (() -> Void)? ) -> Void {
        let transimission = BasicTransmission()
        transimission.timingCurve = EasingContainer(easing: easing)
        transimission.duration = duration
        transimission.delay = delay
        
        let animation = Animation<Self>()
        animation.from = self
        animation.to = to
        animation.transmission = transimission
        animation.render = render
        animation.completion = completion
        
        let identifier = String(unsafeBitCast(animation, to: Int.self))
        Animator.shared.addAnimation(animation, forKey: identifier)
    }
    
    public func animateTo(_ to: Self, duration: TimeInterval, easing: @escaping (Double) -> Double, render: @escaping (Self) -> Void, completion: (() -> Void)? = nil) -> Void {
        animateTo(to, duration: duration, delay: 0.0, easing: easing, render: render, completion: completion)
    }

    //Spring
    func springTo(_ to: Self, delay: Double, damping: Double = 8.0, stiffness: Double = 100.0, mass: Double = 1.0, initialVelocity: Double = 0.0, render: @escaping (Self) -> Void, completion: (() -> Swift.Void)? = nil) {
        let transimission = SpringTransmission()
        transimission.damping = damping
        transimission.stiffness = stiffness
        transimission.mass = mass
        transimission.initialVelocity = initialVelocity
        transimission.delay = delay
        
        let animation = Animation<Self>()
        animation.from = self
        animation.to = to
        animation.transmission = transimission
        animation.render = render
        animation.completion = completion
        
        let identifier = String(unsafeBitCast(animation, to: Int.self))
        Animator.shared.addAnimation(animation, forKey: identifier)
    }
    
    func springTo(_ to: Self, damping: Double = 8.0, stiffness: Double = 100.0, mass: Double = 1.0, initialVelocity: Double = 0.0, render: @escaping (Self) -> Void, completion: (() -> Swift.Void)? = nil) {
        springTo(to, delay: 0.0, damping: damping, stiffness: stiffness, mass: mass, initialVelocity: initialVelocity, render: render, completion: completion)
    }
}
