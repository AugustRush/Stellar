//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

class DynamicItemGravity<T: Interpolatable>: NSObject, UIDynamicItem {
    
    var from: T!
    var to: T!
    var magnitude = 1.0
    var render: (T) -> Void
    var completion: (() -> Void)?
    var boundary = true
    weak var behavior: UIDynamicBehavior?
    //private vars
    private var referenceChangedLength: Double = 0.0
    //External data to store (performance)
    private var externalData: Any?
    private lazy var beginTime = {
        return CACurrentMediaTime()
    }()
    
    //MARK: init method
    init(from: T, to: T, render: (T) -> Void) {
        self.from = from
        self.to = to
        self.render = render
        super.init()
        caculateReferenceChangedLength()
    }
    
    deinit {
        self.completion?()
    }
    
    //MARK: private methods
    private func caculateReferenceChangedLength() {
        switch from {
        case let f as CGFloat:
            let t = to as! CGFloat
            referenceChangedLength = Double(fabs(t - f))
            
        case let f as Float:
            let t = to as! Float
            referenceChangedLength = Double(fabs(t - f))
            
        case let f as Double:
            let t = to as! Double
            referenceChangedLength = fabs(t - f)
            
        case let f as CGSize:
            let t = to as! CGSize
            let w = fabs(t.width - f.width)
            let h = fabs(t.height - f.height)
            referenceChangedLength = max(Double(w), Double(h))

        case let f as CGPoint:
            let t = to as! CGPoint
            let x = fabs(t.x - f.x)
            let y = fabs(t.y - f.y)
            referenceChangedLength = max(Double(x), Double(y))
            
        case let f as CGRect:
            let t = to as! CGRect
            let xChange = fabs(t.minX - f.minX)
            let yChange = fabs(t.minY - f.minY)
            let wChange = fabs(t.width - f.width)
            let hChange = fabs(t.height - f.height)
            let originC = hypot(xChange, yChange)
            let sizeC = hypot(wChange, hChange)
            referenceChangedLength = max(Double(originC), Double(sizeC))
            
        case let f as UIColor:
            let t = to as! UIColor
            let fromInfo = f.colorInfo()
            let toInfo = t.colorInfo()
            let hueChange = fabs(toInfo.hue - fromInfo.hue)
            let brightnessChange = fabs(toInfo.brightness - fromInfo.brightness)
            let saturationChange = fabs(toInfo.saturation - fromInfo.saturation)
            let alphaChange = fabs(toInfo.alpha - fromInfo.alpha)
            let oneC = hypot(hueChange, saturationChange) * 1000.0
            let twoC = hypot(brightnessChange, alphaChange) * 1000.0
            referenceChangedLength = max(Double(oneC), Double(twoC))
            externalData = (fromInfo,toInfo)
            
        default:
            referenceChangedLength = 1000.0
       
        }
    }
    
    private func updateFrame() {
        if referenceChangedLength <= 0.0 {
            behavior?.cancel()
            return
        }
        var currentTime = CACurrentMediaTime() - beginTime
        currentTime = max(0.0, currentTime)
        let offset = gravityOffset(currentTime)
        var progress = offset / referenceChangedLength
        if progress >= 1.0 {
            if boundary {
                progress = 1.0
                behavior?.cancel()
            }
        }
        
        let value = from.interpolate(progress, to: to, externalData: externalData)
        render(value)
    }
    
    private func gravityOffset(t: CFTimeInterval) -> Double {
        return t * t * 1000.0 * magnitude;
    }
    
    //MARK: UIDynamicItem protocol
    var center: CGPoint = CGPointZero {
        didSet {
            updateFrame()
        }
    }
    
    var transform: CGAffineTransform = CGAffineTransformIdentity
    var bounds: CGRect {
        get {
            return CGRectMake(0.0, 0.0, 100.0, 100.0)
        }
    }
}
