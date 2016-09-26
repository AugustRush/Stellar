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

extension CGSize: DynamicItem {

    public func snapshot(to: CGSize, progress: Double) -> CGSize {
        let distanceW = to.width - self.width
        let distanceH = to.height - self.height
        let incrementalW = distanceW * CGFloat(progress)
        let incrementalH = distanceH * CGFloat(progress)
        return CGSize(width: self.width + incrementalW, height: self.height + incrementalH)
    }
}

extension CGPoint: DynamicItem {
    
    public func snapshot(to: CGPoint, progress: Double) -> CGPoint {
        let distanceX = to.x - self.x
        let distanceY = to.y - self.y
        let incrementalX = distanceX * CGFloat(progress)
        let incrementalY = distanceY * CGFloat(progress)
        return CGPoint(x: self.x + incrementalX, y: self.y + incrementalY)
    }
}
