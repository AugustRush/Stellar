//
//  UIView+Stellar.swift
//  StellarDemo
//
//  Created by AugustRush on 5/26/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

public extension UIView {
    
    func moveX(increment: CGFloat) -> UIView {
        let type = ViewAnimationType.Basic(.MoveX(increment))
        context.addAnimationType(type)
        return self
    }
    
    func moveY(increment: CGFloat) -> UIView {
        let type: ViewAnimationType = .Basic(.MoveY(increment))
        context.addAnimationType(type)
        return self
    }
    
    //MARK: Animation configurations
    
    func duration(d: CFTimeInterval = 0.25) -> UIView {
        context.changeDuration(d)
        return self
    }
    
    func animate() -> Void {
        context.commit()
    }
    
    func completion(c: () -> Void) -> UIView {
        context.changeCompletion(c)
        return self
    }
    
    func delay(d: CFTimeInterval) -> UIView {
        context.changeDelay(d)
        return self
    }
    
    func autoreverses(a: Bool) -> UIView {
        context.changeAutoreverses(a)
        return self
    }
    
    //MARK: Chainable methods
    
    func then() -> UIView {
        context.makeNextStep()
        return self
    }
    
    //Private Context
    private var context: AnimationContext {
        get {
            var context = objc_getAssociatedObject(self, &AnimationContextIdentifer) as? AnimationContext
            if context == nil {
                context = AnimationContext(view: self)
                objc_setAssociatedObject(self, &AnimationContextIdentifer, context!, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            return context!
        }
    }
}

private var AnimationContextIdentifer = "#"
