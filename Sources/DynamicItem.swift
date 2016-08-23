//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

final class DynamicItem<T: Vectorial where T.VectorType == CGPoint>: NSObject, UIDynamicItem {
    var from: T
    var to: T
    var render: (T) -> Void
    var boundaryLimit = false
    var complete = false
    var completion: (() -> Void)?
    weak var behavior: UIDynamicBehavior!
    internal var fromP: CGPoint
    internal var toP: CGPoint
    private var change: CGFloat
    
    init(from: T, to: T, render: (T) -> Void) {
        self.from = from
        self.to = to
        self.fromP = from.reverse()
        self.toP = to.reverse()
        self.render = render
        self.center = self.fromP
        self.change = fabs(self.toP.y - self.fromP.y)
    }
    
    deinit {
        //correct target value
        let value = to.convert(toP)
        render(value)
        //completion
        complete = true
        completion?()
    }
    
    //MARK: Update frame
    
    func updateFrame() {
        var current = center
        let hasChanged = fabs(current.y - fromP.y)
        if hasChanged >= change {
            if boundaryLimit {
                current = toP
                //remove behavior
                behavior.cancel()
                //completion
                complete = true
            }
        }
        let value = to.convert(current)
        render(value)
    }
    
    //MARK: UIDynamicItem protocol
    var center: CGPoint {
        didSet {
            updateFrame()
        }
    }
    var transform: CGAffineTransform = CGAffineTransformIdentity
    var bounds: CGRect {
        get {
            return CGRectMake(center.x, center.y, 100, 100)
        }
    }
}
