//
//  TimingFunction.swift
//  StellarDemo
//
//  Created by AugustRush on 5/22/16.
//  Copyright © 2016 August. All rights reserved.
//

import Foundation
import CoreGraphics

typealias TimingFunction = UnitBezier

let TimingFunctionDefault = UnitBezier(preset: .Default)
let TimingFunctionLinear = UnitBezier(preset: .Linear)
let TimingFunctionEaseIn = UnitBezier(preset: .EaseIn)
let TimingFunctionEaseOut = UnitBezier(preset: .EaseOut)
let TimingFunctionEaseInOut = UnitBezier(preset: .EaseInEaseOut)
let TimingFunctionMaterial = UnitBezier(preset: .Material)

public extension UnitBezier {
    
    /// A set of preset bezier curves.
    public enum Preset {
        /// Equivalent to `kCAMediaTimingFunctionDefault`.
        case Default
        
        /// Equivalent to `kCAMediaTimingFunctionEaseIn`.
        case EaseIn
        
        /// Equivalent to `kCAMediaTimingFunctionEaseOut`.
        case EaseOut
        
        /// Equivalent to `kCAMediaTimingFunctionEaseInEaseOut`.
        case EaseInEaseOut
        
        /// No easing.
        case Linear
        
        /// Inspired by the default curve in Google Material Design.
        case Material
    }
    
    /// Initializes a UnitBezier with a preset.
    public init(preset: Preset) {
        switch preset {
        case .Default:
            self = UnitBezier(p1x: 0.25, p1y: 0.1, p2x: 0.25, p2y: 1.0)
        case .EaseIn:
            self =  UnitBezier(p1x: 0.42, p1y: 0.0, p2x: 1.0, p2y: 1.0)
        case .EaseOut:
            self =  UnitBezier(p1x: 0.0, p1y: 0.0, p2x: 0.58, p2y: 1.0)
        case .EaseInEaseOut:
            self =  UnitBezier(p1x: 0.42, p1y: 0.0, p2x: 0.58, p2y: 1.0)
        case .Linear:
            self =  UnitBezier(p1x: 0.0, p1y: 0.0, p2x: 1.0, p2y: 1.0)
        case .Material:
            self =  UnitBezier(p1x: 0.4, p1y: 0.0, p2x: 0.2, p2y: 1.0)
        }
    }
}
