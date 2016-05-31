//
//  AnimationStep.swift
//  StellarDemo
//
//  Created by AugustRush on 5/31/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

internal class AnimationStep {
    var types = [AnimationType]()
    var duration: CFTimeInterval = 0.25
    var easing: TimingFunctionType = .Default
    var delay: CFTimeInterval = 0.0
    var autoreverses: Bool = false
    var repeatCount: Int = 0
    var completion: (() -> Void)?
}
