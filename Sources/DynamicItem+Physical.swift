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
        let item = DynamicFakeItem<Float>(from: self,to: (0,CGFloat(to)),render: render)
        let gravity = Animator.shared.addDynamicItem(item, type: .Gravity) as! UIGravityBehavior
        gravity.action = {
            if item.complete {
                gravity.removeItem(item)
            }
        }
    }
    
    func snapTo(to: Float,render: (Float) -> Void) {
        let item = DynamicFakeItem<Float>(from: self,to: (0,CGFloat(to)),render: render)
        Animator.shared.addDynamicItem(item, type: .Snap) as! UISnapBehavior
    }
    
    func attachmentTo(to: Float,render: (Float) -> Void) {
        let item = DynamicFakeItem<Float>(from: self,to: (0,CGFloat(to)),render: render)
        Animator.shared.addDynamicItem(item, type: .Attachment)
    }
    
    func pushedTo(to: Float,render: (Float) -> Void) {
        let item = DynamicFakeItem<Float>(from: self,to: (0,CGFloat(to)),render: render)
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
}

extension CGFloat: Physical {
    
    func fallTo(to: CGFloat,render: (CGFloat) -> Void) {
        let item = DynamicFakeItem<CGFloat>(from: self,to: (0,to), render: render)
        let gravity = Animator.shared.addDynamicItem(item, type: .Gravity) as! UIGravityBehavior
        gravity.action = {
            if item.complete {
                gravity.removeItem(item)
            }
        }
    }
    
    func snapTo(to: CGFloat,render: (CGFloat) -> Void) {
        let item = DynamicFakeItem<CGFloat>(from: self,to: (0,to), render: render)
        Animator.shared.addDynamicItem(item, type: .Snap) as! UISnapBehavior
    }
    
    func attachmentTo(to: CGFloat,render: (CGFloat) -> Void) {
        let item = DynamicFakeItem<CGFloat>(from: self,to: (0,to),render: render)
        Animator.shared.addDynamicItem(item, type: .Attachment)
    }
    
    func pushedTo(to: CGFloat,render: (CGFloat) -> Void) {
        let item = DynamicFakeItem<CGFloat>(from: self,to: (0,to),render: render)
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
}

//extension CGSize: Physical {
//    func fallTo(to: CGSize, render: (CGSize) -> Void) {
//        let item = DynamicFakeItem<CGSize>(from: self,to: (to.width,to.height),render: render)
//        let gravity = Animator.shared.addDynamicItem(item, type: .Gravity) as! UIGravityBehavior
//        gravity.action = {
//            if item.complete {
//                gravity.removeItem(item)
//            }
//        }
//    }
//    
//    func snapTo(to: CGSize, render: (CGSize) -> Void) {
//        
//    }
//    
//    func attachmentTo(to: CGSize, render: (CGSize) -> Void) {
//        
//    }
//    
//    func pushedTo(to: CGSize, render: (CGSize) -> Void) {
//        
//    }
//    
//    func convert(y: CGFloat) -> CGSize {
//        return CGSizeMake(0, y)
//    }
//}
