//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

extension Float: Physical, Vectorial, Interpolatable {

    
    public func fallTo(_ to: Float,magnitude: Double = 1.0, render: @escaping (Float) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItemGravity(from: self, to: to, render: render)
        let push = item.pushBehavior(.down)
        item.behavior = push
        item.magnitude = magnitude
        item.completion = completion
        push.commitToBasic()
    }
    
    public func snapTo(_ to: Float, damping: CGFloat = 0.5,render: @escaping ((Float) -> Void), completion: (() -> Void)? = nil) {
        let item = DynamicItem<Float>(from: self, to: to, render: render)
        let snap = item.snapBehavior(item.toP, damping: damping)
        item.behavior = snap
        item.completion = completion
        snap.commit()
    }
    
    public func attachmentTo(_ to: Float,damping: CGFloat = 0.5,frequency: CGFloat = 0.5,render: @escaping (Float) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem<Float>(from: self, to: to,render: render)
        let attachment = item.attachmentBehavior(item.toP, length: 0.0, damping: damping, frequency: frequency)
        item.behavior = attachment
        item.completion = completion
        attachment.commit()
    }
    
    public func pushedTo(_ to: Float,render: @escaping (Float) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem<Float>(from: self,to: to,render: render)
        let direction = CGVector(dx: item.toP.x - item.fromP.x, dy: item.toP.y - item.fromP.y)
        let push = item.pushBehavior(direction, mode: .instantaneous, magnitude: 1.0)
        item.behavior = push
        item.boundaryLimit = true
        item.completion = completion
        push.commit()
    }
    
    public func animateTo(_ to: Float, duration: CFTimeInterval = 0.25, delay: CFTimeInterval = 0.0, type: TimingFunctionType = .default, autoreverses: Bool = false, repeatCount: Int = 0, render: @escaping (Float) -> Void, completion: ((Bool) -> Void)? = nil) {
        let basicItem = DynamicItemBasic(from: self, to: to, render: render)
        let push = basicItem.pushBehavior(.down)
        basicItem.behavior = push
        basicItem.duration = duration
        basicItem.timingFunction = type.easing()
        basicItem.completion = completion
        basicItem.delay = delay
        push.commitToBasic()
    }
    //Vetorial
    func convert(_ p: CGPoint) -> Float {
        return Float(p.y)
    }
    
    func reverse() -> CGPoint {
        return CGPoint(x: 0, y: CGFloat(self))
    }
    
    //Interpolatable
    
    func interpolate(_ progress: Double, to: Float, externalData: Any?) -> Float {
        let change = to - self
        return self + change * Float(progress)
    }
}

extension Double: Physical, Vectorial, Interpolatable {
    
    public func fallTo(_ to: Double,magnitude: Double = 1.0,render: @escaping (Double) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItemGravity(from: self, to: to, render: render)
        let push = item.pushBehavior(.down)
        item.behavior = push
        item.magnitude = magnitude
        item.completion = completion
        push.commitToBasic()
    }
    
    public func snapTo(_ to: Double,damping: CGFloat = 0.5,render: @escaping ((Double) -> Void), completion: (() -> Void)? = nil) {
        let item = DynamicItem<Double>(from: self, to: to, render: render)
        let snap = item.snapBehavior(item.toP, damping: damping)
        item.behavior = snap
        item.completion = completion
        snap.commit()
    }
    
    public func attachmentTo(_ to: Double,damping: CGFloat = 0.5,frequency: CGFloat = 0.5,render: @escaping (Double) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem<Double>(from: self, to: to,render: render)
        let attachment = item.attachmentBehavior(item.toP, length: 0.0, damping: damping, frequency: frequency)
        item.behavior = attachment
        item.completion = completion
        attachment.commit()
    }
    
    public func pushedTo(_ to: Double,render: @escaping (Double) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem<Double>(from: self,to: to,render: render)
        let direction = CGVector(dx: item.toP.x - item.fromP.x, dy: item.toP.y - item.fromP.y)
        let push = item.pushBehavior(direction, mode: .instantaneous, magnitude: 1.0)
        item.behavior = push
        item.boundaryLimit = true
        item.completion = completion
        push.commit()
    }
    
    public func animateTo(_ to: Double, duration: CFTimeInterval = 0.25, delay: CFTimeInterval = 0.0,type: TimingFunctionType = .default, autoreverses: Bool = false, repeatCount: Int = 0, render: @escaping (Double) -> Void, completion: ((Bool) -> Void)? = nil) {
        let basicItem = DynamicItemBasic(from: self, to: to, render: render)
        let push = basicItem.pushBehavior(.down)
        basicItem.behavior = push
        basicItem.duration = duration
        basicItem.timingFunction = type.easing()
        basicItem.completion = completion
        basicItem.autoreverses = autoreverses
        basicItem.repeatCount = repeatCount
        basicItem.delay = delay
        push.commitToBasic()
    }
    
    //
    func convert(_ p: CGPoint) -> Double {
        return Double(p.y)
    }
    
    func reverse() -> CGPoint {
        return CGPoint(x: 0, y: CGFloat(self))
    }
    
    //Interpolatable
    
    func interpolate(_ progress: Double, to: Double, externalData: Any?) -> Double {
        let change = to - self
        return self + change * progress
    }
    
}

extension CGFloat: Physical , Vectorial, Interpolatable {
    
    public func fallTo(_ to: CGFloat,magnitude: Double = 1.0,render: @escaping (CGFloat) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItemGravity(from: self, to: to, render: render)
        let push = item.pushBehavior(.down)
        item.behavior = push
        item.magnitude = magnitude
        item.completion = completion
        push.commitToBasic()
    }
    
    public func snapTo(_ to: CGFloat,damping: CGFloat = 0.5,render: @escaping ((CGFloat) -> Void), completion: (() -> Void)? = nil) {
        let item = DynamicItem<CGFloat>(from: self, to: to, render: render)
        let snap = item.snapBehavior(item.toP, damping: damping)
        item.behavior = snap
        item.completion = completion
        snap.commit()
    }
    
    public func attachmentTo(_ to: CGFloat,damping: CGFloat = 0.5,frequency: CGFloat = 0.5,render: @escaping (CGFloat) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem<CGFloat>(from: self, to: to,render: render)
        let attachment = item.attachmentBehavior(item.toP, length: 0.0, damping: damping, frequency: frequency)
        item.behavior = attachment
        item.completion = completion
        attachment.commit()
    }
    
    public func pushedTo(_ to: CGFloat,render: @escaping (CGFloat) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem<CGFloat>(from: self,to: to,render: render)
        item.boundaryLimit = true
        let direction = CGVector(dx: item.toP.x - item.fromP.x, dy: item.toP.y - item.fromP.y)
        let push = item.pushBehavior(direction, mode: .instantaneous, magnitude: 1.0)
        item.behavior = push
        item.completion = completion
        push.commit()
    }
    
    public func animateTo(_ to: CGFloat, duration: CFTimeInterval = 0.25, delay:CFTimeInterval = 0.25, type: TimingFunctionType = .default, autoreverses: Bool = false, repeatCount: Int = 0, render: @escaping (CGFloat) -> Void, completion: ((Bool) -> Void)? = nil) {
        let basicItem = DynamicItemBasic(from: self, to: to, render: render)
        let push = basicItem.pushBehavior(.down)
        basicItem.behavior = push
        basicItem.duration = duration
        basicItem.timingFunction = type.easing()
        basicItem.completion = completion
        basicItem.autoreverses = autoreverses
        basicItem.repeatCount = repeatCount
        basicItem.delay = delay
        push.commitToBasic()
    }
    
    //
    func convert(_ p: CGPoint) -> CGFloat {
        return p.y
    }
    
    func reverse() -> CGPoint {
        return CGPoint(x: 0, y: self)
    }
    
    //Interpolatable
    
    func interpolate(_ progress: Double, to: CGFloat, externalData: Any?) -> CGFloat {
        let change = to - self
        return self + change * CGFloat(progress)
    }
    
}

extension CGSize: Physical, Vectorial, Interpolatable {
    
    public func fallTo(_ to: CGSize,magnitude: Double = 1.0, render: @escaping (CGSize) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItemGravity(from: self, to: to, render: render)
        let push = item.pushBehavior(.down)
        item.behavior = push
        item.magnitude = magnitude
        item.completion = completion
        push.commitToBasic()
    }
    
    public func snapTo(_ to: CGSize,damping: CGFloat = 0.5,render: @escaping ((CGSize) -> Void), completion: (() -> Void)? = nil) {
        let item = DynamicItem<CGSize>(from: self, to: to, render: render)
        let snap = item.snapBehavior(item.toP, damping: damping)
        item.behavior = snap
        item.completion = completion
        snap.commit()
    }
    
    public func attachmentTo(_ to: CGSize,damping: CGFloat = 0.5,frequency: CGFloat = 0.5,render: @escaping (CGSize) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem<CGSize>(from: self, to: to,render: render)
        let attachment = item.attachmentBehavior(item.toP, length: 0.0, damping: damping, frequency: frequency)
        item.behavior = attachment
        item.completion = completion
        attachment.commit()
    }
    
    public func pushedTo(_ to: CGSize,render: @escaping (CGSize) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem<CGSize>(from: self,to: to,render: render)
        item.boundaryLimit = true
        let direction = CGVector(dx: item.toP.x - item.fromP.x, dy: item.toP.y - item.fromP.y)
        let push = item.pushBehavior(direction, mode: .instantaneous, magnitude: 1.0)
        item.behavior = push
        item.completion = completion
        push.commit()
    }
    
    public func animateTo(_ to: CGSize, duration: CFTimeInterval = 0.25, delay: CFTimeInterval = 0.0, type: TimingFunctionType = .default, autoreverses: Bool = false, repeatCount: Int = 0, render: @escaping (CGSize) -> Void, completion: ((Bool) -> Void)? = nil) {
        let basicItem = DynamicItemBasic(from: self, to: to, render: render)
        let push = basicItem.pushBehavior(.down)
        basicItem.behavior = push
        basicItem.duration = duration
        basicItem.timingFunction = type.easing()
        basicItem.completion = completion
        basicItem.autoreverses = autoreverses
        basicItem.repeatCount = repeatCount
        basicItem.delay = delay
        push.commitToBasic()
    }
    
    //
    func convert(_ p: CGPoint) -> CGSize {
        return CGSize(width: p.x, height: p.y)
    }
    
    func reverse() -> CGPoint {
        return CGPoint(x: self.width, y: self.height)
    }
    
    //
    func interpolate(_ progress: Double, to: CGSize, externalData: Any?) -> CGSize {
        let wChnaged = to.width - self.width;
        let hChanged = to.height - self.height;
        let currentW = self.width + wChnaged * CGFloat(progress);
        let currentH = self.height + hChanged * CGFloat(progress);
        return CGSize(width: currentW, height: currentH)
    }
}

extension CGPoint: Physical, Vectorial, Interpolatable {
    
    public func fallTo(_ to: CGPoint,magnitude: Double = 1.0,render: @escaping (CGPoint) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItemGravity(from: self, to: to, render: render)
        let push = item.pushBehavior(.down)
        item.behavior = push
        item.magnitude = magnitude
        item.completion = completion
        push.commitToBasic()
    }
    
    public func snapTo(_ to: CGPoint,damping: CGFloat = 0.5,render: @escaping ((CGPoint) -> Void), completion: (() -> Void)? = nil) {
        let item = DynamicItem<CGPoint>(from: self, to: to, render: render)
        let snap = item.snapBehavior(item.toP, damping: damping)
        item.behavior = snap
        item.completion = completion
        snap.commit()
    }
    
    public func attachmentTo(_ to: CGPoint,damping: CGFloat = 0.5,frequency: CGFloat = 0.5,render: @escaping (CGPoint) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem<CGPoint>(from: self, to: to,render: render)
        let attachment = item.attachmentBehavior(item.toP, length: 0.0, damping: damping, frequency: frequency)
        item.behavior = attachment
        item.completion = completion
        attachment.commit()
    }
    
    public func pushedTo(_ to: CGPoint,render: @escaping (CGPoint) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem<CGPoint>(from: self,to: to,render: render)
        item.boundaryLimit = true
        let direction = CGVector(dx: item.toP.x - item.fromP.x, dy: item.toP.y - item.fromP.y)
        let push = item.pushBehavior(direction, mode: .instantaneous, magnitude: 1.0)
        item.behavior = push
        item.completion = completion
        push.commit()
    }
    
    public func animateTo(_ to: CGPoint, duration: CFTimeInterval = 0.25, delay:CFTimeInterval = 0.0, type: TimingFunctionType = .default, autoreverses: Bool = false, repeatCount: Int = 0, render: @escaping (CGPoint) -> Void, completion: ((Bool) -> Void)? = nil) {
        let basicItem = DynamicItemBasic(from: self, to: to, render: render)
        let push = basicItem.pushBehavior(.down)
        basicItem.behavior = push
        basicItem.duration = duration
        basicItem.timingFunction = type.easing()
        basicItem.completion = completion
        basicItem.autoreverses = autoreverses
        basicItem.repeatCount = repeatCount
        basicItem.delay = delay
        push.commitToBasic()
    }
    //
    func convert(_ p: CGPoint) -> CGPoint {
        return p
    }
    
    func reverse() -> CGPoint {
        return self
    }
    
    func interpolate(_ progress: Double, to: CGPoint, externalData: Any?) -> CGPoint {
        let xChnaged = to.x - self.x;
        let yChanged = to.y - self.y;
        let currentX = self.x + xChnaged * CGFloat(progress);
        let currentY = self.y + yChanged * CGFloat(progress);
        return CGPoint(x: currentX, y: currentY)
    }
}

extension CGRect: Physical, Vectorial, Interpolatable {
    
    public func fallTo(_ to: CGRect,magnitude: Double = 1.0, render: @escaping (CGRect) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItemGravity(from: self, to: to, render: render)
        let push = item.pushBehavior(.down)
        item.behavior = push
        item.magnitude = magnitude
        item.completion = completion
        push.commitToBasic()
    }
    
    public func snapTo(_ to: CGRect,damping: CGFloat = 05, render: @escaping ((CGRect) -> Void), completion: (() -> Void)? = nil) {
        let item = DynamicItem2(from: self, to: to, render:render)
        let snap = item.snapBehavior(CGPoint(x: 0.0, y: item.referenceChangeLength), damping: damping)
        item.behavior = snap
        item.completion = completion
        snap.commit()
    }
    
    public func attachmentTo(_ to: CGRect,damping: CGFloat = 0.5,frequency: CGFloat = 0.5, render: @escaping (CGRect) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem2(from: self, to: to, render:render)
        let point = CGPoint(x: 0.0, y: item.referenceChangeLength)
        let attachment = item.attachmentBehavior(point, length: 0.0, damping: damping, frequency: frequency)
        item.behavior = attachment
        item.completion = completion
        attachment.commit()
    }
    
    public func pushedTo(_ to: CGRect, render: @escaping (CGRect) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem2(from: self, to: to, render:render)
        let push = item.pushBehavior(.down)
        push.magnitude = 2.0
        item.boundaryLimit = true
        item.behavior = push
        item.completion = completion
        push.commit()
    }
    
    public func animateTo(_ to: CGRect, duration: CFTimeInterval = 0.25, delay:CFTimeInterval = 0.0, type: TimingFunctionType = .default, autoreverses: Bool = false, repeatCount: Int = 0, render: @escaping (CGRect) -> Void, completion: ((Bool) -> Void)? = nil) {
        let basicItem = DynamicItemBasic(from: self, to: to, render: render)
        let push = basicItem.pushBehavior(.down)
        basicItem.behavior = push
        basicItem.duration = duration
        basicItem.timingFunction = type.easing()
        basicItem.completion = completion
        basicItem.autoreverses = autoreverses
        basicItem.repeatCount = repeatCount
        basicItem.delay = delay
        push.commitToBasic()
    }
    
    //
    func convert(_ r: CGRect) -> CGRect {
        return r
    }
    
    func reverse() -> CGRect {
        return self
    }
    
    //
    func interpolate(_ progress: Double, to: CGRect, externalData: Any?) -> CGRect {
        let xChanged = to.minX - self.minX
        let yChanged = to.minY - self.minY
        let wChnaged = to.width - self.width;
        let hChanged = to.height - self.height;
        let currentX = self.minX + xChanged * CGFloat(progress)
        let currentY = self.minY + yChanged * CGFloat(progress)
        let currentW = self.width + wChnaged * CGFloat(progress)
        let currentH = self.height + hChanged * CGFloat(progress)
        
        return CGRect(x: currentX, y: currentY, width: currentW, height: currentH)
    }
}

extension UIColor : Physical, Vectorial, Interpolatable {
    
    public typealias T = UIColor
    
    public func fallTo(_ to: T,magnitude: Double = 1.0, render: @escaping (T) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItemGravity(from: self, to: to, render: render)
        let push = item.pushBehavior(.down)
        item.behavior = push
        item.magnitude = magnitude
        item.completion = completion
        push.commitToBasic()
    }
    
    public func snapTo(_ to: UIColor,damping: CGFloat = 0.5, render: @escaping ((UIColor) -> Void), completion: (() -> Void)? = nil) {
        let item = DynamicItem2(from: self, to: to, render:render)
        let point = CGPoint(x: 0.0, y: item.referenceChangeLength)
        let snap = item.snapBehavior(point, damping: damping)
        item.behavior = snap
        item.completion = completion
        snap.commit()
    }
    
    public func attachmentTo(_ to: UIColor,damping: CGFloat = 0.5,frequency: CGFloat = 0.5, render: @escaping (UIColor) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem2(from: self, to: to, render:render)
        let point = CGPoint(x: 0.0, y: item.referenceChangeLength)
        let attachment = item.attachmentBehavior(point, length: 0.0, damping: damping, frequency: frequency)
        item.behavior = attachment
        item.completion = completion
        attachment.commit()
    }
    
    public func pushedTo(_ to: UIColor, render: @escaping (UIColor) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem2(from: self, to: to, render:render)
        let push = item.pushBehavior(.down)
        push.magnitude = 2.0
        item.boundaryLimit = true
        item.behavior = push
        item.completion = completion
        push.commit()
    }
    
    public func animateTo(_ to: UIColor, duration: CFTimeInterval = 0.25, delay:CFTimeInterval = 0.0, type: TimingFunctionType = .default, autoreverses: Bool = false, repeatCount: Int = 0, render: @escaping (UIColor) -> Void, completion: ((Bool) -> Void)? = nil) {
        let basicItem = DynamicItemBasic(from: self, to: to, render: render)
        let push = basicItem.pushBehavior(.down)
        basicItem.behavior = push
        basicItem.duration = duration
        basicItem.timingFunction = type.easing()
        basicItem.completion = completion
        basicItem.autoreverses = autoreverses
        basicItem.repeatCount = repeatCount
        basicItem.delay = delay
        
        push.commitToBasic()
    }
    
    //
    func convert(_ r: CGRect) -> Self {
        let hue = r.minX / 250.0
        let saturation = r.minY / 250.0
        let brightness = r.width / 250.0
        let alpha = r.height / 250.0
        return convertT(hue,saturation: saturation,brightness: brightness,alpha: alpha)
    }
    
    func reverse() -> CGRect {
        var hue: CGFloat = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        hue *= 250.0
        saturation *= 250.0
        brightness *= 250.0
        alpha *= 250.0
        return CGRect(x: hue, y: saturation, width: brightness, height: alpha)
    }
    
    fileprivate func convertT<T>(_ hue: CGFloat,saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> T {
        let color = UIColor(hue: hue,saturation: saturation,brightness: brightness,alpha: alpha)
        return unsafeBitCast(color, to: T.self)
    }
    
    //
    func interpolate(_ progress: Double, to: UIColor, externalData: Any?) -> Self {
        let infos = externalData as! (ColorInfo,ColorInfo)
        let fromInfo = infos.0
        let toInfo = infos.1
        let changedHue =  toInfo.hue - fromInfo.hue
        let changedSaturation = toInfo.saturation - fromInfo.saturation
        let changedBrightness = toInfo.brightness - fromInfo.brightness
        let changedAlpha = toInfo.alpha - fromInfo.alpha
        
        let curHue = fromInfo.hue + changedHue * CGFloat(progress)
        let curSaturation = fromInfo.saturation + changedSaturation * CGFloat(progress)
        let curBrightness = fromInfo.brightness + changedBrightness * CGFloat(progress)
        let curAlpha = fromInfo.alpha + changedAlpha * CGFloat(progress)
        
        return convertT(curHue,saturation: curSaturation,brightness: curBrightness,alpha: curAlpha)
    }
    
    //performance
    typealias ColorInfo = (hue:CGFloat,saturation:CGFloat,brightness:CGFloat,alpha:CGFloat)
    internal func colorInfo() -> ColorInfo {
        var hue: CGFloat = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return (hue,saturation,brightness,alpha)
    }
    
}
