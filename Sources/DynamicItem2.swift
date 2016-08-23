//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

//for 4 latitude
final class DynamicItem2<T: Vectorial where T.VectorType == CGRect>: NSObject, UIDynamicItem {
    
    var from: T
    var to: T
    var render: (T) -> Void
    var complete = false
    var boundaryLimit = false
    var completion: (() -> Void)?
    internal var fromR: CGRect
    internal var toR: CGRect
    weak var behavior: UIDynamicBehavior!
    private var change: (x: CGFloat,y: CGFloat,z: CGFloat,w: CGFloat)
    var referenceChangeLength: CGFloat
    
    init(from: T, to: T, render: (T) -> Void) {
        self.from = from
        self.to = to
        self.render = render
        //
        self.fromR = from.reverse()
        self.toR = to.reverse()
        //
        let x = toR.minX - fromR.minX
        let y = toR.minY - fromR.minY
        let z = toR.width - fromR.width
        let w = toR.height - fromR.height
        self.change = (x,y,z,w)
        //
        let originChange = sqrt(x*x + y*y)
        let sizeChange = sqrt(z*z + w*w)
        self.referenceChangeLength = max(originChange, sizeChange)
    }
    
    deinit {
        self.render(to)
        complete = true
        completion?()
    }
    
    //MARK: Update frame
    
    func updateFrame() {
        let yChange = center.y
        let progress = yChange / referenceChangeLength
        let curX = fromR.minX + change.x * progress;
        let curY = fromR.minY + change.y * progress;
        let curZ = fromR.width + change.z * progress;
        let curW = fromR.height + change.w * progress;
        
        let rect = CGRectMake(curX, curY, curZ, curW)
        var curV = from.convert(rect)
        if progress >= 1.0 {
            if boundaryLimit {
                curV = to
                behavior.cancel()
                complete = true
            }
        }
        self.render(curV)
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
