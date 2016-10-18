//
//  View+Animation.swift
//  AnimationF
//
//  Created by AugustRush on 10/12/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

private var st_currentAnimationContext = 0.0
private let st_animationContext = 2468.1
private let st_animationContextKey = "st_animationContextKey"

extension View {

    //MARK: Public mehtods
    open class func st_animate(withDuration duration: TimeInterval, delay: TimeInterval, autoreverses: Bool = false, repeatCount : UInt = 0, type: TimingFunctionType = .Default, animations: () -> Swift.Void, completion: (() -> Swift.Void)? = nil) {
        CATransaction.lock()
        CATransaction.begin()
        CATransaction.setDisableActions(false)
        st_currentAnimationContext = st_animationContext
        let context = BlockAnimationContext()
        //store for current transaction
        CATransaction.setValue(context, forKey: st_animationContextKey)
        //get animation info
        animations()
        // reset animation context flag
        st_currentAnimationContext = 0.0
        addBasicAnimation(context: context, type: type, duration: duration, delay: delay ,repeatCount: repeatCount, autoreverses: autoreverses, completion: completion)
        CATransaction.commit()
        CATransaction.unlock()
    }
    
    open class func st_animate(withDuration duration: TimeInterval, animations: () -> Swift.Void, completion: (() -> Swift.Void)? = nil) {
        st_animate(withDuration: duration, delay: 0.0, type: .Default, animations: animations, completion: completion)
    }
    
    open class func st_animate(withDuration duration: TimeInterval, animations: () -> Swift.Void) {
        st_animate(withDuration: duration, delay: 0.0, animations: animations)
    }
    
    open class func st_spring(withDelay delay: Double = 0.0, damping: Double = 8.0, stiffness: Double = 100.0, mass: Double = 1.0, initialVelocity: Double = 0.0, animations: () -> Swift.Void, completion: (() -> Swift.Void)?) {
        CATransaction.lock()
        CATransaction.begin()
        CATransaction.setDisableActions(false)
        st_currentAnimationContext = st_animationContext
        let context = BlockAnimationContext()
        //store for current transaction
        CATransaction.setValue(context, forKey: st_animationContextKey)
        //get animation info
        animations()
        // reset animation context flag
        st_currentAnimationContext = 0.0
        addSpringAnimation(context: context,delay: delay,damping: damping, stiffness: stiffness, mass: mass, initialVelocity: initialVelocity, completion: completion)
        CATransaction.commit()
        CATransaction.unlock()
    }
    
    open class func st_spring(withDamping damping: Double, stiffness: Double, mass: Double, initialVelocity: Double, animations: () -> Swift.Void, completion: (() -> Swift.Void)? = nil) {
        st_spring(withDelay: 0.0, damping: damping, stiffness: stiffness, mass: mass, initialVelocity: initialVelocity, animations: animations, completion: completion)
    }
}

//// hook View actionForLayer:forKey

let stTransformScaleX = "transform.scale.x"
let stTransformScaleY = "transform.scale.y"
let stTransformRotationX = "transform.rotation.x"
let stTransformRotationY = "transform.rotation.y"
let stTransformRotationZ = "transform.rotation.z"
internal let stTransformRotationXValueStoreKey = "st.transform.rotation.x"
internal let stTransformRotationYValueStoreKey = "st.transform.rotation.x"
internal let stTransformRotationZValueStoreKey = "transform.rotation.z"

private let keysAndAnimations: [String:LayerAnimatableEvent] =
    ["position":.position,
     "bounds":.bounds,
     "backgroundColor":.backgroundColor,
     "cornerRadius":.cornerRadius,
     "zPosition":.zPosition,
     "anchorPoint":.anchorPoint,
     "frame":.frame,
     "contentsRect":.contentsRect,
     "contentsScale":.contentsScale,
     "contentsCenter":.contentsCenter,
     "borderWidth":.borderWidth,
     "borderColor":.borderColor,
     "opacity":.opacity,
     "shadowColor":.shadowColor,
     "rasterizationScale":.rasterizationScale,
     "shadowOpacity":.shadowOpacity,
     "shadowOffset":.shadowOffset,
     "shadowRadius":.shadowRadius,
     stTransformScaleX:.transformScaleX,
     stTransformScaleY:.transformScaleY,
     stTransformRotationX:.transformRotationX,
     stTransformRotationY:.transformRotationY,
     stTransformRotationZ:.transformRotationZ]

enum LayerAnimatableEvent {
    case position
    case bounds
    case backgroundColor
    case cornerRadius
    case zPosition
    case anchorPoint
    case transformScaleX
    case transformScaleY
    case transformRotationX
    case transformRotationY
    case transformRotationZ
    case frame
    case contentsRect
    case contentsScale
    case contentsCenter
    case borderWidth
    case borderColor
    case opacity
    case rasterizationScale
    case shadowColor
    case shadowOpacity
    case shadowOffset
    case shadowRadius
    
    func event(key: String) -> LayerAnimatableEvent? {
        return keysAndAnimations[key]
    }
}

extension View {
    
    static let SWIZZLE: () = {
        let cls = UIView.self
        
        let originalSel = #selector(cls.action(for:forKey:))
        let swizzleSel = #selector(cls.st_action(forLayer:forKey:))
        
        let originalMethod = class_getInstanceMethod(cls, originalSel)
        let swizzledMethod = class_getInstanceMethod(cls, swizzleSel)
        
        let didAddMethod = class_addMethod(cls, originalSel, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        
        if didAddMethod {
            class_replaceMethod(cls, swizzleSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }()
    
    open override class func initialize() {
        SWIZZLE
    }
    
    public func st_action(forLayer layer: CALayer, forKey event: String) -> CAAction? {
        print("event is \(event)")
        if st_animationContext == st_currentAnimationContext && keysAndAnimations[event] != nil {
            let storedContext = CATransaction.value(forKey: st_animationContextKey) as? BlockAnimationContext
            if let context = storedContext {
                let info = BlockAnimationInfo()
                info.event = keysAndAnimations[event]
                info.layer = layer
                info.eventName = event
                info.from = layer.value(forKeyPath: event)
                context.animationInfos.append(info)
            }
            return NSNull();//no implicit animation
        }
        return nil
    }
}

//// Animation context
internal class BlockAnimationContext {
    var animationInfos: [BlockAnimationInfo] = Array()
}

internal class BlockAnimationInfo {
    weak var layer: CALayer!
    var event: LayerAnimatableEvent!
    var eventName: String!
    var from: Any!
    
}
