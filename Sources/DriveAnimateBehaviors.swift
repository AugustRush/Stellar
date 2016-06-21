//
//  DriveAnimateBehaviors.swift
//  StellarDemo
//
//  Created by AugustRush on 6/21/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

protocol DriveAnimateBehaviors: class {
    func behavior(forType type: AnimationType, step: AnimationStep) -> UIDynamicBehavior
}
