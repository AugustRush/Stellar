//
//  View+Chainable.swift
//  StellarDemo
//
//  Created by AugustRush on 9/26/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

typealias View = UIView

extension View: UIChainable {
    
    func moveX(_ increment: CGFloat) -> Self {
        addAnimationStep(type: .MoveX(increment))
        return self
    }
    
    func moveY(_ increment: CGFloat) -> Self {
        addAnimationStep(type: .MoveY(increment))
        return self
    }
    
    //MARK: Chainable
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
    
    private func addAnimationStep(type: UIAnimationType) -> Void {
        let context = animationContext()
        let descriptor = AnimationDescriptor(type: type)
        context.addDescriptor(descriptor)
    }
    
    private func animationContext() -> AnimationContext {
        var context = objc_getAssociatedObject(self, #function) as? AnimationContext
        if context == nil {
            context = AnimationContext(view: self)
            objc_setAssociatedObject(self, #function, context, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        return context!
    }
}
