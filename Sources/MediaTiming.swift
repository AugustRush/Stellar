//
//  MediaTiming.swift
//  StellarDemo
//
//  Created by AugustRush on 5/16/16.
//  Copyright © 2016 August. All rights reserved.
//

import Foundation

protocol MediaTiming {
    /* The begin time of the object, in relation to its parent object, if
     * applicable. Defaults to 0. */
    
    var beginTime: CFTimeInterval { get set }
    
    /* The basic duration of the object. Defaults to 0. */
    
    var duration: CFTimeInterval { get set }
    
    /* The rate of the layer. Used to scale parent time to local time, e.g.
     * if rate is 2, local time progresses twice as fast as parent time.
     * Defaults to 1. */
    
//    var speed: Float { get set }
    
    /* Additional offset in active local time. i.e. to convert from parent
     * time tp to active local time t: t = (tp - begin) * speed + offset.
     * One use of this is to "pause" a layer by setting `speed' to zero and
     * `offset' to a suitable value. Defaults to 0. */
    
//    var timeOffset: CFTimeInterval { get set }
    
    /* The repeat count of the object. May be fractional. Defaults to 0. */
    
//    var repeatCount: Float { get set }
    
//    var autoreverses: Bool { get set }
}