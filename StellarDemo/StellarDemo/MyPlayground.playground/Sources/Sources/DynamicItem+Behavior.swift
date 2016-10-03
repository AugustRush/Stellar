//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

enum PhysicalDirection {
    case Left
    case Right
    case Up
    case Down
    case Angle(CGFloat)
    case Vector(CGFloat,CGFloat)
    
    func angle() -> CGFloat {
        switch self {
        case .Angle(let a):
            return a
        case .Vector(let x, let y):
            return atan2(y, x)
        case .Left:
            return atan2(0, -1)
        case .Right:
            return atan2(0, 1)
        case .Up: 
            return atan2(-1, 0)
        case .Down: 
            return atan2(1, 0)
        }
    }
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
        let collision = UICollisionBehavior()
        collision.collisionMode = mode
        collision.addItem(self)
        return collision
    }
    
    func collisionBehavior(mode: UICollisionBehaviorMode = .Boundaries, path: UIBezierPath) -> UICollisionBehavior {
        let collision = UICollisionBehavior()
        collision.collisionMode = mode
        let identifier = String(unsafeAddressOf(self))
        collision.addBoundaryWithIdentifier(identifier, forPath: path)
        collision.addItem(self)
        return collision
    }
    
    func collisionBehavior(mode: UICollisionBehaviorMode = .Boundaries, fromPoint: CGPoint, toPoint: CGPoint) -> UICollisionBehavior {
        let collision = UICollisionBehavior()
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
}
