//
//  DynamicAnimator.swift
//  StellarDemo
//
//  Created by AugustRush on 5/25/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class DynamicAnimator: UIDynamicAnimator {
    var completion: (() -> Void)?
    
    deinit {
        completion?()
    }
}
