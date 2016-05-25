//
//  CollisionBehavior.swift
//  StellarDemo
//
//  Created by AugustRush on 5/24/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class CollisionBehavior: UICollisionBehavior, UICollisionBehaviorDelegate {
    
    override init(items: [UIDynamicItem]) {
        super.init(items: items)
        self.collisionDelegate = self
    }

    //MARK: UICollisionBehaviorDelegate methods
    
    func collisionBehavior(behavior: UICollisionBehavior, endedContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem) {
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem, atPoint p: CGPoint) {
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint) {

    }
    
    func collisionBehavior(behavior: UICollisionBehavior, endedContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?) {

    }
}
