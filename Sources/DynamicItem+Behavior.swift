//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

enum PhysicalDirection {
    case left
    case right
    case up
    case down
    case Angle(CGFloat)
    case vector(CGFloat,CGFloat)
    
    func angle() -> CGFloat {
        switch self {
        case .Angle(let a):
            return a
        case .vector(let x, let y):
            return atan2(y, x)
        case .left:
            return atan2(0, -1)
        case .right:
            return atan2(0, 1)
        case .up: 
            return atan2(-1, 0)
        case .down: 
            return atan2(1, 0)
        }
    }
}

extension UIDynamicItem {
    
    //gravity
    func gravityBehavior(_ magnitude: CGFloat = 1.0, direction: PhysicalDirection = .down) -> UIGravityBehavior {
        let gravity = UIGravityBehavior()
        switch direction {
        case .Angle(let a):
            gravity.setAngle(a, magnitude: magnitude)
        case .left:
            gravity.gravityDirection = CGVector(dx: -1, dy: 0)
        case .right:
            gravity.gravityDirection = CGVector(dx: 1, dy: 0)
        case .up:
            gravity.gravityDirection = CGVector(dx: 0, dy: -1)
        case .down:
            gravity.gravityDirection = CGVector(dx: 0, dy: 1)
        case .vector(let x, let y):
            gravity.gravityDirection = CGVector(dx: x, dy: y)
        }
        gravity.magnitude = magnitude
        gravity.addItem(self)
        return gravity
    }

    //snap
    func snapBehavior(_ toPoint: CGPoint, damping: CGFloat = 0.5) -> UISnapBehavior {
        let snap = UISnapBehavior(item: self,snapTo: toPoint)
        snap.damping = damping
        return snap
    }
    
    //attachment
    func attachmentBehavior(_ toAnchor: CGPoint, length: CGFloat = 0.0, damping: CGFloat = 0.5, frequency: CGFloat = 1.0) -> UIAttachmentBehavior {
        let attachment = UIAttachmentBehavior(item: self,attachedToAnchor: toAnchor)
        attachment.length = length
        attachment.damping = damping
        attachment.frequency = frequency
        return attachment
    }
    
    func attachmentBehavior(_ toItem: UIDynamicItem, damping: CGFloat = 0.5, frequency: CGFloat = 1.0) -> UIAttachmentBehavior {
        let attachment = UIAttachmentBehavior(item: self,attachedTo: toItem)
        attachment.damping = damping
        attachment.frequency = frequency
        return attachment
    }
    
    func attachmentBehavior(_ toItem: UIDynamicItem, damping: CGFloat = 0.5, frequency: CGFloat = 1.0, length: CGFloat = 0.0) -> UIAttachmentBehavior {
        let attachment = UIAttachmentBehavior(item: self,attachedTo: toItem)
        attachment.damping = damping
        attachment.length = length
        attachment.frequency = frequency
        return attachment
    }
    
    //push
    func pushBehavior(_ direction: CGVector, mode:UIPushBehavior.Mode = .instantaneous, magnitude: CGFloat = 1.0) -> UIPushBehavior {
        let push = UIPushBehavior(items: [self], mode: mode)
        push.pushDirection = direction
        push.magnitude = magnitude
        return push
    }
    
    func pushBehavior(_ direction: PhysicalDirection, mode:UIPushBehavior.Mode = .continuous, magnitude: CGFloat = 1.0) -> UIPushBehavior {
        let push = UIPushBehavior(items: [self], mode: mode)
        switch direction {
        case .Angle(let a):
            push.setAngle(a, magnitude: magnitude)
        case .left:
            push.pushDirection = CGVector(dx: -1, dy: 0)
        case .right:
            push.pushDirection = CGVector(dx: 1, dy: 0)
        case .up:
            push.pushDirection = CGVector(dx: 0, dy: -1)
        case .down:
            push.pushDirection = CGVector(dx: 0, dy: 1)
        case .vector(let x, let y):
            push.pushDirection = CGVector(dx: x, dy: y)
        }
        
        push.magnitude = magnitude
        return push
    }

    
    func pushBehavior(_ angle: CGFloat, mode:UIPushBehavior.Mode = .instantaneous, magnitude: CGFloat = 1.0) -> UIPushBehavior {
        let push = UIPushBehavior(items: [self], mode: mode)
        push.angle = angle
        push.magnitude = magnitude
        return push
    }
    
    //collision
    func collisionBehavior(_ mode: UICollisionBehavior.Mode = .boundaries) -> UICollisionBehavior {
        let collision = UICollisionBehavior()
        collision.collisionMode = mode
        collision.addItem(self)
        return collision
    }
    
    func collisionBehavior(_ mode: UICollisionBehavior.Mode = .boundaries, path: UIBezierPath) -> UICollisionBehavior {
        let collision = UICollisionBehavior()
        collision.collisionMode = mode
        let identifier = String(describing: Unmanaged.passUnretained(self).toOpaque())
        collision.addBoundary(withIdentifier: identifier as NSCopying, for: path)
        collision.addItem(self)
        return collision
    }
    
    func collisionBehavior(_ mode: UICollisionBehavior.Mode = .boundaries, fromPoint: CGPoint, toPoint: CGPoint) -> UICollisionBehavior {
        let collision = UICollisionBehavior()
        collision.collisionMode = mode
        let identifier = String(describing: Unmanaged.passUnretained(self).toOpaque())
        collision.addBoundary(withIdentifier: identifier as NSCopying, from: fromPoint, to: toPoint)
        collision.addItem(self)
        return collision
    }
    
    //itemBehavior
    func itemBehavior(_ elasticity: CGFloat = 0.5, friction: CGFloat = 0.5, density: CGFloat = 1, resistance: CGFloat = 0, angularResistance: CGFloat = 0, allowsRotation: Bool = true) -> UIDynamicItemBehavior {
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
