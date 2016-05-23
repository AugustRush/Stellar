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

/// A set of preset bezier curves.
public enum TimingFunctionType {
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
    case SwiftOut
    /// custom
    case Custom(Double, Double, Double, Double)
    
    
    func timingFunction() -> TimingFunction {
        switch self {
        case .Default:
            return UnitBezier(p1x: 0.25, p1y: 0.1, p2x: 0.25, p2y: 1.0)
        case .EaseIn:
            return UnitBezier(p1x: 0.42, p1y: 0.0, p2x: 1.0, p2y: 1.0)
        case .EaseOut:
            return UnitBezier(p1x: 0.0, p1y: 0.0, p2x: 0.58, p2y: 1.0)
        case .EaseInEaseOut:
            return UnitBezier(p1x: 0.42, p1y: 0.0, p2x: 0.58, p2y: 1.0)
        case .Linear: 
            return UnitBezier(p1x: 0.0, p1y: 0.0, p2x: 1.0, p2y: 1.0)
        case .SwiftOut: 
            return UnitBezier(p1x: 0.4, p1y: 0.0, p2x: 0.2, p2y: 1.0)
        case .Custom(let p1x,let p1y,let p2x,let p2y):
            return UnitBezier(p1x: p1x, p1y: p1y, p2x: p2x, p2y: p2y)
        }
    }
}
