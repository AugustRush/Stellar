//
//  Animator.swift
//  StellarDemo
//
//  Created by AugustRush on 5/17/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

public enum BehaviorType {
    case Gravity
    case Snap
    case Attachment
    case Push
    case collision
}

class Animator: NSObject, UIDynamicAnimatorDelegate {
    static let shared = Animator()
    private var activedAnimators: [UIDynamicAnimator] = Array()
    
    //MARK: public methods    
    func addBehavior(b: UIDynamicBehavior) {
        let animator = UIDynamicAnimator()
        animator.delegate = self
        animator.addBehavior(b)
        activedAnimators.append(animator)
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
