//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

protocol AnimationSequenceDelegate: class {
    func animationSequenceDidComplete(sequence: AnimationSequence);
}

internal class AnimationSequence: NSObject, UIDynamicAnimatorDelegate {
    var steps: [AnimationStep] = Array()
    weak var view: DriveAnimateBehaviors!
    weak var delegate: AnimationSequenceDelegate?
    var isRuning = false
    lazy var animator: UIDynamicAnimator = {
        let animator = UIDynamicAnimator()
        animator.delegate = self
        return animator
    }()
    
    //MARK: init method
    
    init(object: DriveAnimateBehaviors) {
        self.view = object
    }
    
    //MARK: internal method
    func addStep(step: AnimationStep) {
        steps.append(step)
    }
    
    func last() -> AnimationStep? {
        return steps.last
    }
    
    func start() {
        if !isRuning {
            isRuning = true
            excuteFirstStepIfExist()
        }
    }
    
    func removeAllSteps() {
        steps.removeAll()
    }
    
    private func excuteFirstStepIfExist() {
        
        if self.view == nil {
            return
        }
        
        let step = steps.first
        
        if let step = step {
            //if step has no animation types it must be the last temple step
            if step.types.count == 0 {
                steps.removeFirst()
                popFirstStepIfExsist()
                return
            }
            
            for type in step.types {
                let behavior = view.behavior(forType: type, step: step)
                animator.addBehavior(behavior)
            }
            
        } else {
            popFirstStepIfExsist()
        }
    }
    
    private func popFirstStepIfExsist() {
        if !steps.isEmpty {
            let step = steps.first!
            //excute completion
            step.completion?()
            steps.removeFirst()
        } else {
            // all steps has completion
            self.delegate?.animationSequenceDidComplete(self)
        }
    }
    
    //MARK: UIDynamicAnimatorDelegate methods
    func dynamicAnimatorDidPause(animator: UIDynamicAnimator) {
        animator.removeAllBehaviors()
        popFirstStepIfExsist()
        excuteFirstStepIfExist()
    }
    
    func dynamicAnimatorWillResume(animator: UIDynamicAnimator) {
        
    }
}
