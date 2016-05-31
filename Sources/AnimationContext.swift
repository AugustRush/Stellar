//
//  AnimationContext.swift
//  StellarDemo
//
//  Created by AugustRush on 5/26/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

enum ViewAnimationSubType {
    case MoveX(CGFloat)
    case MoveY(CGFloat)
    case MoveTo(CGPoint)
    case Color(UIColor)
    case Alpha(CGFloat)
    case RotateX(CGFloat)
    case RotateY(CGFloat)
    case Rotate(CGFloat)
    case RotateXY(CGFloat)
    case Width(CGFloat)
    case Height(CGFloat)
    case Size(CGSize)
    case Frame(CGRect)
    case Bounds(CGRect)
    case ScaleX(CGFloat)
    case ScaleY(CGFloat)
    case ScaleXY(CGFloat,CGFloat)
    case CornerRadius(CGFloat)
    case BorderWidth(CGFloat)
    case ShadowRadius(CGFloat)
    case ZPosition(CGFloat)
    case AnchorPoint(CGPoint)
    case AnchorPointZ(CGFloat)
    case ShadowOffset(CGSize)
    case ShadowColor(UIColor)
    case ShadowOpacity(Float)
    case TintColor(UIColor)
    //UILabel,UITextView...
    case TextColor(UIColor)
}

internal class AnimationContext: NSObject, UIDynamicAnimatorDelegate, AnimationSequenceDelegate {
    private weak var view: UIView!
    private var mutipleSequences = [AnimationSequence]()
    
    //MARK: init method
    init(view: UIView) {
        self.view = view
    }
    
    //MARK: public methods
    func addAnimationType(type: AnimationType) {
        let step = lastStep()
        step.types.append(type)
    }
    
    func changeDuration(d: CFTimeInterval) {
        let step = lastStep()
        step.duration = d
    }
    
    func changeDelay(d: CFTimeInterval) {
        let step = lastStep()
        step.delay = d
    }
    
    func changeAutoreverses(a: Bool) {
        let step = lastStep()
        step.autoreverses = a
    }
    
    func changeRepeatCount(count: Int) {
        let step = lastStep()
        step.repeatCount = count
    }
    
    func changeCompletion(c: () -> Void) {
        let step = lastStep()
        step.completion = c
    }
    
    func changeEasing(e: TimingFunctionType) {
        let step = lastStep()
        step.easing = e
    }
    
    func changeMainType(type: ViewAnimationType) {
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
    
    func makeNextSequence() -> AnimationSequence {
        let sequence = AnimationSequence(view: self.view)
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
    
    
    //MARK: private methods
    
    private func lastSequence() -> AnimationSequence {
        var sequence = mutipleSequences.last
        if sequence == nil {
            sequence = makeNextSequence()
        }

        return sequence!
    }
    
    private func lastStep() -> AnimationStep {
        let sequence = lastSequence()
        var step = sequence.last()
        if step == nil {
            step = AnimationStep()
            sequence.addStep(step!)
        }
        return step!
    }
    
    //MARK: AnimationSequenceDelegate methods
    
    func animationSequenceDidComplete(sequence: AnimationSequence) {
        let index = mutipleSequences.indexOf(sequence)
        if index != nil {
            mutipleSequences.removeAtIndex(index!)
        }
    }
}

