//
//  DynamicItem.swift
//  StellarDemo
//
//  Created by AugustRush on 9/20/16.
//  Copyright © 2016 August. All rights reserved.
//

import Foundation

public protocol DynamicItem {
    
    func snapshot(to: Self, progress: Double) -> Self
}

extension DynamicItem {
    
}
