//
//  UIView+Stellar.swift
//  StellarDemo
//
//  Created by AugustRush on 5/26/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

public extension UIView {
    
    //MARK: animation methods
    func moveX(increment: CGFloat) -> UIView {
        let type = ViewAnimationType.Basic(.MoveX(increment))
        context.addAnimationType(type)
        return self
    }
    
    func moveY(increment: CGFloat) -> UIView {
        let type = ViewAnimationType.Basic(.MoveY(increment))
        context.addAnimationType(type)
        return self
    }
    
    func moveTo(point: CGPoint) -> UIView {
        let type = ViewAnimationType.Basic(.MoveTo(point))
        context.addAnimationType(type)
        return self
    }
    
    func makeColor(color: UIColor) -> UIView {
        let type = ViewAnimationType.Basic(.Color(color))
        context.addAnimationType(type)
        return self
    }
    
    func makeAlpha(alpha: CGFloat) -> UIView {
        let type = ViewAnimationType.Basic(.Alpha(alpha))
        context.addAnimationType(type)
        return self
    }
    
    func rotate(z: CGFloat) -> UIView {
        let type = ViewAnimationType.Basic(.Rotate(z))
        context.addAnimationType(type)
        return self
    }
    
    func rotateX(x: CGFloat) -> UIView {
        let type = ViewAnimationType.Basic(.RotateX(x))
        context.addAnimationType(type)
        return self
    }
    
    func rotateY(y: CGFloat) -> UIView {
        let type = ViewAnimationType.Basic(.RotateY(y))
        context.addAnimationType(type)
        return self
    }
    
    func rotateXY(xy: CGFloat) -> UIView {
        let type = ViewAnimationType.Basic(.RotateXY(xy))
        context.addAnimationType(type)
        return self
    }
    
    func makeWidth(width: CGFloat) -> UIView {
        let type = ViewAnimationType.Basic(.Width(width))
        context.addAnimationType(type)
        return self
    }
    
    func makeHeight(height: CGFloat) -> UIView {
        let type = ViewAnimationType.Basic(.Height(height))
        context.addAnimationType(type)
        return self
    }
    
    func makeSize(size: CGSize) -> UIView {
        let type = ViewAnimationType.Basic(.Size(size))
        context.addAnimationType(type)
        return self
    }
    
    func makeFrame(frame: CGRect) -> UIView {
        let type = ViewAnimationType.Basic(.Frame(frame))
        context.addAnimationType(type)
        return self
    }
    
    func makeBounds(bounds: CGRect) -> UIView {
        let type = ViewAnimationType.Basic(.Bounds(bounds))
        context.addAnimationType(type)
        return self
    }
    
    func scaleX(x: CGFloat) -> UIView {
        let type = ViewAnimationType.Basic(.ScaleX(x))
        context.addAnimationType(type)
        return self
    }
    
    func scaleY(y: CGFloat) -> UIView {
        let type = ViewAnimationType.Basic(.ScaleY(y))
        context.addAnimationType(type)
        return self
    }
    
    func scaleXY(x: CGFloat, _ y: CGFloat) -> UIView {
        let type = ViewAnimationType.Basic(.ScaleXY(x,y))
        context.addAnimationType(type)
        return self
    }
        
    func cornerRadius(radius: CGFloat) -> UIView {
        let type = ViewAnimationType.Basic(.CornerRadius(radius))
        context.addAnimationType(type)
        return self
    }
    
    func borderWidth(width: CGFloat) -> UIView {
        let type = ViewAnimationType.Basic(.BorderWidth(width))
        context.addAnimationType(type)
        return self
    }
    
    func shadowRadius(radius: CGFloat) -> UIView {
        let type = ViewAnimationType.Basic(.ShadowRadius(radius))
        context.addAnimationType(type)
        return self
    }
    
    func zPosition(position: CGFloat) -> UIView {
        let type = ViewAnimationType.Basic(.ZPosition(position))
        context.addAnimationType(type)
        return self
    }
    
    func anchorPoint(point: CGPoint) -> UIView {
        let type = ViewAnimationType.Basic(.AnchorPoint(point))
        context.addAnimationType(type)
        return self
    }
    
    func anchorPointZ(z: CGFloat) -> UIView {
        let type = ViewAnimationType.Basic(.AnchorPointZ(z))
        context.addAnimationType(type)
        return self
    }
    
    func shadowOffset(offset: CGSize) -> UIView {
        let type = ViewAnimationType.Basic(.ShadowOffset(offset))
        context.addAnimationType(type)
        return self
    }
    
    func shadowColor(color: UIColor) -> UIView {
        let type = ViewAnimationType.Basic(.ShadowColor(color))
        context.addAnimationType(type)
        return self
    }
    
    //MARK: Animation configurations
    func duration(d: CFTimeInterval) -> UIView {
        context.changeDuration(d)
        return self
    }
    
    func easing(type: TimingFunctionType) -> UIView {
        context.changeEasing(type)
        return self
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
    
    //commit to excute
    func animate() -> Void {
        context.commit()
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
