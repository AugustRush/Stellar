//
//  Interpolatable.swift
//  StellarDemo
//
//  Created by AugustRush on 5/23/16.
//  Copyright © 2016 August. All rights reserved.
//

import Foundation

protocol Interpolatable {
    func interpolate(progress: Double, to: Self, externalData: Any?) -> Self
}