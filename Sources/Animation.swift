//
//  Animation.swift
//  StellarDemo
//
//  Created by AugustRush on 9/20/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Animation<T: DynamicItem> {
    public var transmission: DynamicTransmission!
    public var from: T!
    public var to: T!
    private lazy var driver: DynamicDiver = {
        let driver = DynamicDiver(target: self, selector: #selector(frameRender))
        driver.isPaused = true
        driver.add(to: RunLoop.main, forMode: .commonModes)
        return driver
    }()
    private lazy var beginTime: CFTimeInterval = {
        return CACurrentMediaTime()
    }()
    
    
    init() {
        driver = DynamicDiver(target: self, selector: #selector(frameRender))
        driver.isPaused = true
        driver.add(to: RunLoop.main, forMode: .commonModes)
    }
    
    //MARK: Private methods
    @objc private func frameRender() -> Void {
        print("render")
    }
    
    //MARK: Public methods
    
    func start() -> Void {
        driver.isPaused = false
    }
    
    func pause() -> Void {
        driver.isPaused = true
    }
    
    func remove() -> Void {
        driver.remove(from: RunLoop.main, forMode: .commonModes)
    }
    
}
