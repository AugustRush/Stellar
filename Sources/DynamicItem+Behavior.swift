//
//  DynamicItem+Behavior.swift
//  StellarDemo
//
//  Created by AugustRush on 5/19/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

extension UIDynamicItem {
    
    func createGravity(magnitude: CGFloat = 1.0, direction: CGVector = CGVectorMake(0, 1.0)) -> UIGravityBehavior {
        let gravity = UIGravityBehavior()
        gravity.gravityDirection = direction
        gravity.magnitude = magnitude
        gravity.addItem(self)
        return gravity
    }
    
    func createSnap(toPoint: CGPoint, damping: CGFloat = 0.5) -> UISnapBehavior {
        let snap = UISnapBehavior(item: self,snapToPoint: toPoint)
        snap.damping = damping
        return snap
    }
    
    func createAttachment(toAnchor: CGPoint, length: CGFloat = 0.0, damping: CGFloat = 0.5, frequency: CGFloat = 1.0) -> UIAttachmentBehavior {
        let attachment = UIAttachmentBehavior(item: self,attachedToAnchor: toAnchor)
        attachment.length = length
        attachment.damping = damping
        attachment.frequency = frequency
        return attachment
    }
    
    func createPush(direction: CGVector, mode:UIPushBehaviorMode = .Instantaneous, magnitude: CGFloat = 1.0) -> UIPushBehavior {
        let push = UIPushBehavior(items: [self], mode: mode)
        push.pushDirection = direction
        push.magnitude = magnitude
        return push
    }
    
    func createPush(angle: CGFloat, mode:UIPushBehaviorMode = .Instantaneous, magnitude: CGFloat = 1.0) -> UIPushBehavior {
        let push = UIPushBehavior(items: [self], mode: mode)
        push.angle = angle
        push.magnitude = magnitude
        return push
    }
    
    func createCollision(mode: UICollisionBehaviorMode = .Items) -> UICollisionBehavior {
        let collision = UICollisionBehavior()
        collision.collisionMode = mode
        collision.addItem(self)
        return collision
    }
    
    func createCollision(mode: UICollisionBehaviorMode = .Boundaries, path: UIBezierPath) -> UICollisionBehavior {
        let collision = UICollisionBehavior()
        collision.collisionMode = mode
        let identifier = String(unsafeAddressOf(self))
        collision.addBoundaryWithIdentifier(identifier, forPath: path)
        collision.addItem(self)
        return collision
    }
    
    func createCollision(mode: UICollisionBehaviorMode = .Boundaries, fromPoint: CGPoint, toPoint: CGPoint) -> UICollisionBehavior {
        let collision = UICollisionBehavior()
        collision.collisionMode = mode
        let identifier = String(unsafeAddressOf(self))
        collision.addBoundaryWithIdentifier(identifier, fromPoint: fromPoint, toPoint: toPoint)
        collision.addItem(self)
        return collision
    }

}
