//
//  Animator.swift
//  StellarDemo
//
//  Created by AugustRush on 5/17/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

enum PhysicalBehaviorType {
    case Gravity
    case Snap
    case Attachment
    case Push
    case collision
}

class Animator: NSObject, UIDynamicAnimatorDelegate {
    static let shared = Animator()
    var activedAnimators: [UIDynamicAnimator] = Array()
    
    
    //MARK: public methods
    func addDynamicItem<T: Physical>(item: DynamicFakeItem<T>, type: PhysicalBehaviorType) -> UIDynamicBehavior {
        
        let animator = UIDynamicAnimator()
        animator.delegate = self
        //behavior
        var behavior: UIDynamicBehavior!

        switch type {
        case .Gravity:
            let gravity = UIGravityBehavior()
            gravity.gravityDirection = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
            gravity.magnitude = 10
            gravity.addItem(item)
            behavior = gravity
        case .Snap:
            let snap = UISnapBehavior(item: item,snapToPoint: item.toP)
            snap.damping = 0.5
            behavior = snap
        case .Attachment:
            let attachment = UIAttachmentBehavior(item: item,attachedToAnchor: item.toP)
            attachment.length = 0.0
            attachment.damping = 2
            attachment.frequency = 2
            behavior = attachment
        case .Push:
            let push = UIPushBehavior(items: [item], mode: .Instantaneous)
            push.pushDirection = CGVectorMake(0, 1)
            push.magnitude = 1.0
            behavior = push
        case .collision: 
            let collision = UICollisionBehavior()
            collision.addItem(item)
            behavior = collision
        }
        
        animator.addBehavior(behavior)
        activedAnimators.append(animator)
        return behavior
    }
    
    //MARK: UIDynamicAnimatorDelegate methods
    
    func dynamicAnimatorDidPause(animator: UIDynamicAnimator) {
        print("dynamic paused")
        let index = activedAnimators.indexOf(animator)
        activedAnimators.removeAtIndex(index!)
    }
    
    func dynamicAnimatorWillResume(animator: UIDynamicAnimator) {
        print("dynamic resume")
    }
}
