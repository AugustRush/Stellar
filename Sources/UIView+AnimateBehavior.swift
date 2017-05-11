//
//  UIView+AnimateBehavior.swift
//  StellarDemo
//
//  Created by AugustRush on 6/21/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

extension UIView: DriveAnimateBehaviors {
    
    func behavior(forType type: AnimationType, step: AnimationStep) -> UIDynamicBehavior {
        
        let mainType = type.mainType
        let subType = type.subType
        
        return createDynamicBehavior(withStyle: mainType, subType: subType, step: step)
    }
    
    
    //MARK: Basic
    fileprivate func createDynamicBehavior(withStyle style: AnimationStyle, subType: AnimationSubType, step: AnimationStep) -> UIDynamicBehavior {
        
        var behavior: UIDynamicBehavior!
        
        switch subType {
        case .moveX(let inc):
            let from = self.center.x
            let to = from + inc
            let render = {(f: CGFloat) in
                self.center.x = f
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .moveY(let inc):
            let from = self.center.y
            let to = from + inc
            let render = {(f: CGFloat) in
                self.center.y = f
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .moveTo(let point):
            let from = self.center
            let to = point
            let render = {(p: CGPoint) in
                self.center = p
            }
            
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
        case .color(let color):
            let from = self.backgroundColor ?? UIColor.clear
            let to = color
            let render = {(c: UIColor) in
                self.backgroundColor = c
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
        case .opacity(let o):
            let from = self.layer.opacity
            let to = o
            let render = {(o: Float) in
                self.layer.opacity = o
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }

        case .alpha(let a):
            let from = self.alpha
            let to = a
            let render = {(f: CGFloat) in
                self.alpha = f
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .rotateX(let x):
            let from: CGFloat = 0.0
            let to = x
            let transform = self.layer.transform
            let render = {(f: CGFloat) in
                self.layer.transform = CATransform3DRotate(transform, f, 1, 0, 0)
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .rotateY(let y):
            let from: CGFloat = 0.0
            let to = y
            let transform = self.layer.transform
            let render = {(f: CGFloat) in
                self.layer.transform = CATransform3DRotate(transform, f, 0, 1, 0)
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .rotate(let z):
            let from: CGFloat = 0.0
            let to = z
            let transform = self.layer.transform
            let render = {(f: CGFloat) in
                self.layer.transform = CATransform3DRotate(transform, f, 0, 0, 1)
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .rotateXY(let xy):
            let from: CGFloat = 0.0
            let to = xy
            let transform = self.layer.transform
            let render = {(f: CGFloat) in
                self.layer.transform = CATransform3DRotate(transform, f, 1, 1, 0)
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .width(let w):
            let from = self.frame.width
            let to = w
            let render = {(f: CGFloat) in
                self.frame.size.width = f
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .height(let h):
            let from = self.bounds.height
            let to = h
            let render = {(f: CGFloat) in
                self.bounds.size.height = f
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .size(let size):
            let from = self.bounds.size
            let to = size
            let render = {(s: CGSize) in
                self.bounds.size = s
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .frame(let frame):
            let from = self.frame
            let to = frame
            let render = {(f: CGRect) in
                self.frame = f
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .bounds(let frame):
            let from = self.bounds
            let to = frame
            let render = {(f: CGRect) in
                self.bounds = f
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .scaleX(let x):
            let from: CGFloat = 1.0
            let to = x
            let transform = self.layer.transform
            let render = {(f: CGFloat) in
                self.layer.transform = CATransform3DScale(transform, f, 1, 1)
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .scaleY(let y):
            let from: CGFloat = 1.0
            let to = y
            let transform = self.layer.transform
            let render = {(f: CGFloat) in
                self.layer.transform = CATransform3DScale(transform, 1, y, 1)
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .scaleXY(let x, let y):
            let from = CGPoint(x: 1, y: 1)
            let to = CGPoint(x: x, y: y)
            let transform = self.layer.transform
            let render = {(p: CGPoint) in
                self.layer.transform = CATransform3DScale(transform, p.x, p.y, 1)
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .cornerRadius(let r):
            let from = self.layer.cornerRadius
            let to = r
            let render = {(f: CGFloat) in
                self.layer.cornerRadius = f
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .borderWidth(let b):
            let from = self.layer.borderWidth
            let to = b
            let render = {(f: CGFloat) in
                self.layer.borderWidth = f
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .shadowRadius(let s):
            let from = self.layer.shadowRadius
            let to = s
            let render = {(f: CGFloat) in
                self.layer.shadowRadius = f
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .zPosition(let p):
            let from = self.layer.zPosition
            let to = p
            let render = {(f: CGFloat) in
                self.layer.zPosition = f
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .anchorPoint(let point):
            let from = self.layer.anchorPoint
            let to = point
            let render = {(p: CGPoint) in
                self.layer.anchorPoint = p
            }
            
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .anchorPointZ(let z):
            let from = self.layer.anchorPointZ
            let to = z
            let render = {(f: CGFloat) in
                self.layer.anchorPointZ = f
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .shadowOffset(let size):
            let from = self.layer.shadowOffset
            let to = size
            let render = {(s: CGSize) in
                self.layer.shadowOffset = s
            }
            
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .shadowColor(let c):
            let color = self.layer.shadowColor
            let from = (color != nil) ? UIColor(cgColor: color!) : UIColor.clear
            let to = c
            let render = {(c: UIColor) in
                self.layer.shadowColor = c.cgColor
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .shadowOpacity(let o):
            let from = self.layer.shadowOpacity
            let to = o
            let render = {(f: Float) in
                self.layer.shadowOpacity = f
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
            
        case .tintColor(let color):
            let from = self.tintColor ?? UIColor.clear
            let to = color
            let render = {(c: UIColor) in
                self.tintColor = c
            }
            switch style {
            case .basic:
                behavior = basicBehavior(step, from: from, to: to, render: render)
            case .attachment(let damping, let frequency):
                behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            case .gravity(let magnitude):
                behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            case .snap(let damping):
                behavior = snapBehavior(damping, from: from, to: to, render: render)
            }
        case .textColor(let color):
            switch self {
            case let label as UILabel:
                let from = label.textColor ?? UIColor.clear
                let to = color
                let render = {(c: UIColor) in
                    label.textColor = c
                }
                switch style {
                case .basic:
                    behavior = basicBehavior(step, from: from, to: to, render: render)
                case .attachment(let damping, let frequency):
                    behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
                case .gravity(let magnitude):
                    behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
                case .snap(let damping):
                    behavior = snapBehavior(damping, from: from, to: to, render: render)
                }
                
            case let textView as UITextView:
                let from = textView.textColor ?? UIColor.clear
                let to = color
                let render = {(c: UIColor) in
                    textView.textColor = c
                }
                switch style {
                case .basic:
                    behavior = basicBehavior(step, from: from, to: to, render: render)
                case .attachment(let damping, let frequency):
                    behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
                case .gravity(let magnitude):
                    behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
                case .snap(let damping):
                    behavior = snapBehavior(damping, from: from, to: to, render: render)
                }

                
            default:
                fatalError("This object has not textColor property!")
            }
        
        default:
            fatalError("Unsupport this animation type!")
        }
        
        return behavior
    }
    
    //MARK: Private methods
    fileprivate func basicBehavior<T: Interpolatable>(_ step: AnimationStep,from: T, to: T, render: @escaping ((T) -> Void)) -> UIDynamicBehavior {
        let item = DynamicItemBasic(from: from, to: to, render: render)
        let push = item.pushBehavior(.down)
        item.behavior = push
        item.duration = step.duration
        item.timingFunction = step.timing.easing()
        item.delay = step.delay
        item.repeatCount = step.repeatCount
        item.autoreverses = step.autoreverses
        
        return push
    }
    
    fileprivate func snapBehavior<T: Vectorial>(_ damping: CGFloat, from: T, to: T, render: @escaping (T) -> Void) -> UIDynamicBehavior {
        let item = DynamicItem(from: from, to: to, render: render)
        let point = CGPoint(x: 0.0, y: item.referenceChangeLength)
        let snap = item.snapBehavior(point, damping: damping)
        item.behavior = snap
        
        return snap
    }
    
    
    fileprivate func attachmentBehavior<T: Vectorial>(_ damping: CGFloat, frequency: CGFloat, from: T, to: T, render: @escaping (T) -> Void) -> UIDynamicBehavior {
        let item = DynamicItem(from: from, to: to, render: render)
        let point = CGPoint(x: 0.0, y: item.referenceChangeLength)
        let attachment = item.attachmentBehavior(point, length: 0.0, damping: damping, frequency: frequency)
        item.behavior = attachment
        return attachment
    }
    
    fileprivate func gravityBehavior<T: Interpolatable>(_ magnitude: Double, from: T, to: T, render: @escaping (T) -> Void) -> UIDynamicBehavior {
        let item = DynamicItemGravity(from: from, to: to, render: render)
        let push = item.pushBehavior(.down)
        item.behavior = push
        item.magnitude = magnitude
        return push
    }

}
