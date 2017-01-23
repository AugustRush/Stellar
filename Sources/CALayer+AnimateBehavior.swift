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
        
        var behavior: UIDynamicBehavior!
        
        let mainType = type.mainType
        let subType = type.subType
        
        switch mainType {
        case .basic:
            behavior = createBasicAnimationWithType(subType, step: step)
        case .snap(let d):
            behavior = createSnapAnimationWithType(subType, damping: d)
        case .attachment(let damping, let frequency):
            behavior = createAttachmentAnimationWithType(subType, damping: damping, frequency: frequency)
        case .gravity(let magnitude):
            behavior = createGravityAnimationWithType(subType, magnitude: magnitude)
        }
        
        return behavior
    }
    
    //MARK: Basic
    fileprivate func createBasicAnimationWithType(_ type: AnimationSubType, step: AnimationStep) -> UIDynamicBehavior {
        
        var behavior: UIDynamicBehavior!
        
        switch type {
        case .moveTo(let position):
            let from = self.position
            let to = position
            let render = {(p: CGPoint) in
                self.position = p
            }
            
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .moveXY(let x, let y):
            let from = CGPoint.zero
            let to = CGPoint(x: x, y: y)
            let frame = self.frame
            let render = {(p: CGPoint) in
                self.frame = frame.offsetBy(dx: p.x, dy: p.y)
            }
            
            behavior = basicBehavior(step, from: from, to: to, render: render)
        case .color(let color):
            var from = UIColor.clear
            if let bc = self.backgroundColor {
                from = UIColor(cgColor: bc)
            }
            let to = color
            let render = {(c: UIColor) in
                self.backgroundColor = c.cgColor
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .opacity(let o):
            let from = self.opacity
            let to = o
            let render = {(f: Float) in
                self.opacity = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .rotateX(let x):
            let from: CGFloat = 0.0
            let to = x
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 1, 0, 0)
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .rotateY(let y):
            let from: CGFloat = 0.0
            let to = y
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 0, 1, 0)
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .rotate(let z):
            let from: CGFloat = 0.0
            let to = z
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 0, 0, 1)
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .rotateXY(let xy):
            let from: CGFloat = 0.0
            let to = xy
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 1, 1, 0)
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .width(let w):
            let from = self.bounds.width
            let to = w
            let render = {(f: CGFloat) in
                self.bounds.size.width = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .height(let h):
            let from = self.bounds.height
            let to = h
            let render = {(f: CGFloat) in
                self.bounds.size.height = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .size(let size):
            let from = self.bounds.size
            let to = size
            let render = {(s: CGSize) in
                self.bounds.size = s
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .frame(let frame):
            let from = self.frame
            let to = frame
            let render = {(f: CGRect) in
                self.frame = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .bounds(let frame):
            let from = self.bounds
            let to = frame
            let render = {(f: CGRect) in
                self.bounds = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .scaleX(let x):
            let from: CGFloat = 1.0
            let to = x
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DScale(transform, f, 1, 1)
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .scaleY(let y):
            let from: CGFloat = 1.0
            let to = y
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DScale(transform, 1, y, 1)
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .scaleXY(let x, let y):
            let from = CGPoint(x: 1, y: 1)
            let to = CGPoint(x: x, y: y)
            let transform = self.transform
            let render = {(p: CGPoint) in
                self.transform = CATransform3DScale(transform, p.x, p.y, 1)
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .cornerRadius(let r):
            let from = self.cornerRadius
            let to = r
            let render = {(f: CGFloat) in
                self.cornerRadius = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .borderWidth(let b):
            let from = self.borderWidth
            let to = b
            let render = {(f: CGFloat) in
                self.borderWidth = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .shadowRadius(let s):
            let from = self.shadowRadius
            let to = s
            let render = {(f: CGFloat) in
                self.shadowRadius = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .zPosition(let p):
            let from = self.zPosition
            let to = p
            let render = {(f: CGFloat) in
                self.zPosition = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .anchorPoint(let point):
            let from = self.anchorPoint
            let to = point
            let render = {(p: CGPoint) in
                self.anchorPoint = p
            }
            
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .anchorPointZ(let z):
            let from = self.anchorPointZ
            let to = z
            let render = {(f: CGFloat) in
                self.anchorPointZ = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .shadowOffset(let size):
            let from = self.shadowOffset
            let to = size
            let render = {(s: CGSize) in
                self.shadowOffset = s
            }
            
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .shadowColor(let c):
            let color = self.shadowColor
            let from = (color != nil) ? UIColor(cgColor: color!) : UIColor.clear
            let to = c
            let render = {(c: UIColor) in
                self.shadowColor = c.cgColor
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .shadowOpacity(let o):
            let from = self.shadowOpacity
            let to = o
            let render = {(f: Float) in
                self.shadowOpacity = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        default:
            fatalError("Should not be excute forever!")
        }
        
        return behavior
    }
    
    
    //MARK: Snap
    
    fileprivate func createSnapAnimationWithType(_ type: AnimationSubType, damping: CGFloat) -> UIDynamicBehavior {
        
        var behavior: UIDynamicBehavior!
        
        switch type {
        case .moveTo(let position):
            let from = self.position
            let to = position
            let render = {(p: CGPoint) in
                self.position = p
            }
            
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .moveXY(let x, let y):
            let from = CGPoint.zero
            let to = CGPoint(x: x, y: y)
            let frame = self.frame
            let render = {(p: CGPoint) in
                self.frame = frame.offsetBy(dx: p.x, dy: p.y)
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .color(let color):
            var from = UIColor.clear
            if let bc = self.backgroundColor {
                from = UIColor(cgColor: bc)
            }
            let to = color
            let render = {(c: UIColor) in
                self.backgroundColor = c.cgColor
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .opacity(let o):
            let from = self.opacity
            let to = o
            let render = {(f: Float) in
                self.opacity = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .rotateX(let x):
            let from: CGFloat = 0.0
            let to = x
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 1, 0, 0)
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .rotateY(let y):
            let from: CGFloat = 0.0
            let to = y
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 0, 1, 0)
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .rotate(let z):
            let from: CGFloat = 0.0
            let to = z
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 0, 0, 1)
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .rotateXY(let xy):
            let from: CGFloat = 0.0
            let to = xy
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 1, 1, 0)
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .width(let w):
            let from = self.bounds.width
            let to = w
            let render = {(f: CGFloat) in
                self.bounds.size.width = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .height(let h):
            let from = self.bounds.height
            let to = h
            let render = {(f: CGFloat) in
                self.bounds.size.height = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .size(let size):
            let from = self.bounds.size
            let to = size
            let render = {(s: CGSize) in
                self.bounds.size = s
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .frame(let frame):
            let from = self.frame
            let to = frame
            let render = {(f: CGRect) in
                self.frame = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .bounds(let frame):
            let from = self.bounds
            let to = frame
            let render = {(f: CGRect) in
                self.bounds = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .scaleX(let x):
            let from: CGFloat = 1.0
            let to = x
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DScale(transform, f, 1, 1)
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .scaleY(let y):
            let from: CGFloat = 1.0
            let to = y
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DScale(transform, 1, y, 1)
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .scaleXY(let x, let y):
            let from = CGPoint(x: 1, y: 1)
            let to = CGPoint(x: x, y: y)
            let transform = self.transform
            let render = {(p: CGPoint) in
                self.transform = CATransform3DScale(transform, p.x, p.y, 1)
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .cornerRadius(let r):
            let from = self.cornerRadius
            let to = r
            let render = {(f: CGFloat) in
                self.cornerRadius = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .borderWidth(let b):
            let from = self.borderWidth
            let to = b
            let render = {(f: CGFloat) in
                self.borderWidth = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .shadowRadius(let s):
            let from = self.shadowRadius
            let to = s
            let render = {(f: CGFloat) in
                self.shadowRadius = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .zPosition(let p):
            let from = self.zPosition
            let to = p
            let render = {(f: CGFloat) in
                self.zPosition = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .anchorPoint(let point):
            let from = self.anchorPoint
            let to = point
            let render = {(p: CGPoint) in
                self.anchorPoint = p
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .anchorPointZ(let z):
            let from = self.anchorPointZ
            let to = z
            let render = {(f: CGFloat) in
                self.anchorPointZ = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .shadowOffset(let size):
            let from = self.shadowOffset
            let to = size
            let render = {(s: CGSize) in
                self.shadowOffset = s
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .shadowColor(let c):
            let color = self.shadowColor
            let from = (color != nil) ? UIColor(cgColor: color!) : UIColor.clear
            let to = c
            let render = {(c: UIColor) in
                self.shadowColor = c.cgColor
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .shadowOpacity(let o):
            let from = self.shadowOpacity
            let to = o
            let render = {(f: Float) in
                self.shadowOpacity = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        default:
            fatalError("Should not be excute forever!")
        }
        
        return behavior
    }
    
    //MARK: Attachment
    fileprivate func createAttachmentAnimationWithType(_ type: AnimationSubType, damping: CGFloat, frequency: CGFloat) -> UIDynamicBehavior {
        var behavior: UIDynamicBehavior!
        
        switch type {
        case .moveTo(let position):
            let from = self.position
            let to = position
            let render = {(p: CGPoint) in
                self.position = p
            }
            
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .moveXY(let x, let y):
            let from = CGPoint.zero
            let to = CGPoint(x: x, y: y)
            let frame = self.frame
            let render = {(p: CGPoint) in
                self.frame = frame.offsetBy(dx: p.x, dy: p.y)
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .color(let color):
            var from = UIColor.clear
            if let bc = self.backgroundColor {
                from = UIColor(cgColor: bc)
            }
            let to = color
            let render = {(c: UIColor) in
                self.backgroundColor = c.cgColor
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .opacity(let o):
            let from = self.opacity
            let to = o
            let render = {(f: Float) in
                self.opacity = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .rotateX(let x):
            let from: CGFloat = 0.0
            let to = x
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 1, 0, 0)
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .rotateY(let y):
            let from: CGFloat = 0.0
            let to = y
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 0, 1, 0)
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .rotate(let z):
            let from: CGFloat = 0.0
            let to = z
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 0, 0, 1)
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .rotateXY(let xy):
            let from: CGFloat = 0.0
            let to = xy
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 1, 1, 0)
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .width(let w):
            let from = self.bounds.width
            let to = w
            let render = {(f: CGFloat) in
                self.bounds.size.width = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .height(let h):
            let from = self.bounds.height
            let to = h
            let render = {(f: CGFloat) in
                self.bounds.size.height = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .size(let size):
            let from = self.bounds.size
            let to = size
            let render = {(s: CGSize) in
                self.bounds.size = s
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .frame(let frame):
            let from = self.frame
            let to = frame
            let render = {(f: CGRect) in
                self.frame = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .bounds(let frame):
            let from = self.bounds
            let to = frame
            let render = {(f: CGRect) in
                self.bounds = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .scaleX(let x):
            let from: CGFloat = 1.0
            let to = x
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DScale(transform, f, 1, 1)
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .scaleY(let y):
            let from: CGFloat = 1.0
            let to = y
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DScale(transform, 1, y, 1)
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .scaleXY(let x, let y):
            let from = CGPoint(x: 1, y: 1)
            let to = CGPoint(x: x, y: y)
            let transform = self.transform
            let render = {(p: CGPoint) in
                self.transform = CATransform3DScale(transform, p.x, p.y, 1)
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .cornerRadius(let r):
            let from = self.cornerRadius
            let to = r
            let render = {(f: CGFloat) in
                self.cornerRadius = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .borderWidth(let b):
            let from = self.borderWidth
            let to = b
            let render = {(f: CGFloat) in
                self.borderWidth = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .shadowRadius(let s):
            let from = self.shadowRadius
            let to = s
            let render = {(f: CGFloat) in
                self.shadowRadius = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .zPosition(let p):
            let from = self.zPosition
            let to = p
            let render = {(f: CGFloat) in
                self.zPosition = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .anchorPoint(let point):
            let from = self.anchorPoint
            let to = point
            let render = {(p: CGPoint) in
                self.anchorPoint = p
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .anchorPointZ(let z):
            let from = self.anchorPointZ
            let to = z
            let render = {(f: CGFloat) in
                self.anchorPointZ = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .shadowOffset(let size):
            let from = self.shadowOffset
            let to = size
            let render = {(s: CGSize) in
                self.shadowOffset = s
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .shadowColor(let c):
            let color = self.shadowColor
            let from = (color != nil) ? UIColor(cgColor: color!) : UIColor.clear
            let to = c
            let render = {(c: UIColor) in
                self.shadowColor = c.cgColor
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .shadowOpacity(let o):
            let from = self.shadowOpacity
            let to = o
            let render = {(f: Float) in
                self.shadowOpacity = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        default:
            fatalError("Should not be excute forever!")
        }
        
        return behavior
    }
    
    //MARK: Gravity
    fileprivate func createGravityAnimationWithType(_ type: AnimationSubType, magnitude: Double) -> UIDynamicBehavior {
        var behavior: UIDynamicBehavior!
        
        switch type {
        case .moveTo(let position):
            let from = self.position
            let to = position
            let render = {(p: CGPoint) in
                self.position = p
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)

        case .moveXY(let x, let y):
            let from = CGPoint.zero
            let to = CGPoint(x: x, y: y)
            let frame = self.frame
            let render = {(p: CGPoint) in
                self.frame = frame.offsetBy(dx: p.x, dy: p.y)
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .color(let color):
            var from = UIColor.clear
            if let bc = self.backgroundColor {
                from = UIColor(cgColor: bc)
            }
            let to = color
            let render = {(c: UIColor) in
                self.backgroundColor = c.cgColor
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .opacity(let o):
            let from = self.opacity
            let to = o
            let render = {(f: Float) in
                self.opacity = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .rotateX(let x):
            let from: CGFloat = 0.0
            let to = x
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 1, 0, 0)
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .rotateY(let y):
            let from: CGFloat = 0.0
            let to = y
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 0, 1, 0)
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .rotate(let z):
            let from: CGFloat = 0.0
            let to = z
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 0, 0, 1)
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .rotateXY(let xy):
            let from: CGFloat = 0.0
            let to = xy
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 1, 1, 0)
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .width(let w):
            let from = self.bounds.width
            let to = w
            let render = {(f: CGFloat) in
                self.bounds.size.width = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .height(let h):
            let from = self.bounds.height
            let to = h
            let render = {(f: CGFloat) in
                self.bounds.size.height = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .size(let size):
            let from = self.bounds.size
            let to = size
            let render = {(s: CGSize) in
                self.bounds.size = s
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .frame(let frame):
            let from = self.frame
            let to = frame
            let render = {(f: CGRect) in
                self.frame = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .bounds(let frame):
            let from = self.bounds
            let to = frame
            let render = {(f: CGRect) in
                self.bounds = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .scaleX(let x):
            let from: CGFloat = 1.0
            let to = x
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DScale(transform, f, 1, 1)
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .scaleY(let y):
            let from: CGFloat = 1.0
            let to = y
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DScale(transform, 1, y, 1)
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .scaleXY(let x, let y):
            let from = CGPoint(x: 1, y: 1)
            let to = CGPoint(x: x, y: y)
            let transform = self.transform
            let render = {(p: CGPoint) in
                self.transform = CATransform3DScale(transform, p.x, p.y, 1)
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .cornerRadius(let r):
            let from = self.cornerRadius
            let to = r
            let render = {(f: CGFloat) in
                self.cornerRadius = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .borderWidth(let b):
            let from = self.borderWidth
            let to = b
            let render = {(f: CGFloat) in
                self.borderWidth = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .shadowRadius(let s):
            let from = self.shadowRadius
            let to = s
            let render = {(f: CGFloat) in
                self.shadowRadius = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .zPosition(let p):
            let from = self.zPosition
            let to = p
            let render = {(f: CGFloat) in
                self.zPosition = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .anchorPoint(let point):
            let from = self.anchorPoint
            let to = point
            let render = {(p: CGPoint) in
                self.anchorPoint = p
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .anchorPointZ(let z):
            let from = self.anchorPointZ
            let to = z
            let render = {(f: CGFloat) in
                self.anchorPointZ = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .shadowOffset(let size):
            let from = self.shadowOffset
            let to = size
            let render = {(s: CGSize) in
                self.shadowOffset = s
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .shadowColor(let c):
            let color = self.shadowColor
            let from = (color != nil) ? UIColor(cgColor: color!) : UIColor.clear
            let to = c
            let render = {(c: UIColor) in
                self.shadowColor = c.cgColor
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .shadowOpacity(let o):
            let from = self.shadowOpacity
            let to = o
            let render = {(f: Float) in
                self.shadowOpacity = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        default:
            fatalError("Should not be excute forever!")
            
            //        case .TextColor(let color):
            //            let fromColor = self.performSelector(Selector("textColor")).takeUnretainedValue() as? UIColor
            //            let from = fromColor ?? UIColor.clearColor()
            //            let to = color
            //            let render = { (cc: UIColor) in
            //                self.performSelector(Selector("setTextColor:"),withObject: cc)
            //            }
            //            behavior = basicBehavior(step, from: from, to: to, render: render)
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
