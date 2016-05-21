//
//  Vectorial.swift
//  StellarDemo
//
//  Created by AugustRush on 5/21/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

protocol Vectorial {
    func convert(p: CGPoint) -> Self
    func reverse() -> CGPoint
}
