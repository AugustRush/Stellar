//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

internal class AnimatorCoordinator: NSObject, UIDynamicAnimatorDelegate {
    static let shared = AnimatorCoordinator()
    private var activedAnimators: [UIDynamicAnimator] = Array()
    private var basicAnimator = UIDynamicAnimator()
    
    //MARK: public methods    
    func addBasicBehavior(b: UIDynamicBehavior) {
        basicAnimator.addBehavior(b)
    }
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
        let index = activedAnimators.indexOf(animator)
        activedAnimators.removeAtIndex(index!)
    }
    
    func dynamicAnimatorWillResume(animator: UIDynamicAnimator) {
        //
    }
}
