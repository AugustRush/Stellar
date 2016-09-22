//
//  Chainable.swift
//  StellarDemo
//
//  Created by AugustRush on 9/22/16.
//  Copyright © 2016 August. All rights reserved.
//

import Foundation

protocol Chainable {
    func then() -> Chainable
    func animate() -> Void
}
