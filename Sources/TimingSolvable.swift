//
//  TimingSolvable.swift
//  StellarDemo
//
//  Created by AugustRush on 6/28/16.
//  Copyright © 2016 August. All rights reserved.
//

import Foundation

protocol TimingSolvable {
    /// time (0-1) just like progress
    func solveOn(time: Double, epslion: Double) -> Double
}
