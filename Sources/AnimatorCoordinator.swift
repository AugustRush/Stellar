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
        let animator = UIDynamicAnimator()
        animator.delegate = self
        for b in behaviors {
            animator.addBehavior(b)
        }
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
