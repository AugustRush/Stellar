//
//  DynamicItem+Physical.swift
//  StellarDemo
//
//  Created by AugustRush on 5/17/16.
//  Copyright © 2016 August. All rights reserved.
//
import UIKit

public typealias CGFloat2 = (CGFloat, CGFloat)

extension Float: Physical {
    
    func fallTo(to: Float,render: (Float) -> Void) {
        let item = DynamicFakeItem<Float>(from: self, to: to,render: render)
        let gravity = Animator.shared.addDynamicItem(item, type: .Gravity) as! UIGravityBehavior
        gravity.action = {
            if item.complete {
                gravity.removeItem(item)
            }
        }
    }
    
    func snapTo(to: Float,render: (Float) -> Void) {
        let item = DynamicFakeItem<Float>(from: self, to: to, render: render)
        Animator.shared.addDynamicItem(item, type: .Snap) as! UISnapBehavior
    }
    
    func attachmentTo(to: Float,render: (Float) -> Void) {
        let item = DynamicFakeItem<Float>(from: self, to: to,render: render)
        Animator.shared.addDynamicItem(item, type: .Attachment)
    }
    
    func pushedTo(to: Float,render: (Float) -> Void) {
        let item = DynamicFakeItem<Float>(from: self,to: to,render: render)
        let push = Animator.shared.addDynamicItem(item, type: .Push) as! UIPushBehavior
        push.action = {
            if item.complete {
                push.removeItem(item)
            }
        }
    }
    
    func convert(p: CGPoint) -> Float {
        return Float(p.y)
    }
    
    func reverse() -> CGPoint {
        return CGPointMake(0, CGFloat(self))
    }
}

extension CGFloat: Physical {
    
    func fallTo(to: CGFloat,render: (CGFloat) -> Void) {
        let item = DynamicFakeItem<CGFloat>(from: self, to: to,render: render)
        let gravity = Animator.shared.addDynamicItem(item, type: .Gravity) as! UIGravityBehavior
        gravity.action = {
            if item.complete {
                gravity.removeItem(item)
            }
        }
    }
    
    func snapTo(to: CGFloat,render: (CGFloat) -> Void) {
        let item = DynamicFakeItem<CGFloat>(from: self, to: to, render: render)
        Animator.shared.addDynamicItem(item, type: .Snap) as! UISnapBehavior
    }
    
    func attachmentTo(to: CGFloat,render: (CGFloat) -> Void) {
        let item = DynamicFakeItem<CGFloat>(from: self, to: to,render: render)
        Animator.shared.addDynamicItem(item, type: .Attachment)
    }
    
    func pushedTo(to: CGFloat,render: (CGFloat) -> Void) {
        let item = DynamicFakeItem<CGFloat>(from: self,to: to,render: render)
        let push = Animator.shared.addDynamicItem(item, type: .Push) as! UIPushBehavior
        push.action = {
            if item.complete {
                push.removeItem(item)
            }
        }
    }
    
    func convert(p: CGPoint) -> CGFloat {
        return p.y
    }
    
    func reverse() -> CGPoint {
        return CGPointMake(0, self)
    }
}

extension CGSize: Physical {
    
    func fallTo(to: CGSize,render: (CGSize) -> Void) {
        let item = DynamicFakeItem<CGSize>(from: self, to: to,render: render)
        let gravity = Animator.shared.addDynamicItem(item, type: .Gravity) as! UIGravityBehavior
        gravity.action = {
            if item.complete {
                gravity.removeItem(item)
            }
        }
    }
    
    func snapTo(to: CGSize,render: (CGSize) -> Void) {
        let item = DynamicFakeItem<CGSize>(from: self, to: to, render: render)
        Animator.shared.addDynamicItem(item, type: .Snap) as! UISnapBehavior
    }
    
    func attachmentTo(to: CGSize,render: (CGSize) -> Void) {
        let item = DynamicFakeItem<CGSize>(from: self, to: to,render: render)
        Animator.shared.addDynamicItem(item, type: .Attachment)
    }
    
    func pushedTo(to: CGSize,render: (CGSize) -> Void) {
        let item = DynamicFakeItem<CGSize>(from: self,to: to,render: render)
        let push = Animator.shared.addDynamicItem(item, type: .Push) as! UIPushBehavior
        push.action = {
            if item.complete {
                push.removeItem(item)
            }
        }
    }
    
    func convert(p: CGPoint) -> CGSize {
        return CGSizeMake(p.x, p.y)
    }
    
    func reverse() -> CGPoint {
        return CGPointMake(self.width, self.height)
    }
}

extension CGPoint: Physical {
    
    func fallTo(to: CGPoint,render: (CGPoint) -> Void) {
        let item = DynamicFakeItem<CGPoint>(from: self, to: to,render: render)
        let gravity = Animator.shared.addDynamicItem(item, type: .Gravity) as! UIGravityBehavior
        gravity.action = {
            if item.complete {
                gravity.removeItem(item)
            }
        }
    }
    
    func snapTo(to: CGPoint,render: (CGPoint) -> Void) {
        let item = DynamicFakeItem<CGPoint>(from: self, to: to, render: render)
        Animator.shared.addDynamicItem(item, type: .Snap) as! UISnapBehavior
    }
    
    func attachmentTo(to: CGPoint,render: (CGPoint) -> Void) {
        let item = DynamicFakeItem<CGPoint>(from: self, to: to,render: render)
        Animator.shared.addDynamicItem(item, type: .Attachment)
    }
    
    func pushedTo(to: CGPoint,render: (CGPoint) -> Void) {
        let item = DynamicFakeItem<CGPoint>(from: self,to: to,render: render)
        let push = Animator.shared.addDynamicItem(item, type: .Push) as! UIPushBehavior
        push.action = {
            if item.complete {
                push.removeItem(item)
            }
        }
    }
    
    func convert(p: CGPoint) -> CGPoint {
        return p
    }
    
    func reverse() -> CGPoint {
        return self
    }
}

extension UIView {
    
    func fallTo(point: CGPoint) -> Void {
        let center = self.center
        center.fallTo(point) { (p) in
            self.center = p
        }
    }
}
