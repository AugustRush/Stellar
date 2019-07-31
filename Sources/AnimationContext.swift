//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

internal class AnimationContext: NSObject, UIDynamicAnimatorDelegate, AnimationSequenceDelegate {
    fileprivate weak var object: DriveAnimateBehaviors!
    fileprivate var mutipleSequences = [AnimationSequence]()
    
    //MARK: init method
    init(object: DriveAnimateBehaviors) {
        self.object = object
    }
    
    //MARK: public methods
    func addAnimationType(_ type: AnimationType) {
        let step = lastStep()
        step.types.append(type)
    }
    
    func changeDuration(_ d: CFTimeInterval) {
        let step = lastStep()
        step.duration = d
    }
    
    func changeDelay(_ d: CFTimeInterval) {
        let step = lastStep()
        step.delay = d
    }
    
    func changeAutoreverses(_ a: Bool) {
        let step = lastStep()
        step.autoreverses = a
    }
    
    func changeRepeatCount(_ count: Int) {
        let step = lastStep()
        step.repeatCount = count
    }
    
    func changeCompletion(_ c: @escaping () -> Void) {
        let step = lastStep()
        step.completion = c
    }
    
    func changeEasing(_ e: TimingFunctionType) {
        let step = lastStep()
        step.timing = e
    }
    
    func changeMainType(_ type: AnimationStyle) {
        let step = lastStep()
        let lastAnimationType = step.types.last
        guard let _ = lastAnimationType else {
            print("You should defined animaton first!")
            return
        }
        
        lastAnimationType!.mainType = type
    }
    
    func makeNextStep() {
        let step = AnimationStep()
        lastSequence().addStep(step)
    }
    
    @discardableResult
    func makeNextSequence() -> AnimationSequence {
        let sequence = AnimationSequence(object: self.object)
        sequence.delegate = self
        mutipleSequences.append(sequence)
        
        return sequence
    }
    
    func commit() {
        //start all sequence
        for sequence in mutipleSequences {
            sequence.start()
        }
        //make a temple sequence for next step
        makeNextSequence()
    }
    
    func removeAllRemaining() {
        for sequence in mutipleSequences {
            sequence.removeAllSteps()
        }
        mutipleSequences.removeAll()
    }
    
    
    //MARK: private methods
    
    fileprivate func lastSequence() -> AnimationSequence {
        var sequence = mutipleSequences.last
        if sequence == nil {
            sequence = makeNextSequence()
        }

        return sequence!
    }
    
    fileprivate func lastStep() -> AnimationStep {
        let sequence = lastSequence()
        var step = sequence.last()
        if step == nil {
            step = AnimationStep()
            sequence.addStep(step!)
        }
        return step!
    }
    
    //MARK: AnimationSequenceDelegate methods
    
    func animationSequenceDidComplete(_ sequence: AnimationSequence) {
        let index = mutipleSequences.firstIndex(of: sequence)
        if index != nil {
            mutipleSequences.remove(at: index!)
        }
    }
}

