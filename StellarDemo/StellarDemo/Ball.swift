//
//  Ball.swift
//  StellarDemo
//
//  Created by AugustRush on 5/26/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

@IBDesignable
class Ball: UIView {

    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
}
