//
//  Animatable.swift
//  StellarDemo
//
//  Created by AugustRush on 10/11/16.
//  Copyright © 2016 August. All rights reserved.
//

import Foundation

internal protocol Renderable {
    func frameRender() -> Void
    func frameRender(forProgress progress: Double) -> Void
}
