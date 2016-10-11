//
//  Animation.swift
//  StellarDemo
//
//  Created by AugustRush on 9/20/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Animation<T: DynamicItem>: Animatable {
    public var transmission: DynamicTransmission!
    public var from: T!
    public var to: T!
    public var render: ((T) -> Void)!
    public var completion: (() -> Void)?
    
    //MARK: Private methods
    func frameRender() -> Void {
        let progress = transmission.progress()
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
    
    //MARK: Public methods
}
