//
//  TimingType.swift
//  StellarDemo
//
//  Created by AugustRush on 5/26/16.
//  Copyright © 2016 August. All rights reserved.
//

import Foundation

protocol TimingType {
    var duration: CFTimeInterval { get set }
    var delay: CFTimeInterval { get set }
    var timingFunction: TimingFunction { get set }
    var autoreverses: Bool { get set }
    var repeatCount: Int { get set }
    var speed: Double { get set }
    var timeOffset: CFTimeInterval { get set }
}