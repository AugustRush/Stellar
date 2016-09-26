//
//  AnimationStep.swift
//  StellarDemo
//
//  Created by AugustRush on 9/26/16.
//  Copyright © 2016 August. All rights reserved.
//

import Foundation

enum UIAnimationType {
    case MoveX
    case MoveY
}

struct AnimationDescriptor {
    var type: UIAnimationType!
    var change: Any!
}

class AnimationContext {
    typealias AnimationStep = Array<AnimationDescriptor>
    //
    private var steps: [AnimationStep] = Array()
    
    //MARK: Public methods
    func addDescriptor(_ step: AnimationDescriptor) -> Void {
        var group = lastStep()
        group.append(step)
    }
    
    func addStep() -> Void {
        let group = AnimationStep()
        steps.append(group)
    }
    
    func commitAll() -> Void {
        
    }
    
    //MARK: Private methods
    private func lastStep() -> AnimationStep {
        var step = steps.last
        if step == nil {
            step = Array()
            steps.append(step!)
        }
        return step!
    }
    
}
