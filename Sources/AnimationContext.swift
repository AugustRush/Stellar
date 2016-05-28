//
//  AnimationContext.swift
//  StellarDemo
//
//  Created by AugustRush on 5/26/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

enum ViewAnimationSubType {
    case MoveX(CGFloat)
    case MoveY(CGFloat)
    case MoveTo(CGPoint)
    case Color(UIColor)
    case Alpha(CGFloat)
    case RotateX(CGFloat)
    case RotateY(CGFloat)
    case Rotate(CGFloat)
    case RotateXY(CGFloat)
    case Width(CGFloat)
    case Height(CGFloat)
    case Size(CGSize)
    case Frame(CGRect)
    case Bounds(CGRect)
    case ScaleX(CGFloat)
    case ScaleY(CGFloat)
    case ScaleXY(CGFloat,CGFloat)
    case CornerRadius(CGFloat)
    case BorderWidth(CGFloat)
    case ShadowRadius(CGFloat)
    case ZPosition(CGFloat)
    case AnchorPoint(CGPoint)
    case AnchorPointZ(CGFloat)
    case ShadowOffset(CGSize)
    case ShadowColor(UIColor)
    case ShadowOpacity(Float)
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
    func addAnimationType(type: AnimationType) {
        let step = lastStep()
        step.types.append(type)
    }
    
    func changeDuration(d: CFTimeInterval) {
        let step = lastStep()
        step.duration = d
    }
    
    func changeDelay(d: CFTimeInterval) {
        let step = lastStep()
        step.delay = d
    }
    
    func changeAutoreverses(a: Bool) {
        let step = lastStep()
        step.autoreverses = a
    }
    
    func changeCompletion(c: () -> Void) {
        let step = lastStep()
        step.completion = c
    }
    
    func changeEasing(e: TimingFunctionType) {
        let step = lastStep()
        step.easing = e
    }
    
    func changeMainType(type: ViewAnimationType) {
        let step = lastStep()
        let lastAnimationType = step.types.last
        guard let _ = lastAnimationType else {
            print("You should defined animaton first!")
            return
        }
        
        lastAnimationType!.mainType = type
    }
    
    func makeNextStep() {
        let step = Step()
        steps.append(step)
    }
    
    func commit() {
        excuteFirstStepIfExist()
    }
    
    
    //MARK: private methods
    
    private func lastStep() -> Step {
        var step = steps.last
        if step == nil {
            step = Step()
            steps.append(step!)
        }
        
        return step!
    }
    
    private func excuteFirstStepIfExist() {
        
        let step = steps.first
        
        if let step = step {
            for type in step.types {
                
                let mainType = type.mainType
                let subType = type.subType
                
                switch mainType {
                case .Basic:
                    createBasicAnimationWithType(subType, step: step)
                case .Snap(let d):
                    createSnapAnimationWithType(subType, damping: d)
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
    
    //MARK: Basic
    private func createBasicAnimationWithType(type: ViewAnimationSubType, step: Step) {
        
        var behavior: UIDynamicBehavior!
        
        switch type {
        case .MoveX(let inc):
            let from = view.center.x
            let to = view.center.x + inc
            let render = {(f: CGFloat) in
                if self.view != nil {
                    self.view.center.x = f
                }
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .MoveY(let inc):
            let from = view.center.y
            let to = view.center.y + inc
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.center.y = f
                }
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .MoveTo(let point):
            let from = self.view.center
            let to = point
            let render = {(p: CGPoint) in
                if let view = self.view {
                    view.center = p
                }
            }
            
            behavior = basicBehavior(step, from: from, to: to, render: render)
        case .Color(let color):
            let from = self.view.backgroundColor ?? UIColor.clearColor()
            let to = color
            let render = {(c: UIColor) in
                if let view = self.view {
                    view.backgroundColor = c
                }
            }
            let fromInfo = from.colorInfo()
            let toInfo = to.colorInfo()
            behavior = basicBehavior(step, from: from, to: to, render: render,externalData: (fromInfo,toInfo))
            
        case .Alpha(let a):
            let from = view.alpha
            let to = a
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.center.x = f
                }
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .RotateX(let x):
            let from: CGFloat = 0.0
            let to = x
            let transform = self.view.layer.transform
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.transform = CATransform3DRotate(transform, f, 1, 0, 0)
                }
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .RotateY(let y):
            let from: CGFloat = 0.0
            let to = y
            let transform = self.view.layer.transform
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.transform = CATransform3DRotate(transform, f, 0, 1, 0)
                }
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .Rotate(let z):
            let from: CGFloat = 0.0
            let to = z
            let transform = self.view.layer.transform
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.transform = CATransform3DRotate(transform, f, 0, 0, 1)
                }
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
        case .RotateXY(let xy):
            let from: CGFloat = 0.0
            let to = xy
            let transform = self.view.layer.transform
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.transform = CATransform3DRotate(transform, f, 1, 1, 0)
                }
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
        case .Width(let w):
            let from = self.view.bounds.width
            let to = w
            let render = {(f: CGFloat) in
                self.view.bounds.size.width = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
        case .Height(let h):
            let from = self.view.bounds.height
            let to = h
            let render = {(f: CGFloat) in
                self.view.bounds.size.height = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
        case .Size(let size):
            let from = self.view.bounds.size
            let to = size
            let render = {(s: CGSize) in
                self.view.bounds.size = s
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
        case .Frame(let frame):
            let from = self.view.frame
            let to = frame
            let render = {(f: CGRect) in
                self.view.frame = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
        case .Bounds(let frame):
            let from = self.view.bounds
            let to = frame
            let render = {(f: CGRect) in
                self.view.bounds = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .ScaleX(let x):
            let from: CGFloat = 1.0
            let to = x
            let transform = self.view.layer.transform
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.transform = CATransform3DScale(transform, f, 1, 1)
                }
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
        case .ScaleY(let y):
            let from: CGFloat = 1.0
            let to = y
            let transform = self.view.layer.transform
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.transform = CATransform3DScale(transform, 1, y, 1)
                }
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
        case .ScaleXY(let x, let y):
            let from = CGPointMake(1, 1)
            let to = CGPointMake(x, y)
            let transform = self.view.layer.transform
            let render = {(p: CGPoint) in
                if let view = self.view {
                    view.layer.transform = CATransform3DScale(transform, p.x, p.y, 1)
                }
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .CornerRadius(let r):
            let from = view.layer.cornerRadius
            let to = r
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.cornerRadius = f
                }
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .BorderWidth(let b):
            let from = view.layer.borderWidth
            let to = b
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.borderWidth = f
                }
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
        case .ShadowRadius(let s):
            let from = view.layer.shadowRadius
            let to = s
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.shadowRadius = f
                }
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
        case .ZPosition(let p):
            let from = view.layer.zPosition
            let to = p
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.zPosition = f
                }
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
        case .AnchorPoint(let point):
            let from = self.view.layer.anchorPoint
            let to = point
            let render = {(p: CGPoint) in
                if let view = self.view {
                    view.layer.anchorPoint = p
                }
            }
            
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .AnchorPointZ(let z):
            let from = view.layer.anchorPointZ
            let to = z
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.anchorPointZ = f
                }
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .ShadowOffset(let size):
            let from = self.view.layer.shadowOffset
            let to = size
            let render = {(s: CGSize) in
                if let view = self.view {
                    view.layer.shadowOffset = s
                }
            }
            
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .ShadowColor(let c):
            let color = self.view.layer.shadowColor
            let from = (color != nil) ? UIColor(CGColor: color!) : UIColor.clearColor()
            let to = c
            let render = {(c: UIColor) in
                if let view = self.view {
                    view.layer.shadowColor = c.CGColor
                }
            }
            let fromInfo = from.colorInfo()
            let toInfo = to.colorInfo()
            behavior = basicBehavior(step, from: from, to: to, render: render,externalData: (fromInfo,toInfo))
            
        case .ShadowOpacity(let o):
            let from = view.layer.shadowOpacity
            let to = o
            let render = {(f: Float) in
                if let view = self.view {
                    view.layer.shadowOpacity = f
                }
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
        }
        
        animator.addBehavior(behavior)
    }
    
    
    //basic item
    private func basicBehavior<T: Interpolatable>(step: Step,from: T, to: T, render: ((T) -> Void), externalData: Any? = nil) -> UIPushBehavior {
        let item = DynamicItemBasic(from: from, to: to, render: render)
        let push = item.pushBehavior(.Down)
        item.behavior = push
        item.duration = step.duration
        item.timingFunction = step.easing.timingFunction()
        item.delay = step.delay
        item.repeatCount = step.repeatCount
        item.autoreverses = step.autoreverses
        //May remove in future
        item.externalData = externalData
        
        return push
    }

    //MARK: Snap
 
    private func createSnapAnimationWithType(type: ViewAnimationSubType, damping: CGFloat) {
        
        var behavior: UIDynamicBehavior!
        
        switch type {
        case .MoveX(let inc):
            let from = self.view.center.x
            let to = from + inc
            let render = { (f: CGFloat) in
                if let view = self.view {
                    view.center.x = f
                }
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)

        case .MoveY(let inc):
            let from = self.view.center.y
            let to = from + inc
            let render = { (f: CGFloat) in
                if let view = self.view {
                    view.center.y = f
                }
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .MoveTo(let point):
            let from = self.view.center
            let to = point
            let render = { (p: CGPoint) in
                if let view = self.view {
                    view.center = p
                }
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)

        case .Color(let color):
            let from = self.view.backgroundColor ?? UIColor.clearColor()
            let to = color
            let render = {(c: UIColor) in
                if let view = self.view {
                    view.backgroundColor = c
                }
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .Alpha(let alpha):
            let from = view.alpha
            let to = alpha
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.center.x = f
                }
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)

        case .RotateX(let x):
            let from: CGFloat = 0.0
            let to = x
            let transform = self.view.layer.transform
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.transform = CATransform3DRotate(transform, f, 1, 0, 0)
                }
            }
            behavior = snapBehavior(damping, from: from, to: to , render: render)
            
        case .RotateY(let y):
            let from: CGFloat = 0.0
            let to = y
            let transform = self.view.layer.transform
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.transform = CATransform3DRotate(transform, f, 0, 1, 0)
                }
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .Rotate(let z):
            let from: CGFloat = 0.0
            let to = z
            let transform = self.view.layer.transform
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.transform = CATransform3DRotate(transform, f, 0, 0, 1)
                }
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .RotateXY(let xy):
            let from: CGFloat = 0.0
            let to = xy
            let transform = self.view.layer.transform
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.transform = CATransform3DRotate(transform, f, 1, 1, 0)
                }
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .Width(let w):
            let from = self.view.bounds.width
            let to = w
            let render = {(f: CGFloat) in
                self.view.bounds.size.width = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .Height(let h):
            let from = self.view.bounds.height
            let to = h
            let render = {(f: CGFloat) in
                self.view.bounds.size.height = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .Size(let size):
            let from = self.view.bounds.size
            let to = size
            let render = {(s: CGSize) in
                self.view.bounds.size = s
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .Frame(let frame):
            let from = self.view.frame
            let to = frame
            let render = {(f: CGRect) in
                self.view.frame = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .Bounds(let frame):
            let from = self.view.bounds
            let to = frame
            let render = {(f: CGRect) in
                self.view.bounds = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .ScaleX(let x):
            let from: CGFloat = 1.0
            let to = x
            let transform = self.view.layer.transform
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.transform = CATransform3DScale(transform, f, 1, 1)
                }
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .ScaleY(let y):
            let from: CGFloat = 1.0
            let to = y
            let transform = self.view.layer.transform
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.transform = CATransform3DScale(transform, 1, y, 1)
                }
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .ScaleXY(let x, let y):
            let from = CGPointMake(1, 1)
            let to = CGPointMake(x, y)
            let transform = self.view.layer.transform
            let render = {(p: CGPoint) in
                if let view = self.view {
                    view.layer.transform = CATransform3DScale(transform, p.x, p.y, 1)
                }
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .CornerRadius(let r):
            let from = view.layer.cornerRadius
            let to = r
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.cornerRadius = f
                }
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .BorderWidth(let b):
            let from = view.layer.borderWidth
            let to = b
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.borderWidth = f
                }
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .ShadowRadius(let s):
            let from = view.layer.shadowRadius
            let to = s
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.shadowRadius = f
                }
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .ZPosition(let p):
            let from = view.layer.zPosition
            let to = p
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.zPosition = f
                }
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .AnchorPoint(let point):
            let from = self.view.layer.anchorPoint
            let to = point
            let render = {(p: CGPoint) in
                if let view = self.view {
                    view.layer.anchorPoint = p
                }
            }
            
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .AnchorPointZ(let z):
            let from = view.layer.anchorPointZ
            let to = z
            let render = {(f: CGFloat) in
                if let view = self.view {
                    view.layer.anchorPointZ = f
                }
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .ShadowOffset(let size):
            let from = self.view.layer.shadowOffset
            let to = size
            let render = {(s: CGSize) in
                if let view = self.view {
                    view.layer.shadowOffset = s
                }
            }
            
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .ShadowColor(let c):
            let color = self.view.layer.shadowColor
            let from = (color != nil) ? UIColor(CGColor: color!) : UIColor.clearColor()
            let to = c
            let render = {(c: UIColor) in
                if let view = self.view {
                    view.layer.shadowColor = c.CGColor
                }
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .ShadowOpacity(let o):
            let from = view.layer.shadowOpacity
            let to = o
            let render = {(f: Float) in
                if let view = self.view {
                    view.layer.shadowOpacity = f
                }
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
        }
        
        animator.addBehavior(behavior)
    }
    
    private func snapBehavior<T: Vectorial>(damping: CGFloat, from: T, to: T, render: (T) -> Void) -> UIDynamicBehavior {
        let item = DynamicItem(from: from, to: to, render: render)
        let snap = item.snapBehavior(item.toP, damping: damping)
        item.behavior = snap
        
        return snap
    }
    
    private func snapBehavior<T: Vectorial2>(damping: CGFloat, from: T, to: T, render: (T) -> Void) -> UIDynamicBehavior {
        let item = DynamicItem2(from: from, to: to, render: render)
        let point = CGPointMake(0.0, item.referenceChangeLength)
        let snap = item.snapBehavior(point, damping: damping)
        item.behavior = snap
        
        return snap
    }

    
    //MARK: UIDynamicAnimatorDelegate methods
    
    func dynamicAnimatorDidPause(animator: UIDynamicAnimator) {
        animator.removeAllBehaviors()
        popFirstStepIfExsist()
        excuteFirstStepIfExist()
    }
    
    func dynamicAnimatorWillResume(animator: UIDynamicAnimator) {
        
    }
    
    //MARK: Private step class
    private class Step {
        var types = [AnimationType]()
        var duration: CFTimeInterval = 0.25
        var easing: TimingFunctionType = .Default
        var delay: CFTimeInterval = 0.0
        var autoreverses: Bool = false
        var repeatCount: Int = 0
        var completion: (() -> Void)?    
    }
}

//temp record for animation type
class AnimationType {
    var mainType: ViewAnimationType
    var subType: ViewAnimationSubType
    
    init (type: ViewAnimationType, subType: ViewAnimationSubType) {
        self.mainType = type
        self.subType = subType
    }
}

