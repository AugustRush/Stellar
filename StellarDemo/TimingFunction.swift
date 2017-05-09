//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
import Foundation

/// A set of preset bezier curves.
public enum TimingFunctionType {
    /// Equivalent to `kCAMediaTimingFunctionDefault`.
    case `default`
    
    /// Equivalent to `kCAMediaTimingFunctionEaseIn`.
    case easeIn
    
    /// Equivalent to `kCAMediaTimingFunctionEaseOut`.
    case easeOut
    
    /// Equivalent to `kCAMediaTimingFunctionEaseInEaseOut`.
    case easeInEaseOut
    
    /// No easing.
    case linear
    
    /// Inspired by the default curve in Google Material Design.
    case swiftOut
    /// 
    case backEaseIn
    ///
    case backEaseOut
    ///
    case backEaseInOut
    ///
    case bounceOut
    ///
    case sine
    ///
    case circ
    ///
    case exponentialIn
    ///
    case exponentialOut
    ///
    case elasticIn
    ///
    case bounceReverse
    ///
    case elasticOut
    /// custom
    case custom(Double, Double, Double, Double)
    
    
    func easing() -> TimingSolvable {
        switch self {
        case .default:
            return UnitBezier(p1x: 0.25, p1y: 0.1, p2x: 0.25, p2y: 1.0)
        case .easeIn:
            return UnitBezier(p1x: 0.42, p1y: 0.0, p2x: 1.0, p2y: 1.0)
        case .easeOut:
            return UnitBezier(p1x: 0.0, p1y: 0.0, p2x: 0.58, p2y: 1.0)
        case .easeInEaseOut:
            return UnitBezier(p1x: 0.42, p1y: 0.0, p2x: 0.58, p2y: 1.0)
        case .linear: 
            return UnitBezier(p1x: 0.0, p1y: 0.0, p2x: 1.0, p2y: 1.0)
        case .swiftOut: 
            return UnitBezier(p1x: 0.4, p1y: 0.0, p2x: 0.2, p2y: 1.0)
        case .backEaseIn:
            return EasingContainer(easing: { (t: Double) in
                return t * t * t - t * sin(t * .pi)
            })
        case .backEaseOut:
            return EasingContainer(easing: { (t: Double) in
                let f = (1 - t);
                return 1 - (f * f * f - f * sin(f * .pi));
            })
        case .backEaseInOut:
            return EasingContainer(easing: { (t: Double) in
                if(t < 0.5) {
                    let f = 2 * t;
                    return 0.5 * (f * f * f - f * sin(f * .pi));
                } else {
                    let f = (1.0 - (2.0 * t - 1.0));
                    let cubic = f * f * f
                    return 0.5 * (1.0 - (cubic - f * sin(f * .pi))) + 0.5;
                }
            })
        case .bounceOut:
            return EasingContainer(easing: { (t: Double) in
                if(t < 4/11.0){
                    return (121 * t * t)/16.0;
                } else if(t < 8/11.0){
                    return (363/40.0 * t * t) - (99/10.0 * t) + 17/5.0;
                }else if(t < 9/10.0){
                    return (4356/361.0 * t * t) - (35442/1805.0 * t) + 16061/1805.0;
                }else{
                    return (54/5.0 * t * t) - (513/25.0 * t) + 268/25.0;
                }
            })
        case .sine:
            return EasingContainer(easing: { (t: Double) in
                return 1 - cos( t * .pi / 2.0)
            })
        case .circ:
            return EasingContainer(easing: { (t: Double) in
                return 1 - sqrt( 1.0 - t * t )
            })
        case .exponentialIn:
            return EasingContainer(easing: { (t: Double) in
                return (t == 0.0) ? t : pow(2, 10 * (t - 1))
            })
        case .exponentialOut:
            return EasingContainer(easing: { (t: Double) in
                return (t == 1.0) ? t : 1 - pow(2, -10 * t)
            })
        case .elasticIn:
            return EasingContainer(easing: { (t: Double) in
                return sin(13.0 * (.pi / 2.0) * t) * pow(2, 10 * (t - 1))
            })
        case .elasticOut:
            return EasingContainer(easing: { (t: Double) in
                return sin(-13.0 * (.pi / 2.0) * (t + 1)) * pow(2, -10 * t) + 1.0;
            })
        case .bounceReverse:
            return EasingContainer(easing: { (t: Double) in
                var bounce: Double = 4.0
                var pow2 = 0.0
                
                repeat {
                    bounce = bounce - 1.0
                    pow2 = pow(2, bounce)
                } while (t < (pow2 - 1.0 ) / 11.0)
                
                return 1 / pow( 4, 3 - bounce ) - 7.5625 * pow( ( pow2 * 3 - 2 ) / 22 - t, 2 );
            })
        case .custom(let p1x,let p1y,let p2x,let p2y):
            return UnitBezier(p1x: p1x, p1y: p1y, p2x: p2x, p2y: p2y)
        }
    }
}

class EasingContainer: TimingSolvable {
    let easing: (Double) -> Double
    
    init(easing: @escaping (Double) -> Double) {
        self.easing = easing
    }
    
    //
    func solveOn(_ time: Double, epslion: Double) -> Double {
        return self.easing(time)
    }
}


