//
//  DynamicItem+Behavior.swift
//  StellarDemo
//
//  Created by AugustRush on 5/19/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

extension UIDynamicItem {
    
    func gravity(magnitude: CGFloat = 1.0, direction: CGVector = CGVectorMake(0, 1.0)) -> UIGravityBehavior {
        let gravity = UIGravityBehavior()
        gravity.gravityDirection = direction
        gravity.magnitude = magnitude
        gravity.addItem(self)
        return gravity
    }
    
    func snap(toPoint: CGPoint, damping: CGFloat = 0.5) -> UISnapBehavior {
        let snap = UISnapBehavior(item: self,snapToPoint: toPoint)
        snap.damping = damping
        return snap
    }
    
    func attachment(toAnchor: CGPoint, length: CGFloat = 0.0, damping: CGFloat = 0.5, frequency: CGFloat = 1.0) -> UIAttachmentBehavior {
        let attachment = UIAttachmentBehavior(item: self,attachedToAnchor: toAnchor)
        attachment.length = length
        attachment.damping = damping
        attachment.frequency = frequency
        return attachment
    }
    
    func push(direction: CGVector, mode:UIPushBehaviorMode = .Instantaneous, magnitude: CGFloat = 1.0) -> UIPushBehavior {
        let push = UIPushBehavior(items: [self], mode: mode)
        push.pushDirection = direction
        push.magnitude = magnitude
        return push
    }
    
    func collision(mode: UICollisionBehaviorMode = .Boundaries) -> UICollisionBehavior {
        let collision = UICollisionBehavior()
        collision.collisionMode = mode
        collision.addItem(self)
        return collision
    }
}
