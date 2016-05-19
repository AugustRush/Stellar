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
        let item = DynamicItem<Float>(from: self, to: to,render: render)
        item.boundaryLimit = true
        let gravity = Animator.shared.createBehavior(item, type: .Gravity)
        item.behavior = gravity
        gravity.commit()
    }
    
    func snapTo(to: Float,render: (Float) -> Void) {
        let item = DynamicItem<Float>(from: self, to: to, render: render)
        let snap = Animator.shared.createBehavior(item, type: .Snap)
        item.behavior = snap
        snap.commit()
    }
    
    func attachmentTo(to: Float,render: (Float) -> Void) {
        let item = DynamicItem<Float>(from: self, to: to,render: render)
        let attachment = Animator.shared.createBehavior(item, type: .Attachment)
        item.behavior = attachment
        attachment.commit()
    }
    
    func pushedTo(to: Float,render: (Float) -> Void) {
        let item = DynamicItem<Float>(from: self,to: to,render: render)
        item.boundaryLimit = true
        let push = Animator.shared.createBehavior(item, type: .Push)
        item.behavior = push
        push.commit()
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
        let item = DynamicItem<CGFloat>(from: self, to: to,render: render)
        item.boundaryLimit = true
        let gravity = Animator.shared.createBehavior(item, type: .Gravity)
        item.behavior = gravity
        gravity.commit()
    }
    
    func snapTo(to: CGFloat,render: (CGFloat) -> Void) {
        let item = DynamicItem<CGFloat>(from: self, to: to, render: render)
        let snap = Animator.shared.createBehavior(item, type: .Snap) as! UISnapBehavior
        item.behavior = snap
        snap.commit()
    }
    
    func attachmentTo(to: CGFloat,render: (CGFloat) -> Void) {
        let item = DynamicItem<CGFloat>(from: self, to: to,render: render)
        let attachment = Animator.shared.createBehavior(item, type: .Attachment)
        item.behavior = attachment
        attachment.commit()
    }
    
    func pushedTo(to: CGFloat,render: (CGFloat) -> Void) {
        let item = DynamicItem<CGFloat>(from: self,to: to,render: render)
        item.boundaryLimit = true
        let push = Animator.shared.createBehavior(item, type: .Push)
        item.behavior = push
        push.commit()
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
        let item = DynamicItem<CGSize>(from: self, to: to,render: render)
        item.boundaryLimit = true
        let gravity = Animator.shared.createBehavior(item, type: .Gravity)
        item.behavior = gravity
        gravity.commit()
    }
    
    func snapTo(to: CGSize,render: (CGSize) -> Void) {
        let item = DynamicItem<CGSize>(from: self, to: to, render: render)
        let snap = Animator.shared.createBehavior(item, type: .Snap) as! UISnapBehavior
        item.behavior = snap
        snap.commit()
    }
    
    func attachmentTo(to: CGSize,render: (CGSize) -> Void) {
        let item = DynamicItem<CGSize>(from: self, to: to,render: render)
        let attachment = Animator.shared.createBehavior(item, type: .Attachment)
        item.behavior = attachment
        attachment.commit()
    }
    
    func pushedTo(to: CGSize,render: (CGSize) -> Void) {
        let item = DynamicItem<CGSize>(from: self,to: to,render: render)
        item.boundaryLimit = true
        let push = Animator.shared.createBehavior(item, type: .Push) as! UIPushBehavior
        item.behavior = push
        push.commit()
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
        let item = DynamicItem<CGPoint>(from: self, to: to,render: render)
        item.boundaryLimit = true
        let gravity = Animator.shared.createBehavior(item, type: .Gravity)
        item.behavior = gravity
        gravity.commit()
    }
    
    func snapTo(to: CGPoint,render: (CGPoint) -> Void) {
        let item = DynamicItem<CGPoint>(from: self, to: to, render: render)
        let snap = Animator.shared.createBehavior(item, type: .Snap) as! UISnapBehavior
        item.behavior = snap
        snap.commit()
    }
    
    func attachmentTo(to: CGPoint,render: (CGPoint) -> Void) {
        let item = DynamicItem<CGPoint>(from: self, to: to,render: render)
        let attachment = Animator.shared.createBehavior(item, type: .Attachment)
        item.behavior = attachment
        attachment.commit()
    }
    
    func pushedTo(to: CGPoint,render: (CGPoint) -> Void) {
        let item = DynamicItem<CGPoint>(from: self,to: to,render: render)
        item.boundaryLimit = true
        let push = Animator.shared.createBehavior(item, type: .Push) as! UIPushBehavior
        item.behavior = push
        push.commit()
    }
    
    func convert(p: CGPoint) -> CGPoint {
        return p
    }
    
    func reverse() -> CGPoint {
        return self
    }
}
