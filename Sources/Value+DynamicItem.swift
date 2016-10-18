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

extension CGRect: DynamicItem {
    
    public func snapshot(to: CGRect, progress: Double) -> CGRect {
        let distanceX = to.origin.x - self.origin.x
        let distanceY = to.origin.y - self.origin.y
        let distanceW = to.size.width - self.size.width
        let distanceH = to.size.height - self.size.height
        let incrementalX = distanceX * CGFloat(progress)
        let incrementalY = distanceY * CGFloat(progress)
        let incrementalW = distanceW * CGFloat(progress)
        let incrementalH = distanceH * CGFloat(progress)
        return CGRect(x: self.origin.x + incrementalX, y: self.origin.y + incrementalY, width: self.size.width + incrementalW, height: self.size.height + incrementalH)

    }
    
    // (/255.0)
    internal func color() -> UIColor {
        return UIColor(hue: self.origin.x / 255.0, saturation: self.origin.y / 255.0, brightness: self.size.width / 255.0, alpha: self.size.height / 255.0)
    }
}

extension UIColor: DynamicItem {
    
    public func snapshot(to: UIColor, progress: Double) -> Self {
        let fromR = self.rect()
        let toR = to.rect()
        let currentR = fromR.snapshot(to: toR, progress: progress)
        return convertT(hue: currentR.origin.x / 255.0, saturation: currentR.origin.y / 255.0, brightness: currentR.size.width / 255.0, alpha: currentR.height / 255.0)
    }
    
    private func convertT<T>(hue: CGFloat,saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> T {
        let color = UIColor(hue: hue,saturation: saturation,brightness: brightness,alpha: alpha)
        return unsafeBitCast(color, to: T.self)
    }
    // (*255.0)
    internal func rect() -> CGRect {
        var hue: CGFloat = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        return CGRect(x: hue * 255.0, y: saturation * 255.0, width: brightness * 255.0, height: alpha * 255.0)
    }
}
