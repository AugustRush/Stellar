//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

private let SolveForReverse = { (f: CFTimeInterval) in
    return 1 - f
}

private let SolveForUnReverse = { (f: CFTimeInterval) in
    return f
}

final class DynamicItemBasic<T: Interpolatable>: NSObject, UIDynamicItem, TimingType {
    
    var duration: CFTimeInterval = 0.25
    var delay: CFTimeInterval = 0.0
    var timingFunction: TimingSolvable = TimingFunctionType.Default.easing()
    var from: T
    var to: T
    var render: (T) -> Void
    var autoreverses = false
    var repeatCount = 0
    var completion: ((Bool) -> Void)?
    var speed: Double = 1.0
    var timeOffset: CFTimeInterval = 0.0 {
        didSet {
            updateFrame()
        }
    }
    
    weak var behavior: UIDynamicBehavior?
    //External data to store (performance)
    private var externalData: Any?
    private var complete = false
    private var isReversing = false
    private var solveProgress = SolveForUnReverse
    private lazy var beginTime: CFTimeInterval = {
        return CACurrentMediaTime()
    }()
    private lazy var epsilon: Double = {
        return 1.0 / (self.duration * 1000.0)
    }()
    
    //MARK: Life cycle methods
    init(from: T, to: T, render: (T) -> Void) {
        self.from = from
        self.to = to
        self.render = render
        
        if let fromColor = from as? UIColor {
            let fromInfo = fromColor.colorInfo()
            let toColor = to as! UIColor
            let toInfo = toColor.colorInfo()
            self.externalData = (fromInfo,toInfo)
        }
    }
    
    deinit {
        //do some thing
    }
    
    //MARK: update frame
    private func updateFrame() {
        let startTime = beginTime
        var currentTime = CACurrentMediaTime() - startTime - delay
        currentTime = max(0, currentTime) * speed + timeOffset
        var progress = currentTime / duration
        if progress >= 1.0 {
            isReversing = autoreverses ? !isReversing : false
            if repeatCount == 0 {
                if isReversing {
                    progress = 0.0
                    beginTime = CACurrentMediaTime()
                    solveProgress = SolveForReverse
                } else {
                    progress = 1.0
                    behavior?.cancel()
                    complete = true
                    self.completion?(complete)
                }
            }else {
                if isReversing == false {
                    repeatCount -= 1
                    solveProgress = SolveForUnReverse
                } else {
                    solveProgress = SolveForReverse
                }
                progress = 0.0
                beginTime = CACurrentMediaTime()
            }
        }
        let solveP = solveProgress(progress)
        let adjustProgress = timingFunction.solveOn(solveP, epslion: epsilon)
        let value = from.interpolate(adjustProgress, to: to, externalData: externalData)
        self.render(value)
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
