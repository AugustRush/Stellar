//
//  AnimationContext.swift
//  StellarDemo
//
//  Created by AugustRush on 5/26/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

enum ViewAnimationType {
    case Basic(ViewAnimationSubType)
    case Gravity
}

enum ViewAnimationSubType {
    case MoveX(CGFloat)
    case MoveY(CGFloat)
    
}

internal class AnimationContext: NSObject, UIDynamicAnimatorDelegate {
    private weak var view: UIView!
    private var steps = [Step]()
    private lazy var animator: UIDynamicAnimator = {
        let animator = UIDynamicAnimator()
        animator.delegate = self
        return animator
    }()
    
    //MARK: init method
    
    init(view: UIView) {
        self.view = view
    }
    
    //MARK: public methods
    func addAnimationType(type: ViewAnimationType) {
        var step = steps.last
        if step == nil {
            step = Step()
            steps.append(step!)
        }
        
        step!.types.append(type)
    }
    
    func changeDuration(d: CFTimeInterval) {
        let step = steps.last!
        step.duration = d
    }
    
    func changeDelay(d: CFTimeInterval) {
        let step = steps.last!
        step.delay = d
    }
    
    func changeAutoreverses(a: Bool) {
        let step = steps.last!
        step.autoreverses = a
    }
    
    func changeCompletion(c: () -> Void) {
        let step = steps.last!
        step.completion = c
    }
    
    func makeNextStep() {
        let step = Step()
        steps.append(step)
    }
    
    func commit() {
        excuteFirstStepIfExist()
    }
    
    //MARK: private methods
    
    private func excuteFirstStepIfExist() {
        
        let step = steps.first
        
        if let step = step {
            for type in step.types {
                
                switch type {
                case .Basic(let subType):
                    createBasicAnimationWithType(subType, step: step)
                case .Gravity:
                    print("support soon")
                }
            }
        }
    }
    
    private func popFirstStepIfExsist() {
        if !steps.isEmpty {
            let step = steps.first!
            //excute completion
            step.completion?()
            steps.removeFirst()
        }
    }
    
    private func createBasicAnimationWithType(type: ViewAnimationSubType, step: Step) {
        
        var behavior: UIDynamicBehavior!
        
        switch type {
        case .MoveX(let inc):
            let from = view.center.x
            let to = view.center.x + inc
            let render = {(f: CGFloat) in
                self.view.center.x = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .MoveY(let inc):
            let from = view.center.y
            let to = view.center.y + inc
            let render = {(f: CGFloat) in
                self.view.center.y = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
        }
        
        animator.addBehavior(behavior)
    }
    
    
    //basic item
    private func basicBehavior<T: Interpolatable>(step: Step,from: T, to: T, render: (T) -> Void) -> UIPushBehavior {
        let item = DynamicItemBasic(from: from, to: to, render: render)
        let push = item.pushBehavior(.Down)
        item.behavior = push
        item.duration = step.duration
        item.timingFunction = step.easing.timingFunction()
        item.delay = step.delay
        item.repeatCount = step.repeatCount
        item.autoreverses = step.autoreverses
        
        return push
    }

 
    //MARK: UIDynamicAnimatorDelegate methods
    
    func dynamicAnimatorDidPause(animator: UIDynamicAnimator) {
        print("step completion")
        popFirstStepIfExsist()
        excuteFirstStepIfExist()
    }
    
    func dynamicAnimatorWillResume(animator: UIDynamicAnimator) {
        
    }
    
    //MARK: Private step class
    private class Step {
        var types = [ViewAnimationType]()
        var duration: CFTimeInterval = 0.25
        var easing: TimingFunctionType = .Default
        var delay: CFTimeInterval = 0.0
        var autoreverses: Bool = false
        var repeatCount: Int = 0
        var completion: (() -> Void)?
    }
}
