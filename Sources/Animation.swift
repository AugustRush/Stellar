//
//  Animation.swift
//  StellarDemo
//
//  Created by AugustRush on 9/20/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Animation<T: DynamicItem>: Renderable {
    
    public var transmission: DynamicTransmission!
    public var from: T!
    public var to: T!
    public var render: ((T) -> Void)!
    public var completion: (() -> Void)?
    
    //MARK: Private methods
    func frameRender() -> Void {
        let progress = transmission.progress()
        let snapshot = from.snapshot(to: to, progress: progress)
        //
        if transmission.completed {
            self.render(to)
            let identifier = String(unsafeBitCast(self, to: Int.self))
            Animator.shared.removeAnimation(forKey: identifier)
            if let completion = self.completion {
                completion()
            }
        } else {
            // frame
            self.render(snapshot)
        }
    }
    
    func frameRender(forProgress progress: Double) -> Void {
        let snapshot = from.snapshot(to: to, progress: progress)
        // frame
        self.render(snapshot)
        //
        if transmission.completed {
            let identifier = String(unsafeBitCast(self, to: Int.self))
            Animator.shared.removeAnimation(forKey: identifier)
            if let completion = self.completion {
                completion()
            }
        }
    }
}

class AnimationGroup: Renderable {
    
    var animations: [Renderable] = Array()
    public var transmission: DynamicTransmission!
    public var completion: (() -> Void)?
    
    
    func frameRender() {
        //
        let progress = transmission.progress()
        frameRender(forProgress: progress)
    }
    
    func frameRender(forProgress progress: Double) {
        for ani in animations {
            ani.frameRender(forProgress: progress)
        }
        //
        if transmission.completed {
            let identifier = String(unsafeBitCast(self, to: Int.self))
            Animator.shared.removeAnimation(forKey: identifier)
            if let completion = self.completion {
                completion()
            }
        }
    }
}
