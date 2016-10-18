//
//  CALayer+ConvenientProperties.swift
//  AnimationF
//
//  Created by AugustRush on 10/14/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

public extension CALayer {
    
    func setTransformScaleX(_ f: Float) -> Void {
        self.setValue(NSNumber(value: f), forKeyPath: stTransformScaleX)
    }
    
    func setTransformScaleY(_ f: Float) -> Void {
        self.setValue(NSNumber(value: f), forKeyPath: stTransformScaleY)
    }

    func setTransformRotationX(_ f: Float) -> Void {
        let value = NSNumber(value: f)
        self.setValue(value, forKeyPath: stTransformRotationX)
        self.setValue(value, forKey: stTransformRotationXValueStoreKey)
    }

    func setTransformRotationY(_ f: Float) -> Void {
        let value = NSNumber(value: f)
        self.setValue(value, forKeyPath: stTransformRotationY)
        self.setValue(value, forKey: stTransformRotationYValueStoreKey)
    }

    func setTransformRotationZ(_ f: Float) -> Void {
        let value = NSNumber(value: f)
        self.setValue(value, forKeyPath: stTransformRotationZ)
        self.setValue(value, forKey: stTransformRotationZValueStoreKey)
    }

}
