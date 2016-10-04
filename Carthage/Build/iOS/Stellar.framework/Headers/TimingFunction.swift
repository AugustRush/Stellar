//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
import Foundation

typealias TimingFunction = UnitBezier

/// A set of preset bezier curves.
public enum TimingFunctionType {
    /// Equivalent to `kCAMediaTimingFunctionDefault`.
    case Default
    
    /// Equivalent to `kCAMediaTimingFunctionEaseIn`.
    case EaseIn
    
    /// Equivalent to `kCAMediaTimingFunctionEaseOut`.
    case EaseOut
    
    /// Equivalent to `kCAMediaTimingFunctionEaseInEaseOut`.
    case EaseInEaseOut
    
    /// No easing.
    case Linear
    
    /// Inspired by the default curve in Google Material Design.
    case SwiftOut
    /// custom
    case Custom(Double, Double, Double, Double)
    
    
    func timingFunction() -> TimingFunction {
        switch self {
        case .Default:
            return UnitBezier(p1x: 0.25, p1y: 0.1, p2x: 0.25, p2y: 1.0)
        case .EaseIn:
            return UnitBezier(p1x: 0.42, p1y: 0.0, p2x: 1.0, p2y: 1.0)
        case .EaseOut:
            return UnitBezier(p1x: 0.0, p1y: 0.0, p2x: 0.58, p2y: 1.0)
        case .EaseInEaseOut:
            return UnitBezier(p1x: 0.42, p1y: 0.0, p2x: 0.58, p2y: 1.0)
        case .Linear: 
            return UnitBezier(p1x: 0.0, p1y: 0.0, p2x: 1.0, p2y: 1.0)
        case .SwiftOut: 
            return UnitBezier(p1x: 0.4, p1y: 0.0, p2x: 0.2, p2y: 1.0)
        case .Custom(let p1x,let p1y,let p2x,let p2y):
            return UnitBezier(p1x: p1x, p1y: p1y, p2x: p2x, p2y: p2y)
        }
    }
}
