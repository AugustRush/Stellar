//
//  DynamicItem.swift
//  StellarDemo
//
//  Created by AugustRush on 5/16/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class DynamicItem: NSObject, UIDynamicItem {
    var center: CGPoint = CGPointZero
    var bounds: CGRect {
        get {
            return CGRectMake(0, 0, 100, 100)
        }
    }
    var transform: CGAffineTransform = CGAffineTransformIdentity
}
