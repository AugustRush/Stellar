//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

//for 4 latitude
final class DynamicItem<T: Vectorial>: NSObject, UIDynamicItem {
    
    var from: T
    var to: T
    var render: (T) -> Void
    var complete = false
    var boundaryLimit = false
    var completion: (() -> Void)?
    internal var fromR: Vector4
    internal var toR: Vector4
    weak var behavior: UIDynamicBehavior!
    fileprivate var change: (x: Double,y: Double,z: Double,w: Double)
    var referenceChangeLength: Double
    
    init(from: T, to: T, render: @escaping (T) -> Void) {
        self.from = from
        self.to = to
        self.render = render
        //
        self.fromR = from.reverse()
        self.toR = to.reverse()
        //
        let x = toR.one - fromR.one
        let y = toR.two - fromR.two
        let z = toR.three - fromR.three
        let w = toR.four - fromR.four
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
        let yChange = fabs(Double(center.y))
        let progress = yChange / referenceChangeLength
        let curX = fromR.one + change.x * progress;
        let curY = fromR.two + change.y * progress;
        let curZ = fromR.three + change.z * progress;
        let curW = fromR.four + change.w * progress;
        
        let rect = Vector4.init((curX.isNaN ? 0 : curX,curY.isNaN ? 0 : curY,curZ.isNaN ? 0 : curZ,curW.isNaN ? 0 : curZ))
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
    var center: CGPoint = CGPoint.zero {
        didSet {
            updateFrame()
        }
    }
    
    var transform: CGAffineTransform = CGAffineTransform.identity
    var bounds: CGRect {
        get {
            return CGRect(x: -50.0, y: -50.0, width: 100.0, height: 100.0)
        }
    }
}
