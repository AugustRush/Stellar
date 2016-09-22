//
//  Value+DynamicItem.swift
//  StellarDemo
//
//  Created by AugustRush on 9/20/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

extension Double: DynamicItem {
    
    public func snapshot(to: Double, progress: Double) -> Double {
        let distance = to - self
        let incremental = distance * progress
        return self + incremental
    }
}

extension Float: DynamicItem {
    
    public func snapshot(to: Float, progress: Double) -> Float {
        let distance = to - self
        let incremental = distance * Float(progress)
        return self + incremental
    }
}

extension CGFloat: DynamicItem {
    
    public func snapshot(to: CGFloat, progress: Double) -> CGFloat {
        let distance = to - self
        let incremental = distance * CGFloat(progress)
        return self + incremental
    }
}
