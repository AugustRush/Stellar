//
//  CALayer+AnimateBehavior.swift
//  StellarDemo
//
//  Created by AugustRush on 6/21/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

extension CALayer: DriveAnimateBehaviors {
    
    func behavior(forType type: AnimationType, step: AnimationStep) -> UIDynamicBehavior {
        
        let mainType = type.mainType
        let subType = type.subType
        
        return createDynamicBehavior(withStyle: mainType, subType: subType, step: step)
    }
    
    fileprivate func createDynamicBehavior(withStyle style: AnimationStyle, subType: AnimationSubType, step: AnimationStep) -> UIDynamicBehavior {
        
        var behavior: UIDynamicBehavior!
        
        switch subType {
        case .moveX(let inc):
            let from = self.position.x
            let to = from + inc
            let render = {(f: CGFloat) in
                self.position.x = f
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
            let from = self.position.y
            let to = from + inc
            let render = {(f: CGFloat) in
                self.position.y = f
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
            
        case .moveTo(let position):
            let from = self.position
            let to = position
            let render = {(p: CGPoint) in
                self.position = p
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
            
        case .moveXY(let x, let y):
            let from = CGPoint.zero
            let to = CGPoint(x: x, y: y)
            let frame = self.frame
            let render = {(p: CGPoint) in
                self.frame = frame.offsetBy(dx: p.x, dy: p.y)
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
            var from = UIColor.clear
            if let bc = self.backgroundColor {
                from = UIColor(cgColor: bc)
            }
            let to = color
            let render = {(c: UIColor) in
                self.backgroundColor = c.cgColor
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
            let from = self.opacity
            let to = o
            let render = {(f: Float) in
                self.opacity = f
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
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 1, 0, 0)
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
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 0, 1, 0)
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
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 0, 0, 1)
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
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 1, 1, 0)
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
            let from = self.bounds.width
            let to = w
            let render = {(f: CGFloat) in
                self.bounds.size.width = f
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
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DScale(transform, f, 1, 1)
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
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DScale(transform, 1, y, 1)
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
            let transform = self.transform
            let render = {(p: CGPoint) in
                self.transform = CATransform3DScale(transform, p.x, p.y, 1)
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
            let from = self.cornerRadius
            let to = r
            let render = {(f: CGFloat) in
                self.cornerRadius = f
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
            let from = self.borderWidth
            let to = b
            let render = {(f: CGFloat) in
                self.borderWidth = f
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
            let from = self.shadowRadius
            let to = s
            let render = {(f: CGFloat) in
                self.shadowRadius = f
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
            let from = self.zPosition
            let to = p
            let render = {(f: CGFloat) in
                self.zPosition = f
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
            let from = self.anchorPoint
            let to = point
            let render = {(p: CGPoint) in
                self.anchorPoint = p
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
            let from = self.anchorPointZ
            let to = z
            let render = {(f: CGFloat) in
                self.anchorPointZ = f
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
            let from = self.shadowOffset
            let to = size
            let render = {(s: CGSize) in
                self.shadowOffset = s
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
            let color = self.shadowColor
            let from = (color != nil) ? UIColor(cgColor: color!) : UIColor.clear
            let to = c
            let render = {(c: UIColor) in
                self.shadowColor = c.cgColor
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
            let from = self.shadowOpacity
            let to = o
            let render = {(f: Float) in
                self.shadowOpacity = f
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
    
    fileprivate func snapBehavior<T: Interpolatable>(_ damping: CGFloat, from: T, to: T, render: @escaping (T) -> Void) -> UIDynamicBehavior {
        let item = DynamicItem(from: from, to: to, render: render)
        let point = CGPoint(x: 0.0, y: item.referenceChangeLength)
        let snap = item.snapBehavior(point, damping: damping)
        item.behavior = snap
        
        return snap
    }
        
    fileprivate func attachmentBehavior<T: Interpolatable>(_ damping: CGFloat, frequency: CGFloat, from: T, to: T, render: @escaping (T) -> Void) -> UIDynamicBehavior {
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
