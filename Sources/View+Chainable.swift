//
//  View+Chainable.swift
//  StellarDemo
//
//  Created by AugustRush on 9/26/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

typealias View = UIView

extension View: BasicChainable {
    
    func moveX(_ increment: CGFloat) -> Self {
        addAnimationStep(type: .MoveX, change: increment)
        return self
    }
    
    func moveY(_ increment: CGFloat) -> Self {
        addAnimationStep(type: .MoveY, change: increment)
        return self
    }
    
    func then() -> Self {
        let context = animationContext()
        context.addStep()
        return self
    }
    
    func animate() {
        let context = animationContext()
        context.commitAll()
    }
    
    //MARK: Private methods
    
    func addAnimationStep(type: UIAnimationType, change: Any) -> Void {
        let context = animationContext()
        var descriptor = AnimationDescriptor()
        descriptor.type = type
        descriptor.change = change
        context.addDescriptor(descriptor)
    }
    
    private func animationContext() -> AnimationContext {
        var context = objc_getAssociatedObject(self, #function) as? AnimationContext
        if context == nil {
            context = AnimationContext()
            objc_setAssociatedObject(self, #function, context, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        return context!
    }
}
