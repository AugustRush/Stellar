//
//  UIView+Dynamic.swift
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
    
    func fall(direction: PhysicalDirection = .Down) -> UIDynamicItem {
        let gravity = self.createGravity()
        switch direction {
        case .Angle(let a):
            gravity.setAngle(a, magnitude: 1.0)
        case .Left:
            gravity.gravityDirection = CGVectorMake(-1, 0)
        case .Right:
            gravity.gravityDirection = CGVectorMake(1, 0)
        case .Up:
            gravity.gravityDirection = CGVectorMake(0, -1)
        case .Down: 
            gravity.gravityDirection = CGVectorMake(0, 1)
        }
        //commit
        gravity.commit()
        return self
    }
    
    func snapTo(point: CGPoint, damping: CGFloat = 0.5) -> UIDynamicItem {
        let snap = self.createSnap(point, damping: damping)
        snap.commit()
        return self
    }
    

    func attachmentTo(anchor: CGPoint, length: CGFloat = 0.0, damping: CGFloat = 0.5, frequency: CGFloat = 1) -> UIDynamicItem {
        let attachment = self.createAttachment(anchor, length: length, damping: damping, frequency: frequency)
        attachment.commit()
        return self
    }
    
    func pushed(direction: PhysicalDirection, mode: UIPushBehaviorMode = .Instantaneous, magnitude: CGFloat = 1.0) -> UIDynamicItem {
        var angle: CGFloat = 0.0
        switch direction {
        case .Angle(let a):
            angle = a
        case .Left:
            angle = 180.0
        case .Right:
            angle = 0.0
        case .Up:
            angle = -90.0
        case .Down: 
            angle = 90.0
        }
        
        let push = self.createPush(angle, mode: mode, magnitude: magnitude)
        push.commit()
        return self
    }
    
    func collisionWith(path: UIBezierPath) -> UIDynamicItem {
        let collision = self.createCollision(path: path)
        collision.commit()
        return self
    }
    
    func collisionWith(items: UIDynamicItem...) -> UIDynamicItem {
        let collision = self.createCollision()
        for item in items {
            collision.addItem(item)
        }
        collision.commit()
        return self
    }
}
