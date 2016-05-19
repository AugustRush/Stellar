//
//  UIView+Dynamic.swift
//  StellarDemo
//
//  Created by AugustRush on 5/19/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

enum GravityDirection {
    case Left
    case Right
    case Up
    case Down
    case Angle(CGFloat)
}

let CGFLOATMAX: CGFloat = 1000000

extension UIDynamicItem {
    
    func fall(direction: GravityDirection = .Down) -> Void {
        let gravity = UIGravityBehavior()
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
        gravity.addItem(self)
        //commit
        gravity.commit()
    }
    
    func fall(toPoint: CGPoint) -> Void {
        self.center.fallTo(toPoint) { (p) in
            self.center = p
        }
    }
}
