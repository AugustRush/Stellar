//
//  DynamicItem+Physical.swift
//  StellarDemo
//
//  Created by AugustRush on 5/17/16.
//  Copyright © 2016 August. All rights reserved.
//
import UIKit

extension Float: Physical, Vectorial {
    
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
    
    func animationTo(to: Float, duration: CFTimeInterval = 0.25, timingFunction: TimingFunction = TimingFunctionDefault, render: (Float) -> Void) {
        
    }
    
    func convert(p: CGPoint) -> Float {
        return Float(p.y)
    }
    
    func reverse() -> CGPoint {
        return CGPointMake(0, CGFloat(self))
    }
}

extension Double: Physical, Vectorial {
    
    func fallTo(to: Double,render: (Double) -> Void) {
        let item = DynamicItem<Double>(from: self, to: to,render: render)
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let gravity = item.gravityBehavior(1, direction: direction)
        item.behavior = gravity
        item.boundaryLimit = true
        gravity.commit()
    }
    
    func snapTo(to: Double,render: (Double) -> Void) {
        let item = DynamicItem<Double>(from: self, to: to, render: render)
        let snap = item.snapBehavior(item.toP, damping: 0.5)
        item.behavior = snap
        snap.commit()
    }
    
    func attachmentTo(to: Double,render: (Double) -> Void) {
        let item = DynamicItem<Double>(from: self, to: to,render: render)
        let attachment = item.attachmentBehavior(item.toP, length: 0.0, damping: 0.5, frequency: 1)
        item.behavior = attachment
        attachment.commit()
    }
    
    func pushedTo(to: Double,render: (Double) -> Void) {
        let item = DynamicItem<Double>(from: self,to: to,render: render)
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let push = item.pushBehavior(direction, mode: .Instantaneous, magnitude: 1.0)
        item.behavior = push
        item.boundaryLimit = true
        push.commit()
    }
    
    func animationTo(to: Double, duration: CFTimeInterval = 0.25, timingFunction: TimingFunction = TimingFunctionDefault, render: (Double) -> Void) {
        
    }
    
    func convert(p: CGPoint) -> Double {
        return Double(p.y)
    }
    
    func reverse() -> CGPoint {
        return CGPointMake(0, CGFloat(self))
    }
}

extension CGFloat: Physical , Vectorial {
    
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
    
    func animationTo(to: CGFloat, duration: CFTimeInterval = 0.25, timingFunction: TimingFunction = TimingFunctionDefault, render: (CGFloat) -> Void) {
        
    }
    
    func convert(p: CGPoint) -> CGFloat {
        return p.y
    }
    
    func reverse() -> CGPoint {
        return CGPointMake(0, self)
    }
}

extension CGSize: Physical, Vectorial {
    
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
    
    func animationTo(to: CGSize, duration: CFTimeInterval = 0.25, timingFunction: TimingFunction = TimingFunctionDefault, render: (CGSize) -> Void) {
        
    }
    
    func convert(p: CGPoint) -> CGSize {
        return CGSizeMake(p.x, p.y)
    }
    
    func reverse() -> CGPoint {
        return CGPointMake(self.width, self.height)
    }
}

extension CGPoint: Physical, Vectorial {
    
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
    
    func animationTo(to: CGPoint, duration: CFTimeInterval = 0.25, timingFunction: TimingFunction = TimingFunctionDefault, render: (CGPoint) -> Void) {
        
    }
    
    func convert(p: CGPoint) -> CGPoint {
        return p
    }
    
    func reverse() -> CGPoint {
        return self
    }
}

extension CGRect: Physical, Vectorial2 {
    
    func fallTo(to: CGRect, render: (CGRect) -> Void) {
        let item = DynamicItem2(from: self, to: to, render: render)
        let gravity = item.gravityBehavior(1,direction: .Down)
        item.behavior = gravity
        item.boundaryLimit = true
        gravity.commit()
    }
    
    func snapTo(to: CGRect, render: (CGRect) -> Void) {
        let item = DynamicItem2(from: self, to: to, render:render)
        let snap = item.snapBehavior(CGPointMake(0.0, item.referenceChangeLength), damping: 0.5)
        item.behavior = snap
        snap.commit()
    }
    
    func attachmentTo(to: CGRect, render: (CGRect) -> Void) {
        let item = DynamicItem2(from: self, to: to, render:render)
        let point = CGPointMake(0.0, item.referenceChangeLength)
        let attachment = item.attachmentBehavior(point, length: 0.0, damping: 0.8, frequency: 1)
        item.behavior = attachment
        attachment.commit()
    }
    
    func pushedTo(to: CGRect, render: (CGRect) -> Void) {
        let item = DynamicItem2(from: self, to: to, render:render)
        let push = item.pushBehavior(.Down)
        push.magnitude = 2.0
        item.boundaryLimit = true
        item.behavior = push
        push.commit()
    }
    
    func animationTo(to: CGRect, duration: CFTimeInterval = 0.25, timingFunction: TimingFunction = TimingFunctionDefault, render: (CGRect) -> Void) {
        
    }
    
    func convert(r: CGRect) -> CGRect {
        return r
    }
    
    func reverse() -> CGRect {
        return self
    }
}

extension UIColor: Physical, Vectorial2 {
    
    func fallTo(to: UIColor, render: (UIColor) -> Void) {
        let item = DynamicItem2(from: self, to: to, render: render)
        let gravity = item.gravityBehavior(1,direction: .Down)
        item.behavior = gravity
        item.boundaryLimit = true
        gravity.commit()
    }
    
    func snapTo(to: UIColor, render: (UIColor) -> Void) {
        let item = DynamicItem2(from: self, to: to, render:render)
        let point = CGPointMake(0.0, item.referenceChangeLength)
        let snap = item.snapBehavior(point, damping: 0.99)
        item.behavior = snap
        item.boundaryLimit = true
        snap.commit()
    }
    
    func attachmentTo(to: UIColor, render: (UIColor) -> Void) {
        let item = DynamicItem2(from: self, to: to, render:render)
        let point = CGPointMake(0.0, item.referenceChangeLength)
        let attachment = item.attachmentBehavior(point, length: 0.0, damping: 0.8, frequency: 1)
        item.behavior = attachment
        attachment.commit()
    }
    
    func pushedTo(to: UIColor, render: (UIColor) -> Void) {
        let item = DynamicItem2(from: self, to: to, render:render)
        let push = item.pushBehavior(.Down)
        push.magnitude = 2.0
        item.boundaryLimit = true
        item.behavior = push
        push.commit()
    }
    
    func animationTo(to: UIColor, duration: CFTimeInterval = 0.25, timingFunction: TimingFunction = TimingFunctionDefault, render: (UIColor) -> Void) {
        
    }
    
    func convert(r: CGRect) -> Self {
        return convertT(r)
    }
    
    func reverse() -> CGRect {
        var hue: CGFloat = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        hue *= 250.0
        saturation *= 250.0
        brightness *= 250.0
        alpha *= 250.0
        return CGRect(x: hue, y: saturation, width: brightness, height: alpha)
    }
    
    private func convertT<T>(r: CGRect) -> T {
        let hue = r.minX / 250.0
        let saturation = r.minY / 250.0
        let brightness = r.width / 250.0
        let alpha = r.height / 250.0
        let color = UIColor(hue: hue,saturation: saturation,brightness: brightness,alpha: alpha)
        return unsafeBitCast(color, T.self)
    }
}
