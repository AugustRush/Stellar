//
//  Animation.swift
//  StellarDemo
//
//  Created by AugustRush on 9/20/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

public class Animation<T: DynamicItem>: Renderable, Hashable {
    
    public var transmission: DynamicTransmission!
    public var from: T!
    public var to: T!
    public var render: ((T) -> Void)!
    public var completion: (() -> Void)?
    public lazy var hashID: String = {
       return String(self.hashValue)
    }()
    
    //MARK: Private methods
    func frameRender() -> Void {
        let progress = transmission.progress()
        let snapshot = from.snapshot(to: to, progress: progress)
        //
        if transmission.completed {
            self.render(snapshot)
            Animator.shared.removeAnimation(forKey: hashID)
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
            Animator.shared.removeAnimation(forKey: hashID)
            if let completion = self.completion {
                completion()
            }
        }
    }
    
    //MARK: Public methods
    public func start() -> Void {
        Animator.shared.addAnimation(self, forKey: hashID)
    }
    
    // Hashable protocol
    public var hashValue: Int {
        return unsafeBitCast(self, to: Int.self)
    }
    
    public static func ==(lhs: Animation<T>, rhs: Animation<T>) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

public class AnimationGroup: Renderable, Hashable {
    
    var animations: [Renderable] = Array()
    public var transmission: DynamicTransmission!
    public var completion: (() -> Void)?
    public lazy var hashID: String = {
        return String(self.hashValue)
    }()
    
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
            Animator.shared.removeAnimation(forKey: hashID)
            if let completion = self.completion {
                completion()
            }
        }
    }
    
    //MARK: Public methods
    public func start() -> Void {
        Animator.shared.addAnimation(self, forKey: hashID)
    }
    
    // Hashable protocol
    public var hashValue: Int {
        return unsafeBitCast(self, to: Int.self)
    }
    
    public static func ==(lhs: AnimationGroup, rhs: AnimationGroup) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
