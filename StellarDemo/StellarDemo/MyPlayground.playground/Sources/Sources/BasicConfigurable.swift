//
//  BasicConfigurable.swift
//  StellarDemo
//
//  Created by AugustRush on 5/28/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

public protocol BasicConfigurable: BasicChainable {
    func duration(d: CFTimeInterval) -> BasicConfigurable
    func easing(type: TimingFunctionType) -> BasicConfigurable
    func delay(d: CFTimeInterval) -> BasicConfigurable
    func autoreverses() -> BasicConfigurable
    func repeatCount(count: Int) -> BasicConfigurable
}
