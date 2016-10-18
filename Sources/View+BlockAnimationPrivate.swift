//
//  View+BasicPrivate.swift
//  AnimationF
//
//  Created by AugustRush on 10/13/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

internal extension View {
    //MARK: Private methods
    
    class func addBasicAnimation(context: BlockAnimationContext, type: TimingFunctionType, duration: TimeInterval, delay: TimeInterval, repeatCount: UInt, autoreverses: Bool, completion: (() -> Swift.Void)?) {
        
        let transimission = BasicTransmission()
        transimission.timingCurve = type.easing()
        transimission.duration = duration
        transimission.delay = delay
        transimission.autoreverses = autoreverses
        transimission.repeatCount = repeatCount
        
        let group = AnimationGroup()
        group.transmission = transimission
        group.completion = completion
        
        parseAndAddAnimation(withContext: context, toGroup: group, transimission: transimission)
    }
    
    class func addSpringAnimation(context: BlockAnimationContext, delay: Double, damping: Double, stiffness: Double, mass: Double, initialVelocity: Double, completion: (() -> Swift.Void)?) {
        let transimission = SpringTransmission()
        transimission.delay = delay
        transimission.damping = damping
        transimission.stiffness = stiffness
        transimission.mass = mass
        transimission.initialVelocity = initialVelocity
        //group
        let group = AnimationGroup()
        group.transmission = transimission
        group.completion = completion
        
        parseAndAddAnimation(withContext: context, toGroup: group, transimission: transimission)
    }
    
    private class func parseAndAddAnimation(withContext context: BlockAnimationContext, toGroup group: AnimationGroup, transimission: DynamicTransmission) -> Void {
        
        for info in context.animationInfos {
            
            switch info.event! {
            case .position:
                
                let from = (info.from as! NSValue).cgPointValue
                let to = (info.layer.value(forKeyPath: info.eventName) as! NSValue).cgPointValue
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.position = from
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (p) in
                    info.layer.position = p
                })
                group.animations.append(animation)
                
            case .bounds:
                
                let from = (info.from as! NSValue).cgRectValue
                let to = (info.layer.value(forKeyPath: info.eventName) as! NSValue).cgRectValue
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.bounds = from
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (b) in
                    info.layer.bounds = b
                })
                group.animations.append(animation)
                
            case .backgroundColor:
                
                let from = info.from as! CGColor
                let to = info.layer.value(forKeyPath: info.eventName) as! CGColor
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.backgroundColor = from
                
                let animation = constructAnimation(from: UIColor(cgColor: from).rect(), to: UIColor(cgColor: to).rect(), transmission: transimission, render: { (r) in
                    info.layer.backgroundColor = r.color().cgColor
                })
                group.animations.append(animation)
                
            case .cornerRadius:
                
                let from = (info.from as! NSNumber).floatValue
                let to = (info.layer.value(forKeyPath: info.eventName) as! NSNumber).floatValue
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.cornerRadius = CGFloat(from)
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (c) in
                    info.layer.cornerRadius = CGFloat(c)
                })
                group.animations.append(animation)
                
            case .zPosition:
                
                let from = (info.from as! NSNumber).floatValue
                let to = (info.layer.value(forKeyPath: info.eventName) as! NSNumber).floatValue
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.zPosition = CGFloat(from)
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (c) in
                    info.layer.zPosition = CGFloat(c)
                })
                group.animations.append(animation)

            case .anchorPoint:
                
                let from = (info.from as! NSValue).cgPointValue
                let to = (info.layer.value(forKeyPath: info.eventName) as! NSValue).cgPointValue
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.anchorPoint = from
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (p) in
                    info.layer.anchorPoint = p
                })
                group.animations.append(animation)

            case .transformScaleX:
                
                let from = (info.from as! NSNumber).floatValue
                let to = (info.layer.value(forKeyPath: info.eventName) as! NSNumber).floatValue
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.setTransformScaleX(from)
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (c) in
                    info.layer.setTransformScaleX(c)
                })
                group.animations.append(animation)
                
            case .transformScaleY:
                
                let from = (info.from as! NSNumber).floatValue
                let to = (info.layer.value(forKeyPath: info.eventName) as! NSNumber).floatValue
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.setTransformScaleY(from)
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (c) in
                    info.layer.setTransformScaleY(c)
                })
                group.animations.append(animation)

            case .transformRotationX:
                
                let from = (info.from as! NSNumber).floatValue
                let to = (info.layer.value(forKey: stTransformRotationXValueStoreKey) as! NSNumber).floatValue + from
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.setValue(NSNumber(value: from), forKeyPath: stTransformRotationX)
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (c) in
                    info.layer.setValue(NSNumber(value: c), forKeyPath: stTransformRotationX)
                })
                group.animations.append(animation)

            case .transformRotationY:
                
                let from = (info.from as! NSNumber).floatValue
                let to = (info.layer.value(forKey: stTransformRotationYValueStoreKey) as! NSNumber).floatValue + from
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.setValue(NSNumber(value: from), forKeyPath: stTransformRotationY)
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (c) in
                    info.layer.setValue(NSNumber(value: c), forKeyPath: stTransformRotationY)
                })
                group.animations.append(animation)

            case .transformRotationZ:
                
                let from = (info.from as! NSNumber).floatValue
                let to = (info.layer.value(forKey: stTransformRotationZValueStoreKey) as! NSNumber).floatValue + from
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.setValue(NSNumber(value: from), forKeyPath: stTransformRotationZ)
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (c) in
                    info.layer.setValue(NSNumber(value: c), forKeyPath: stTransformRotationZ)
                })
                group.animations.append(animation)
                
            case .frame:
                
                let from = (info.from as! NSValue).cgRectValue
                let to = (info.layer.value(forKeyPath: info.eventName) as! NSValue).cgRectValue
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.frame = from
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (b) in
                    info.layer.frame = b
                })
                group.animations.append(animation)

            case .contentsRect:
                
                let from = (info.from as! NSValue).cgRectValue
                let to = (info.layer.value(forKeyPath: info.eventName) as! NSValue).cgRectValue
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.contentsRect = from
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (b) in
                    info.layer.contentsRect = b
                })
                group.animations.append(animation)

            case .contentsScale:
                
                let from = (info.from as! NSNumber).floatValue
                let to = (info.layer.value(forKeyPath: info.eventName) as! NSNumber).floatValue
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.contentsScale = CGFloat(from)
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (c) in
                    info.layer.contentsScale = CGFloat(c)
                })
                group.animations.append(animation)

            case .contentsCenter:
                
                let from = (info.from as! NSValue).cgRectValue
                let to = (info.layer.value(forKeyPath: info.eventName) as! NSValue).cgRectValue
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.contentsCenter = from
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (b) in
                    info.layer.contentsCenter = b
                })
                group.animations.append(animation)
                
            case .borderWidth:
                
                let from = (info.from as! NSNumber).floatValue
                let to = (info.layer.value(forKeyPath: info.eventName) as! NSNumber).floatValue
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.borderWidth = CGFloat(from)
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (c) in
                    info.layer.borderWidth = CGFloat(c)
                })
                group.animations.append(animation)
                
            case .borderColor:
                
                let from = (info.from != nil) ? (info.from as! CGColor) : UIColor.clear.cgColor
                let to = info.layer.value(forKeyPath: info.eventName) as! CGColor
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.borderColor = from
                
                let animation = constructAnimation(from: UIColor(cgColor: from).rect(), to: UIColor(cgColor: to).rect(), transmission: transimission, render: { (r) in
                    info.layer.borderColor = r.color().cgColor
                })
                group.animations.append(animation)

            case .opacity:
                
                let from = (info.from as! NSNumber).floatValue
                let to = (info.layer.value(forKeyPath: info.eventName) as! NSNumber).floatValue
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.opacity = from
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (c) in
                    info.layer.opacity = c
                })
                group.animations.append(animation)
                
            case .rasterizationScale:
                
                let from = (info.from as! NSNumber).floatValue
                let to = (info.layer.value(forKeyPath: info.eventName) as! NSNumber).floatValue
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.rasterizationScale = CGFloat(from)
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (c) in
                    info.layer.rasterizationScale = CGFloat(c)
                })
                group.animations.append(animation)
                
            case .shadowColor:
                
                let from = (info.from != nil) ? (info.from as! CGColor) : UIColor.clear.cgColor
                let to = info.layer.value(forKeyPath: info.eventName) as! CGColor
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.shadowColor = from
                
                let animation = constructAnimation(from: UIColor(cgColor: from).rect(), to: UIColor(cgColor: to).rect(), transmission: transimission, render: { (r) in
                    info.layer.shadowColor = r.color().cgColor
                })
                group.animations.append(animation)
                
            case .shadowOpacity:
                
                let from = (info.from as! NSNumber).floatValue
                let to = (info.layer.value(forKeyPath: info.eventName) as! NSNumber).floatValue
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.shadowOpacity = from
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (c) in
                    info.layer.shadowOpacity = c
                })
                group.animations.append(animation)

            case .shadowOffset:
                
                let from = (info.from as! NSValue).cgSizeValue
                let to = (info.layer.value(forKeyPath: info.eventName) as! NSValue).cgSizeValue
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.shadowOffset = from
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (c) in
                    info.layer.shadowOffset = c
                })
                group.animations.append(animation)
                
            case .shadowRadius:
                
                let from = (info.from as! NSNumber).floatValue
                let to = (info.layer.value(forKeyPath: info.eventName) as! NSNumber).floatValue
                
                //changed model layer to start value
                let modelLayer = info.layer.model()
                modelLayer.shadowRadius = CGFloat(from)
                
                let animation = constructAnimation(from: from, to: to, transmission: transimission, render: { (c) in
                    info.layer.shadowRadius = CGFloat(c)
                })
                group.animations.append(animation)

            }
            let identifier = String(unsafeBitCast(group, to: Int.self))
            Animator.shared.addAnimation(group, forKey: identifier)
        }
        
    }
    
    private class func constructAnimation<T: DynamicItem>(from: T, to: T, transmission: DynamicTransmission, render: ((T) -> Void)!) -> Animation<T> {
        let animation = Animation<T>()
        animation.from = from
        animation.to = to
        animation.transmission = transmission
        animation.render = render
        
        return animation
    }
}
