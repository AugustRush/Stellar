//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

extension Float: Vectorial, Interpolatable {
    
    //Vetorial
    public func convert(_ p: Vector4) -> Float {
        return Float(p.two)
    }
    public func reverse() -> Vector4 {
        let vector = Vector4()
        vector.two = Double(self)
        return vector
    }
    
    //Interpolatable
    
    public func interpolate(_ progress: Double, to: Float, externalData: Any?) -> Float {
        let change = to - self
        return self + change * Float(progress)
    }
}

extension Double: Vectorial, Interpolatable {
    
    //Vetorial
    public func convert(_ p: Vector4) -> Double {
        return p.two
    }
    public func reverse() -> Vector4 {
        let vector = Vector4()
        vector.two = self
        return vector
    }
    
    //Interpolatable
    
    public func interpolate(_ progress: Double, to: Double, externalData: Any?) -> Double {
        let change = to - self
        return self + change * progress
    }
    
}

extension CGFloat: Vectorial, Interpolatable {
    
    public func convert(_ p: Vector4) -> CGFloat {
        return CGFloat(p.two)
    }
    
    public func reverse() -> Vector4 {
        let vector = Vector4()
        vector.two = Double(self)
        return vector
    }
    
    //Interpolatable
    
    public func interpolate(_ progress: Double, to: CGFloat, externalData: Any?) -> CGFloat {
        let change = to - self
        return self + change * CGFloat(progress)
    }
    
}

extension CGSize: Vectorial, Interpolatable {
    
    //
    public func convert(_ p: Vector4) -> CGSize {
        return CGSize(width: p.one, height: p.two)
    }
    
    public func reverse() -> Vector4 {
        let vector = Vector4()
        vector.one = Double(self.width)
        vector.two = Double(self.height)
        return vector
    }
    
    //
    public func interpolate(_ progress: Double, to: CGSize, externalData: Any?) -> CGSize {
        let wChnaged = to.width - self.width;
        let hChanged = to.height - self.height;
        let currentW = self.width + wChnaged * CGFloat(progress);
        let currentH = self.height + hChanged * CGFloat(progress);
        return CGSize(width: currentW, height: currentH)
    }
}

extension CGPoint: Vectorial, Interpolatable {
    
    //
    public func convert(_ p: Vector4) -> CGPoint {
        return CGPoint(x: p.one, y: p.two)
    }
    
    public func reverse() -> Vector4 {
        let vector = Vector4()
        vector.one = Double(self.x)
        vector.two = Double(self.y)
        return vector
    }
    
    public func interpolate(_ progress: Double, to: CGPoint, externalData: Any?) -> CGPoint {
        let xChnaged = to.x - self.x;
        let yChanged = to.y - self.y;

        let currentX = self.x + xChnaged * CGFloat(progress);
        let currentY = self.y + yChanged * CGFloat(progress);
        return CGPoint(x: currentX, y: currentY)
    }
}

extension CGRect: Vectorial, Interpolatable {
    
    
    public func convert(_ p: Vector4) -> CGRect {
        return CGRect.init(x: p.one, y: p.two, width: p.three, height: p.four)
    }
    public func reverse() -> Vector4 {
        let vector = Vector4()
        vector.one = Double(self.origin.x)
        vector.two = Double(self.origin.y)
        vector.three = Double(self.size.width)
        vector.four = Double(self.size.height)
        return vector
    }
    
    //
    public func interpolate(_ progress: Double, to: CGRect, externalData: Any?) -> CGRect {
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

extension Physical {
    public func fall(to: Self,magnitude: Double = 1.0, render: @escaping (Self) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItemGravity(from: self, to: to, render: render)
        let push = item.pushBehavior(.down)
        item.behavior = push
        item.magnitude = magnitude
        item.completion = completion
        push.commitToBasic()
    }
    
    public func snap(to: Self, damping: CGFloat = 0.5,render: @escaping (Self) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem2(from: self, to: to, render: render)
        let toP = CGPoint.init(x: item.toR.one, y: item.toR.two)
        let snap = item.snapBehavior(toP, damping: damping)
        item.behavior = snap
        item.completion = completion
        snap.commit()
    }
    
    public func attachment(to: Self,damping: CGFloat = 0.5, frequency: CGFloat = 0.5,render: @escaping (Self) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem2(from: self, to: to,render: render)
        let toP = CGPoint.init(x: item.toR.one, y: item.toR.two)
        let attachment = item.attachmentBehavior(toP, length: 0.0, damping: damping, frequency: frequency)
        item.behavior = attachment
        item.completion = completion
        attachment.commit()
    }
    
    public func pushed(to: Self,render: @escaping (Self) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem2(from: self,to: to,render: render)
        let direction = CGVector(dx: item.toR.one - item.fromR.one, dy: item.toR.two - item.fromR.two)
        let push = item.pushBehavior(direction, mode: .instantaneous, magnitude: 1.0)
        item.behavior = push
        item.boundaryLimit = true
        item.completion = completion
        push.commit()
    }
    
    public func animate(to: Self, duration: CFTimeInterval = 0.25, delay: CFTimeInterval = 0.0, type: TimingFunctionType = .default, autoreverses: Bool = false, repeatCount: Int = 0, render: @escaping (Self) -> Void, completion: ((Bool) -> Void)? = nil) {
        let basicItem = DynamicItemBasic(from: self, to: to, render: render)
        let push = basicItem.pushBehavior(.down)
        basicItem.behavior = push
        basicItem.duration = duration
        basicItem.timingFunction = type.easing()
        basicItem.completion = completion
        basicItem.delay = delay
        push.commitToBasic()
    }
    
    
}

extension UIColor: Vectorial, Interpolatable {

    //
    public func convert(_ p: Vector4) -> Self {
        let hue = p.one / 250.0
        let saturation = p.two / 250.0
        let brightness = p.three / 250.0
        let alpha = p.four / 250.0
        return convertT(CGFloat(hue),saturation: CGFloat(saturation),brightness: CGFloat(brightness),alpha: CGFloat(alpha))
    }
    
    public func reverse() -> Vector4 {
        var hue: CGFloat = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        hue *= 250.0
        saturation *= 250.0
        brightness *= 250.0
        alpha *= 250.0
        let vector = Vector4()
        vector.one = Double(hue)
        vector.two = Double(saturation)
        vector.three = Double(brightness)
        vector.four = Double(alpha)

        return vector

    }
        
    fileprivate func convertT<T>(_ hue: CGFloat,saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> T {
        let color = UIColor(hue: hue,saturation: saturation,brightness: brightness,alpha: alpha)
        return unsafeBitCast(color, to: T.self)
    }
    
    //
    public func interpolate(_ progress: Double, to: UIColor, externalData: Any?) -> Self {
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
