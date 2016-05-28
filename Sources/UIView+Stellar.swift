//
//  UIView+Stellar.swift
//  StellarDemo
//
//  Created by AugustRush on 5/26/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

enum ViewAnimationType {
    case Basic
    case Gravity
}

public extension UIView {
    
    //MARK: animation methods
    func moveX(increment: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .MoveX(increment))
        context.addAnimationType(type)
        return self
    }
    
    func moveY(increment: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .MoveY(increment))
        context.addAnimationType(type)
        return self
    }
    
    func moveTo(point: CGPoint) -> UIView {
        let type = AnimationType(type: .Basic, subType: .MoveTo(point))
        context.addAnimationType(type)
        return self
    }
    
    func makeColor(color: UIColor) -> UIView {
        let type = AnimationType(type: .Basic, subType: .Color(color))
        context.addAnimationType(type)
        return self
    }
    
    func makeAlpha(alpha: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .Alpha(alpha))
        context.addAnimationType(type)
        return self
    }
    
    func rotate(z: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .Rotate(z))
        context.addAnimationType(type)
        return self
    }
    
    func rotateX(x: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .RotateX(x))
        context.addAnimationType(type)
        return self
    }
    
    func rotateY(y: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .RotateY(y))
        context.addAnimationType(type)
        return self
    }
    
    func rotateXY(xy: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .RotateXY(xy))
        context.addAnimationType(type)
        return self
    }
    
    func makeWidth(width: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .Width(width))
        context.addAnimationType(type)
        return self
    }
    
    func makeHeight(height: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .Height(height))
        context.addAnimationType(type)
        return self
    }
    
    func makeSize(size: CGSize) -> UIView {
        let type = AnimationType(type: .Basic, subType: .Size(size))
        context.addAnimationType(type)
        return self
    }
    
    func makeFrame(frame: CGRect) -> UIView {
        let type = AnimationType(type: .Basic, subType: .Frame(frame))
        context.addAnimationType(type)
        return self
    }
    
    func makeBounds(bounds: CGRect) -> UIView {
        let type = AnimationType(type: .Basic, subType: .Bounds(bounds))
        context.addAnimationType(type)
        return self
    }
    
    func scaleX(x: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .ScaleX(x))
        context.addAnimationType(type)
        return self
    }
    
    func scaleY(y: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .ScaleY(y))
        context.addAnimationType(type)
        return self
    }
    
    func scaleXY(x: CGFloat, _ y: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .ScaleXY(x,y))
        context.addAnimationType(type)
        return self
    }
        
    func cornerRadius(radius: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .CornerRadius(radius))
        context.addAnimationType(type)
        return self
    }
    
    func borderWidth(width: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .BorderWidth(width))
        context.addAnimationType(type)
        return self
    }
    
    func shadowRadius(radius: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .ShadowRadius(radius))
        context.addAnimationType(type)
        return self
    }
    
    func zPosition(position: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .ZPosition(position))
        context.addAnimationType(type)
        return self
    }
    
    func anchorPoint(point: CGPoint) -> UIView {
        let type = AnimationType(type: .Basic, subType: .AnchorPoint(point))
        context.addAnimationType(type)
        return self
    }
    
    func anchorPointZ(z: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .AnchorPointZ(z))
        context.addAnimationType(type)
        return self
    }
    
    func shadowOffset(offset: CGSize) -> UIView {
        let type = AnimationType(type: .Basic, subType: .ShadowOffset(offset))
        context.addAnimationType(type)
        return self
    }
    
    func shadowColor(color: UIColor) -> UIView {
        let type = AnimationType(type: .Basic, subType: .ShadowColor(color))
        context.addAnimationType(type)
        return self
    }
    
    func shadowOpacity(opacity: Float) -> UIView {
        let type = AnimationType(type: .Basic, subType: .ShadowOpacity(opacity))
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
    
    func autoreverses() -> UIView {
        context.changeAutoreverses(true)
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
