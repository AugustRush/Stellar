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
        case .Basic:
            behavior = createBasicAnimationWithType(subType, step: step)
        case .Snap(let d):
            behavior = createSnapAnimationWithType(subType, damping: d)
        case .Attachment(let damping, let frequency):
            behavior = createAttachmentAnimationWithType(subType, damping: damping, frequency: frequency)
        case .Gravity(let magnitude):
            behavior = createGravityAnimationWithType(subType, magnitude: magnitude)
        }
        
        return behavior
    }
    
    //MARK: Basic
    private func createBasicAnimationWithType(type: AnimationSubType, step: AnimationStep) -> UIDynamicBehavior {
        
        var behavior: UIDynamicBehavior!
        
        switch type {
        case .MoveTo(let position):
            let from = self.position
            let to = position
            let render = {(p: CGPoint) in
                self.position = p
            }
            
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .MoveXY(let x, let y):
            let from = CGPointZero
            let to = CGPointMake(x, y)
            let frame = self.frame
            let render = {(p: CGPoint) in
                self.frame = CGRectOffset(frame, p.x, p.y)
            }
            
            behavior = basicBehavior(step, from: from, to: to, render: render)
        case .Color(let color):
            var from = UIColor.clearColor()
            if let bc = self.backgroundColor {
                from = UIColor(CGColor: bc)
            }
            let to = color
            let render = {(c: UIColor) in
                self.backgroundColor = c.CGColor
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .Opacity(let o):
            let from = self.opacity
            let to = o
            let render = {(f: Float) in
                self.opacity = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .RotateX(let x):
            let from: CGFloat = 0.0
            let to = x
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 1, 0, 0)
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .RotateY(let y):
            let from: CGFloat = 0.0
            let to = y
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 0, 1, 0)
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .Rotate(let z):
            let from: CGFloat = 0.0
            let to = z
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 0, 0, 1)
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .RotateXY(let xy):
            let from: CGFloat = 0.0
            let to = xy
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 1, 1, 0)
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .Width(let w):
            let from = self.bounds.width
            let to = w
            let render = {(f: CGFloat) in
                self.bounds.size.width = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .Height(let h):
            let from = self.bounds.height
            let to = h
            let render = {(f: CGFloat) in
                self.bounds.size.height = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .Size(let size):
            let from = self.bounds.size
            let to = size
            let render = {(s: CGSize) in
                self.bounds.size = s
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .Frame(let frame):
            let from = self.frame
            let to = frame
            let render = {(f: CGRect) in
                self.frame = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .Bounds(let frame):
            let from = self.bounds
            let to = frame
            let render = {(f: CGRect) in
                self.bounds = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .ScaleX(let x):
            let from: CGFloat = 1.0
            let to = x
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DScale(transform, f, 1, 1)
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .ScaleY(let y):
            let from: CGFloat = 1.0
            let to = y
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DScale(transform, 1, y, 1)
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .ScaleXY(let x, let y):
            let from = CGPointMake(1, 1)
            let to = CGPointMake(x, y)
            let transform = self.transform
            let render = {(p: CGPoint) in
                self.transform = CATransform3DScale(transform, p.x, p.y, 1)
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .CornerRadius(let r):
            let from = self.cornerRadius
            let to = r
            let render = {(f: CGFloat) in
                self.cornerRadius = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .BorderWidth(let b):
            let from = self.borderWidth
            let to = b
            let render = {(f: CGFloat) in
                self.borderWidth = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .ShadowRadius(let s):
            let from = self.shadowRadius
            let to = s
            let render = {(f: CGFloat) in
                self.shadowRadius = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .ZPosition(let p):
            let from = self.zPosition
            let to = p
            let render = {(f: CGFloat) in
                self.zPosition = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .AnchorPoint(let point):
            let from = self.anchorPoint
            let to = point
            let render = {(p: CGPoint) in
                self.anchorPoint = p
            }
            
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .AnchorPointZ(let z):
            let from = self.anchorPointZ
            let to = z
            let render = {(f: CGFloat) in
                self.anchorPointZ = f
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .ShadowOffset(let size):
            let from = self.shadowOffset
            let to = size
            let render = {(s: CGSize) in
                self.shadowOffset = s
            }
            
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .ShadowColor(let c):
            let color = self.shadowColor
            let from = (color != nil) ? UIColor(CGColor: color!) : UIColor.clearColor()
            let to = c
            let render = {(c: UIColor) in
                self.shadowColor = c.CGColor
            }
            behavior = basicBehavior(step, from: from, to: to, render: render)
            
        case .ShadowOpacity(let o):
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
    
    private func createSnapAnimationWithType(type: AnimationSubType, damping: CGFloat) -> UIDynamicBehavior {
        
        var behavior: UIDynamicBehavior!
        
        switch type {
        case .MoveTo(let position):
            let from = self.position
            let to = position
            let render = {(p: CGPoint) in
                self.position = p
            }
            
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .MoveXY(let x, let y):
            let from = CGPointZero
            let to = CGPointMake(x, y)
            let frame = self.frame
            let render = {(p: CGPoint) in
                self.frame = CGRectOffset(frame, p.x, p.y)
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .Color(let color):
            var from = UIColor.clearColor()
            if let bc = self.backgroundColor {
                from = UIColor(CGColor: bc)
            }
            let to = color
            let render = {(c: UIColor) in
                self.backgroundColor = c.CGColor
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .Opacity(let o):
            let from = self.opacity
            let to = o
            let render = {(f: Float) in
                self.opacity = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .RotateX(let x):
            let from: CGFloat = 0.0
            let to = x
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 1, 0, 0)
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .RotateY(let y):
            let from: CGFloat = 0.0
            let to = y
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 0, 1, 0)
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .Rotate(let z):
            let from: CGFloat = 0.0
            let to = z
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 0, 0, 1)
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .RotateXY(let xy):
            let from: CGFloat = 0.0
            let to = xy
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 1, 1, 0)
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .Width(let w):
            let from = self.bounds.width
            let to = w
            let render = {(f: CGFloat) in
                self.bounds.size.width = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .Height(let h):
            let from = self.bounds.height
            let to = h
            let render = {(f: CGFloat) in
                self.bounds.size.height = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .Size(let size):
            let from = self.bounds.size
            let to = size
            let render = {(s: CGSize) in
                self.bounds.size = s
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .Frame(let frame):
            let from = self.frame
            let to = frame
            let render = {(f: CGRect) in
                self.frame = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .Bounds(let frame):
            let from = self.bounds
            let to = frame
            let render = {(f: CGRect) in
                self.bounds = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .ScaleX(let x):
            let from: CGFloat = 1.0
            let to = x
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DScale(transform, f, 1, 1)
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .ScaleY(let y):
            let from: CGFloat = 1.0
            let to = y
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DScale(transform, 1, y, 1)
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .ScaleXY(let x, let y):
            let from = CGPointMake(1, 1)
            let to = CGPointMake(x, y)
            let transform = self.transform
            let render = {(p: CGPoint) in
                self.transform = CATransform3DScale(transform, p.x, p.y, 1)
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .CornerRadius(let r):
            let from = self.cornerRadius
            let to = r
            let render = {(f: CGFloat) in
                self.cornerRadius = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .BorderWidth(let b):
            let from = self.borderWidth
            let to = b
            let render = {(f: CGFloat) in
                self.borderWidth = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .ShadowRadius(let s):
            let from = self.shadowRadius
            let to = s
            let render = {(f: CGFloat) in
                self.shadowRadius = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .ZPosition(let p):
            let from = self.zPosition
            let to = p
            let render = {(f: CGFloat) in
                self.zPosition = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .AnchorPoint(let point):
            let from = self.anchorPoint
            let to = point
            let render = {(p: CGPoint) in
                self.anchorPoint = p
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .AnchorPointZ(let z):
            let from = self.anchorPointZ
            let to = z
            let render = {(f: CGFloat) in
                self.anchorPointZ = f
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .ShadowOffset(let size):
            let from = self.shadowOffset
            let to = size
            let render = {(s: CGSize) in
                self.shadowOffset = s
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .ShadowColor(let c):
            let color = self.shadowColor
            let from = (color != nil) ? UIColor(CGColor: color!) : UIColor.clearColor()
            let to = c
            let render = {(c: UIColor) in
                self.shadowColor = c.CGColor
            }
            behavior = snapBehavior(damping, from: from, to: to, render: render)
            
        case .ShadowOpacity(let o):
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
    private func createAttachmentAnimationWithType(type: AnimationSubType, damping: CGFloat, frequency: CGFloat) -> UIDynamicBehavior {
        var behavior: UIDynamicBehavior!
        
        switch type {
        case .MoveTo(let position):
            let from = self.position
            let to = position
            let render = {(p: CGPoint) in
                self.position = p
            }
            
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .MoveXY(let x, let y):
            let from = CGPointZero
            let to = CGPointMake(x, y)
            let frame = self.frame
            let render = {(p: CGPoint) in
                self.frame = CGRectOffset(frame, p.x, p.y)
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .Color(let color):
            var from = UIColor.clearColor()
            if let bc = self.backgroundColor {
                from = UIColor(CGColor: bc)
            }
            let to = color
            let render = {(c: UIColor) in
                self.backgroundColor = c.CGColor
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .Opacity(let o):
            let from = self.opacity
            let to = o
            let render = {(f: Float) in
                self.opacity = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .RotateX(let x):
            let from: CGFloat = 0.0
            let to = x
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 1, 0, 0)
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .RotateY(let y):
            let from: CGFloat = 0.0
            let to = y
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 0, 1, 0)
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .Rotate(let z):
            let from: CGFloat = 0.0
            let to = z
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 0, 0, 1)
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .RotateXY(let xy):
            let from: CGFloat = 0.0
            let to = xy
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 1, 1, 0)
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .Width(let w):
            let from = self.bounds.width
            let to = w
            let render = {(f: CGFloat) in
                self.bounds.size.width = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .Height(let h):
            let from = self.bounds.height
            let to = h
            let render = {(f: CGFloat) in
                self.bounds.size.height = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .Size(let size):
            let from = self.bounds.size
            let to = size
            let render = {(s: CGSize) in
                self.bounds.size = s
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .Frame(let frame):
            let from = self.frame
            let to = frame
            let render = {(f: CGRect) in
                self.frame = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .Bounds(let frame):
            let from = self.bounds
            let to = frame
            let render = {(f: CGRect) in
                self.bounds = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .ScaleX(let x):
            let from: CGFloat = 1.0
            let to = x
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DScale(transform, f, 1, 1)
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .ScaleY(let y):
            let from: CGFloat = 1.0
            let to = y
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DScale(transform, 1, y, 1)
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .ScaleXY(let x, let y):
            let from = CGPointMake(1, 1)
            let to = CGPointMake(x, y)
            let transform = self.transform
            let render = {(p: CGPoint) in
                self.transform = CATransform3DScale(transform, p.x, p.y, 1)
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .CornerRadius(let r):
            let from = self.cornerRadius
            let to = r
            let render = {(f: CGFloat) in
                self.cornerRadius = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .BorderWidth(let b):
            let from = self.borderWidth
            let to = b
            let render = {(f: CGFloat) in
                self.borderWidth = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .ShadowRadius(let s):
            let from = self.shadowRadius
            let to = s
            let render = {(f: CGFloat) in
                self.shadowRadius = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .ZPosition(let p):
            let from = self.zPosition
            let to = p
            let render = {(f: CGFloat) in
                self.zPosition = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .AnchorPoint(let point):
            let from = self.anchorPoint
            let to = point
            let render = {(p: CGPoint) in
                self.anchorPoint = p
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .AnchorPointZ(let z):
            let from = self.anchorPointZ
            let to = z
            let render = {(f: CGFloat) in
                self.anchorPointZ = f
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .ShadowOffset(let size):
            let from = self.shadowOffset
            let to = size
            let render = {(s: CGSize) in
                self.shadowOffset = s
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .ShadowColor(let c):
            let color = self.shadowColor
            let from = (color != nil) ? UIColor(CGColor: color!) : UIColor.clearColor()
            let to = c
            let render = {(c: UIColor) in
                self.shadowColor = c.CGColor
            }
            behavior = attachmentBehavior(damping, frequency: frequency, from: from, to: to, render: render)
            
        case .ShadowOpacity(let o):
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
    private func createGravityAnimationWithType(type: AnimationSubType, magnitude: Double) -> UIDynamicBehavior {
        var behavior: UIDynamicBehavior!
        
        switch type {
        case .MoveTo(let position):
            let from = self.position
            let to = position
            let render = {(p: CGPoint) in
                self.position = p
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)

        case .MoveXY(let x, let y):
            let from = CGPointZero
            let to = CGPointMake(x, y)
            let frame = self.frame
            let render = {(p: CGPoint) in
                self.frame = CGRectOffset(frame, p.x, p.y)
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .Color(let color):
            var from = UIColor.clearColor()
            if let bc = self.backgroundColor {
                from = UIColor(CGColor: bc)
            }
            let to = color
            let render = {(c: UIColor) in
                self.backgroundColor = c.CGColor
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .Opacity(let o):
            let from = self.opacity
            let to = o
            let render = {(f: Float) in
                self.opacity = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .RotateX(let x):
            let from: CGFloat = 0.0
            let to = x
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 1, 0, 0)
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .RotateY(let y):
            let from: CGFloat = 0.0
            let to = y
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 0, 1, 0)
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .Rotate(let z):
            let from: CGFloat = 0.0
            let to = z
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 0, 0, 1)
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .RotateXY(let xy):
            let from: CGFloat = 0.0
            let to = xy
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DRotate(transform, f, 1, 1, 0)
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .Width(let w):
            let from = self.bounds.width
            let to = w
            let render = {(f: CGFloat) in
                self.bounds.size.width = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .Height(let h):
            let from = self.bounds.height
            let to = h
            let render = {(f: CGFloat) in
                self.bounds.size.height = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .Size(let size):
            let from = self.bounds.size
            let to = size
            let render = {(s: CGSize) in
                self.bounds.size = s
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .Frame(let frame):
            let from = self.frame
            let to = frame
            let render = {(f: CGRect) in
                self.frame = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .Bounds(let frame):
            let from = self.bounds
            let to = frame
            let render = {(f: CGRect) in
                self.bounds = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .ScaleX(let x):
            let from: CGFloat = 1.0
            let to = x
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DScale(transform, f, 1, 1)
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .ScaleY(let y):
            let from: CGFloat = 1.0
            let to = y
            let transform = self.transform
            let render = {(f: CGFloat) in
                self.transform = CATransform3DScale(transform, 1, y, 1)
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .ScaleXY(let x, let y):
            let from = CGPointMake(1, 1)
            let to = CGPointMake(x, y)
            let transform = self.transform
            let render = {(p: CGPoint) in
                self.transform = CATransform3DScale(transform, p.x, p.y, 1)
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .CornerRadius(let r):
            let from = self.cornerRadius
            let to = r
            let render = {(f: CGFloat) in
                self.cornerRadius = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .BorderWidth(let b):
            let from = self.borderWidth
            let to = b
            let render = {(f: CGFloat) in
                self.borderWidth = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .ShadowRadius(let s):
            let from = self.shadowRadius
            let to = s
            let render = {(f: CGFloat) in
                self.shadowRadius = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .ZPosition(let p):
            let from = self.zPosition
            let to = p
            let render = {(f: CGFloat) in
                self.zPosition = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .AnchorPoint(let point):
            let from = self.anchorPoint
            let to = point
            let render = {(p: CGPoint) in
                self.anchorPoint = p
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .AnchorPointZ(let z):
            let from = self.anchorPointZ
            let to = z
            let render = {(f: CGFloat) in
                self.anchorPointZ = f
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .ShadowOffset(let size):
            let from = self.shadowOffset
            let to = size
            let render = {(s: CGSize) in
                self.shadowOffset = s
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .ShadowColor(let c):
            let color = self.shadowColor
            let from = (color != nil) ? UIColor(CGColor: color!) : UIColor.clearColor()
            let to = c
            let render = {(c: UIColor) in
                self.shadowColor = c.CGColor
            }
            behavior = gravityBehavior(magnitude, from: from, to: to, render: render)
            
        case .ShadowOpacity(let o):
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
    private func basicBehavior<T: Interpolatable>(step: AnimationStep,from: T, to: T, render: ((T) -> Void)) -> UIDynamicBehavior {
        let item = DynamicItemBasic(from: from, to: to, render: render)
        let push = item.pushBehavior(.Down)
        item.behavior = push
        item.duration = step.duration
        item.timingFunction = step.timing.easing()
        item.delay = step.delay
        item.repeatCount = step.repeatCount
        item.autoreverses = step.autoreverses
        
        return push
    }
    
    private func snapBehavior<T: Vectorial where T.VectorType == CGPoint>(damping: CGFloat, from: T, to: T, render: (T) -> Void) -> UIDynamicBehavior {
        let item = DynamicItem(from: from, to: to, render: render)
        let snap = item.snapBehavior(item.toP, damping: damping)
        item.behavior = snap
        
        return snap
    }
    
    private func snapBehavior<T: Vectorial where T.VectorType == CGRect>(damping: CGFloat, from: T, to: T, render: (T) -> Void) -> UIDynamicBehavior {
        let item = DynamicItem2(from: from, to: to, render: render)
        let point = CGPointMake(0.0, item.referenceChangeLength)
        let snap = item.snapBehavior(point, damping: damping)
        item.behavior = snap
        
        return snap
    }
    
    private func attachmentBehavior<T: Vectorial where T.VectorType == CGPoint>(damping: CGFloat, frequency: CGFloat, from: T, to: T, render: (T) -> Void) -> UIDynamicBehavior {
        let item = DynamicItem(from: from, to: to, render: render)
        let attachment = item.attachmentBehavior(item.toP, length: 0.0, damping: damping, frequency: frequency)
        item.behavior = attachment
        return attachment
    }
    
    private func attachmentBehavior<T: Vectorial where T.VectorType == CGRect>(damping: CGFloat, frequency: CGFloat, from: T, to: T, render: (T) -> Void) -> UIDynamicBehavior {
        let item = DynamicItem2(from: from, to: to, render: render)
        let point = CGPointMake(0.0, item.referenceChangeLength)
        let attachment = item.attachmentBehavior(point, length: 0.0, damping: damping, frequency: frequency)
        item.behavior = attachment
        return attachment
    }
    
    private func gravityBehavior<T: Interpolatable>(magnitude: Double, from: T, to: T, render: (T) -> Void) -> UIDynamicBehavior {
        let item = DynamicItemGravity(from: from, to: to, render: render)
        let push = item.pushBehavior(.Down)
        item.behavior = push
        item.magnitude = magnitude
        return push
    }

}