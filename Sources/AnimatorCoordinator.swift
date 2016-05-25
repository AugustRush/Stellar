//
//  Animator.swift
//  StellarDemo
//
//  Created by AugustRush on 5/17/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class AnimatorCoordinator: NSObject, UIDynamicAnimatorDelegate {
    static let shared = AnimatorCoordinator()
    private var activedAnimators: [UIDynamicAnimator] = Array()
    
    //MARK: public methods    
    func addBehavior(b: UIDynamicBehavior) {
        addBehaviors([b])
    }
    
    func addBehaviors(behaviors: [UIDynamicBehavior]) {
        
        let animator = activedAnimators.last
        for b in behaviors {
            
            if let exsist = animator {
                switch b {
                case b as UIGravityBehavior:
                    fallthrough
                case b as UICollisionBehavior:
                    createAnimator(b)
                default:
                    exsist.addBehavior(b)
                }
   
            } else {
                createAnimator(b)
            }
        }
    }
    
    private func createAnimator(behavior: UIDynamicBehavior) {
        let animator = UIDynamicAnimator()
        animator.delegate = self
        animator.addBehavior(behavior)
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
