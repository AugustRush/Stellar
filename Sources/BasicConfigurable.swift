//
//  BasicConfigurable.swift
//  StellarDemo
//
//  Created by AugustRush on 5/28/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

public protocol BasicConfigurable: BasicChainable {
    func duration(d: CFTimeInterval) -> UIView
    func easing(type: TimingFunctionType) -> UIView
    func completion(c: () -> Void) -> UIView
    func delay(d: CFTimeInterval) -> UIView
    func autoreverses() -> UIView
}
