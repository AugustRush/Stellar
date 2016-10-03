//
//  LiquidView.swift
//  StellarDemo
//
//  Created by AugustRush on 6/3/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class LiquidView: UIView {

    override class func layerClass() -> AnyClass {
        return CAShapeLayer.self
    }
    
}
