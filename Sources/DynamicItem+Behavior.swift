//
//  DynamicItem+Behavior.swift
//  StellarDemo
//
//  Created by AugustRush on 5/19/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

enum PhysicalDirection {
    case Left
    case Right
    case Up
    case Down
    case Angle(CGFloat)
}

extension UIDynamicItem {
    
    //gravity
    func createGravity(magnitude: CGFloat = 1.0, direction: CGVector = CGVectorMake(0, 1.0)) -> UIGravityBehavior {
        let gravity = UIGravityBehavior()
        gravity.gravityDirection = direction
        gravity.magnitude = magnitude
        gravity.addItem(self)
        return gravity
    }
   
    func createGravity(magnitude: CGFloat = 1.0, direction: PhysicalDirection = .Down) -> UIGravityBehavior {
        let gravity = UIGravityBehavior()
        switch direction {
        case .Angle(let a):
            gravity.setAngle(a, magnitude: magnitude)
        case .Left:
            gravity.gravityDirection = CGVectorMake(-1, 0)
        case .Right:
            gravity.gravityDirection = CGVectorMake(1, 0)
        case .Up:
            gravity.gravityDirection = CGVectorMake(0, -1)
        case .Down:
            gravity.gravityDirection = CGVectorMake(0, 1)
        }
        gravity.magnitude = magnitude
        gravity.addItem(self)
        return gravity
    }

    //snap
    func createSnap(toPoint: CGPoint, damping: CGFloat = 0.5) -> UISnapBehavior {
        let snap = UISnapBehavior(item: self,snapToPoint: toPoint)
        snap.damping = damping
        return snap
    }
    
    //attachment
    func createAttachment(toAnchor: CGPoint, length: CGFloat = 0.0, damping: CGFloat = 0.5, frequency: CGFloat = 1.0) -> UIAttachmentBehavior {
        let attachment = UIAttachmentBehavior(item: self,attachedToAnchor: toAnchor)
        attachment.length = length
        attachment.damping = damping
        attachment.frequency = frequency
        return attachment
    }
    
    func createAttachment(toItem: UIDynamicItem, damping: CGFloat = 0.5, frequency: CGFloat = 1.0) -> UIAttachmentBehavior {
        let attachment = UIAttachmentBehavior(item: self,attachedToItem: toItem)
        attachment.damping = damping
        attachment.frequency = frequency
        return attachment
    }
    
    func createAttachment(toItem: UIDynamicItem, damping: CGFloat = 0.5, frequency: CGFloat = 1.0, length: CGFloat = 0.0) -> UIAttachmentBehavior {
        let attachment = UIAttachmentBehavior(item: self,attachedToItem: toItem)
        attachment.damping = damping
        attachment.length = length
        attachment.frequency = frequency
        return attachment
    }
    
    //push
    func createPush(direction: CGVector, mode:UIPushBehaviorMode = .Instantaneous, magnitude: CGFloat = 1.0) -> UIPushBehavior {
        let push = UIPushBehavior(items: [self], mode: mode)
        push.pushDirection = direction
        push.magnitude = magnitude
        return push
    }
    
    func createPush(direction: PhysicalDirection, mode:UIPushBehaviorMode = .Instantaneous, magnitude: CGFloat = 1.0) -> UIPushBehavior {
        let push = UIPushBehavior(items: [self], mode: mode)
        switch direction {
        case .Angle(let a):
            push.setAngle(a, magnitude: magnitude)
        case .Left:
            push.pushDirection = CGVectorMake(-1, 0)
        case .Right:
            push.pushDirection = CGVectorMake(1, 0)
        case .Up:
            push.pushDirection = CGVectorMake(0, -1)
        case .Down:
            push.pushDirection = CGVectorMake(0, 1)
        }
        
        push.magnitude = magnitude
        return push
    }

    
    func createPush(angle: CGFloat, mode:UIPushBehaviorMode = .Instantaneous, magnitude: CGFloat = 1.0) -> UIPushBehavior {
        let push = UIPushBehavior(items: [self], mode: mode)
        push.angle = angle
        push.magnitude = magnitude
        return push
    }
    
    //collision
    func createCollision(mode: UICollisionBehaviorMode = .Boundaries) -> UICollisionBehavior {
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
