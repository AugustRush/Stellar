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

struct AnimationStep {
    var type: UIAnimationType!
    var change: Any!
}

class AnimationContext {
    typealias AnimationGroup = Array<AnimationStep>
    //
    private var steps: [AnimationGroup] = Array()
    
    //MARK: Public methods
    func addStep(_ step: AnimationStep) -> Void {
        var group = lastGroup()
        group.append(step)
    }
    
    func addGroup() -> Void {
        let group = AnimationGroup()
        steps.append(group)
    }
    
    func commitAll() -> Void {
        
    }
    
    //MARK: Private methods
    private func lastGroup() -> AnimationGroup {
        var group = steps.last
        if group == nil {
            group = Array()
            steps.append(group!)
        }
        return group!
    }
    
}
