//
//  DynamicTransmission.swift
//  StellarDemo
//
//  Created by AugustRush on 9/20/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class DynamicTransmission {
    
}

class BasicTransmission: DynamicTransmission {
    var duration: CFTimeInterval = 0.25
    var delay: CFTimeInterval = 0.0
    var timingCurve: TimingSolvable = TimingFunctionType.Default.easing()
    
}
