//
//  AnimationStep.swift
//  StellarDemo
//
//  Created by AugustRush on 9/26/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

enum UIAnimationType {
    case MoveX(CGFloat)
    case MoveY(CGFloat)
}

struct AnimationDescriptor {
    var type: UIAnimationType
}

class AnimationStep {
    var descriptors = Array<AnimationDescriptor>()
    var completion: (() -> Void)?
    
    func startAnimate(object: UIView) -> Void {
        for desc in descriptors {
            switch desc.type {
            case .MoveX(let inc):
                let transimission = BasicTransmission()
                transimission.timingCurve = TimingFunctionType.Default.easing()
                
                let animation = Animation<CGFloat>()
                animation.from = object.center.x
                animation.to = animation.from + inc
                animation.transmission = transimission
                animation.render = { (x) in
                    object.center.x = x
                }
                
                let identifier = String(unsafeBitCast(animation, to: Int.self))
                Animator.shared.addAnimation(animation, forKey: identifier)
            case .MoveY(let inc):
                let transimission = BasicTransmission()
                transimission.timingCurve = TimingFunctionType.Default.easing()
                
                let animation = Animation<CGFloat>()
                animation.from = object.center.y
                animation.to = animation.from + inc
                animation.transmission = transimission
                animation.render = { (y) in
                    object.center.y = y
                }
                
                let identifier = String(unsafeBitCast(animation, to: Int.self))
                Animator.shared.addAnimation(animation, forKey: identifier)
            }
        }
    }
}

class AnimationContext {
    //
    private var animationSequence: [AnimationStep] = Array()
    private weak var animatedObject: UIView?
    var isRuning = false
    
    //MARK: init method
    
    init(view: UIView) {
        animatedObject = view
    }
    
    //MARK: Public methods
    func addDescriptor(_ a: AnimationDescriptor) -> Void {
        let step = lastStep()
        step.descriptors.append(a)
    }
    
    func addStep() -> Void {
        let group = AnimationStep()
        animationSequence.append(group)
    }
    
    func commitAll() -> Void {
        if !isRuning {
            isRuning = true
            excuteFirstStepIfExist()
        }
    }
    
    //MARK: Private methods
    private func lastStep() -> AnimationStep {
        var step = animationSequence.last
        if step == nil {
            step = AnimationStep()
            animationSequence.append(step!)
        }
        return step!
    }
    
    private func excuteFirstStepIfExist() -> Void {
        let firstStep = animationSequence.first
        if let step = firstStep {
            step.startAnimate(object: animatedObject!)
        }
    }
}
