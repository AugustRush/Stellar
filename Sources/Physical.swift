//
//  Physical.swift
//  StellarDemo
//
//  Created by AugustRush on 5/17/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

protocol Physical {
    func fallTo(to: Self,render: (Self) -> Void)
    func snapTo(to: Self,render: (Self) -> Void)
    func attachmentTo(to: Self,render: (Self) -> Void)
    func pushedTo(to: Self,render: (Self) -> Void)
    func animationTo(to: Self, duration: CFTimeInterval, type: TimingFunctionType, render: (Self) -> Void, completion: ((Bool) -> Void)?)
//    func collisionWith(path: UIBezierPath,render: (Self) -> Void)
}

