//
//  GravityConfigurable.swift
//  StellarDemo
//
//  Created by AugustRush on 6/2/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

public protocol GravityConfigurable: BasicChainable {
    func gravity(magnitude: CGFloat) -> GravityConfigurable
}
