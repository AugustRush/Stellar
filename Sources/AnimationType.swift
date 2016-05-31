//
//  AnimationType.swift
//  StellarDemo
//
//  Created by AugustRush on 5/31/16.
//  Copyright © 2016 August. All rights reserved.
//

import Foundation

//temp record for animation type
internal class AnimationType {
    var mainType: ViewAnimationType
    var subType: ViewAnimationSubType
    
    init (type: ViewAnimationType, subType: ViewAnimationSubType) {
        self.mainType = type
        self.subType = subType
    }
}
