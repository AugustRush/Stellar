//
//  Animatable.swift
//  StellarDemo
//
//  Created by AugustRush on 5/24/16.
//  Copyright © 2016 August. All rights reserved.
//

import Foundation

protocol Animatable {
    func animationTo(to: Self, duration: CFTimeInterval, type: TimingFunctionType, render: (Self) -> Void, completion: ((Bool) -> Void)?)
    func animationTo(to: Self, duration: CFTimeInterval, type: TimingFunctionType, autoReverse: Bool, render: (Self) -> Void, completion: ((Bool) -> Void)?)
    func animationTo(to: Self, duration: CFTimeInterval, type: TimingFunctionType, autoReverse: Bool, repeatCount: Int, render: (Self) -> Void, completion: ((Bool) -> Void)?)
}