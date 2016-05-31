//
//  UITextView+Stellar.swift
//  StellarDemo
//
//  Created by AugustRush on 5/30/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

extension UITextView {
    
    public func makeTextColor(color: UIColor) -> UIView {
        let type = AnimationType(type: .Basic, subType: .TextColor(color))
        context.addAnimationType(type)
        return self
    }
}

