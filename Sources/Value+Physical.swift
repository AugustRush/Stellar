//
//  DynamicItem+Physical.swift
//  StellarDemo
//
//  Created by AugustRush on 5/17/16.
//  Copyright © 2016 August. All rights reserved.
//
import UIKit

extension Float: Physical {
    
    func fallTo(to: Float,render: (Float) -> Void) {
        let item = DynamicItem<Float>(from: self, to: to,render: render)
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let gravity = item.gravityBehavior(1, direction: direction)
        item.behavior = gravity
        item.boundaryLimit = true
        gravity.commit()
    }
    
    func snapTo(to: Float,render: (Float) -> Void) {
        let item = DynamicItem<Float>(from: self, to: to, render: render)
        let snap = item.snapBehavior(item.toP, damping: 0.5)
        item.behavior = snap
        snap.commit()
    }
    
    func attachmentTo(to: Float,render: (Float) -> Void) {
        let item = DynamicItem<Float>(from: self, to: to,render: render)
        let attachment = item.attachmentBehavior(item.toP, length: 0.0, damping: 0.5, frequency: 1)
        item.behavior = attachment
        attachment.commit()
    }
    
    func pushedTo(to: Float,render: (Float) -> Void) {
        let item = DynamicItem<Float>(from: self,to: to,render: render)
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let push = item.pushBehavior(direction, mode: .Instantaneous, magnitude: 1.0)
        item.behavior = push
        item.boundaryLimit = true
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
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let gravity = item.gravityBehavior(1, direction: direction)
        item.behavior = gravity
        item.boundaryLimit = true
        gravity.commit()
    }
    
    func snapTo(to: CGFloat,render: (CGFloat) -> Void) {
        let item = DynamicItem<CGFloat>(from: self, to: to, render: render)
        let snap = item.snapBehavior(item.toP, damping: 0.5)
        item.behavior = snap
        snap.commit()
    }
    
    func attachmentTo(to: CGFloat,render: (CGFloat) -> Void) {
        let item = DynamicItem<CGFloat>(from: self, to: to,render: render)
        let attachment = item.attachmentBehavior(item.toP, length: 0.0, damping: 0.5, frequency: 1)
        item.behavior = attachment
        attachment.commit()
    }
    
    func pushedTo(to: CGFloat,render: (CGFloat) -> Void) {
        let item = DynamicItem<CGFloat>(from: self,to: to,render: render)
        item.boundaryLimit = true
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let push = item.pushBehavior(direction, mode: .Instantaneous, magnitude: 1.0)
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
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let gravity = item.gravityBehavior(1, direction: direction)
        item.behavior = gravity
        gravity.commit()
    }
    
    func snapTo(to: CGSize,render: (CGSize) -> Void) {
        let item = DynamicItem<CGSize>(from: self, to: to, render: render)
        let snap = item.snapBehavior(item.toP, damping: 0.5)
        item.behavior = snap
        snap.commit()
    }
    
    func attachmentTo(to: CGSize,render: (CGSize) -> Void) {
        let item = DynamicItem<CGSize>(from: self, to: to,render: render)
        let attachment = item.attachmentBehavior(item.toP, length: 0.0, damping: 0.5, frequency: 1)
        item.behavior = attachment
        attachment.commit()
    }
    
    func pushedTo(to: CGSize,render: (CGSize) -> Void) {
        let item = DynamicItem<CGSize>(from: self,to: to,render: render)
        item.boundaryLimit = true
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let push = item.pushBehavior(direction, mode: .Instantaneous, magnitude: 1.0)
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
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let gravity = item.gravityBehavior(1, direction: direction)
        item.behavior = gravity
        gravity.commit()
    }
    
    func snapTo(to: CGPoint,render: (CGPoint) -> Void) {
        let item = DynamicItem<CGPoint>(from: self, to: to, render: render)
        let snap = item.snapBehavior(item.toP, damping: 0.5)
        item.behavior = snap
        snap.commit()
    }
    
    func attachmentTo(to: CGPoint,render: (CGPoint) -> Void) {
        let item = DynamicItem<CGPoint>(from: self, to: to,render: render)
        let attachment = item.attachmentBehavior(item.toP, length: 0.0, damping: 0.5, frequency: 1)
        item.behavior = attachment
        attachment.commit()
    }
    
    func pushedTo(to: CGPoint,render: (CGPoint) -> Void) {
        let item = DynamicItem<CGPoint>(from: self,to: to,render: render)
        item.boundaryLimit = true
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let push = item.pushBehavior(direction, mode: .Instantaneous, magnitude: 1.0)
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
