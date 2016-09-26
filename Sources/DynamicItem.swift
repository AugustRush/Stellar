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
    
    func animateTo(_ to: Self, duration: CFTimeInterval, timingFunction: TimingFunctionType = .Default, render: @escaping (Self) -> Void, completion: @escaping () -> Void) -> Void {
        let transimission = BasicTransmission()
        transimission.timingCurve = timingFunction.easing()
        transimission.duration = duration
        
        let animation = Animation<Self>()
        animation.from = self
        animation.to = to
        animation.transmission = transimission
        animation.render = render
        animation.completion = completion
        animation.start()
    }
}
