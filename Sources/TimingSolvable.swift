//
//  TimingSolvable.swift
//  StellarDemo
//
//  Created by AugustRush on 6/28/16.
//  Copyright © 2016 August. All rights reserved.
//

import Foundation

protocol TimingSolvable {
    func solveOn(time: Double, epslion: Double) -> Double
}