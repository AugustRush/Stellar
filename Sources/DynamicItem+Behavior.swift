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
    case Vector(CGFloat,CGFloat)
}

extension UIDynamicItem {
    
    //gravity
    func gravityBehavior(magnitude: CGFloat = 1.0, direction: PhysicalDirection = .Down) -> UIGravityBehavior {
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
        case .Vector(let x, let y):
            gravity.gravityDirection = CGVectorMake(x, y)
        }
        gravity.magnitude = magnitude
        gravity.addItem(self)
        return gravity
    }

    //snap
    func snapBehavior(toPoint: CGPoint, damping: CGFloat = 0.5) -> UISnapBehavior {
        let snap = UISnapBehavior(item: self,snapToPoint: toPoint)
        snap.damping = damping
        return snap
    }
    
    //attachment
    func attachmentBehavior(toAnchor: CGPoint, length: CGFloat = 0.0, damping: CGFloat = 0.5, frequency: CGFloat = 1.0) -> UIAttachmentBehavior {
        let attachment = UIAttachmentBehavior(item: self,attachedToAnchor: toAnchor)
        attachment.length = length
        attachment.damping = damping
        attachment.frequency = frequency
        return attachment
    }
    
    func attachmentBehavior(toItem: UIDynamicItem, damping: CGFloat = 0.5, frequency: CGFloat = 1.0) -> UIAttachmentBehavior {
        let attachment = UIAttachmentBehavior(item: self,attachedToItem: toItem)
        attachment.damping = damping
        attachment.frequency = frequency
        return attachment
    }
    
    func attachmentBehavior(toItem: UIDynamicItem, damping: CGFloat = 0.5, frequency: CGFloat = 1.0, length: CGFloat = 0.0) -> UIAttachmentBehavior {
        let attachment = UIAttachmentBehavior(item: self,attachedToItem: toItem)
        attachment.damping = damping
        attachment.length = length
        attachment.frequency = frequency
        return attachment
    }
    
    //push
    func pushBehavior(direction: CGVector, mode:UIPushBehaviorMode = .Instantaneous, magnitude: CGFloat = 1.0) -> UIPushBehavior {
        let push = UIPushBehavior(items: [self], mode: mode)
        push.pushDirection = direction
        push.magnitude = magnitude
        return push
    }
    
    func pushBehavior(direction: PhysicalDirection, mode:UIPushBehaviorMode = .Instantaneous, magnitude: CGFloat = 1.0) -> UIPushBehavior {
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
        case .Vector(let x, let y):
            push.pushDirection = CGVectorMake(x, y)
        }
        
        push.magnitude = magnitude
        return push
    }

    
    func pushBehavior(angle: CGFloat, mode:UIPushBehaviorMode = .Instantaneous, magnitude: CGFloat = 1.0) -> UIPushBehavior {
        let push = UIPushBehavior(items: [self], mode: mode)
        push.angle = angle
        push.magnitude = magnitude
        return push
    }
    
    //collision
    func collisionBehavior(mode: UICollisionBehaviorMode = .Boundaries) -> UICollisionBehavior {
        let collision = CollisionBehavior()
        collision.collisionMode = mode
        collision.addItem(self)
        return collision
    }
    
    func collisionBehavior(mode: UICollisionBehaviorMode = .Boundaries, path: UIBezierPath) -> UICollisionBehavior {
        let collision = CollisionBehavior()
        collision.collisionMode = mode
        let identifier = String(unsafeAddressOf(self))
        collision.addBoundaryWithIdentifier(identifier, forPath: path)
        collision.addItem(self)
        return collision
    }
    
    func collisionBehavior(mode: UICollisionBehaviorMode = .Boundaries, fromPoint: CGPoint, toPoint: CGPoint) -> UICollisionBehavior {
        let collision = CollisionBehavior()
        collision.collisionMode = mode
        let identifier = String(unsafeAddressOf(self))
        collision.addBoundaryWithIdentifier(identifier, fromPoint: fromPoint, toPoint: toPoint)
        collision.addItem(self)
        return collision
    }
    
    //itemBehavior
    func itemBehavior(elasticity: CGFloat = 0.5, friction: CGFloat = 0.5, density: CGFloat = 1, resistance: CGFloat = 0, angularResistance: CGFloat = 0, allowsRotation: Bool = true) -> UIDynamicItemBehavior {
        let behavior = UIDynamicItemBehavior()
        behavior.addItem(self)
        behavior.elasticity = elasticity
        behavior.friction = friction
        behavior.density = density
        behavior.resistance = resistance
        behavior.angularResistance = angularResistance
        behavior.allowsRotation = allowsRotation
        return behavior
    }
    
    //Example
    
}
