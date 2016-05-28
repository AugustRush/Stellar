//
//  Chainable.swift
//  StellarDemo
//
//  Created by AugustRush on 5/28/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

public protocol Chainable {
    //Chainable methods
    func then() -> UIView
    func animate() -> Void
}
