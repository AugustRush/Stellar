//
//  Animator.swift
//  StellarDemo
//
//  Created by AugustRush on 10/11/16.
//  Copyright © 2016 August. All rights reserved.
//

import Foundation

internal class Animator {
    //MARK: Singleton
    static let shared = Animator()
    
    //MARK: Properties
    var animations: [String:Renderable] = Dictionary()
    
    private lazy var driver: DynamicDiver = {
        let driver = DynamicDiver(target: self, selector: #selector(rendering))
        driver.isPaused = true
        driver.add(to: RunLoop.main, forMode: .commonModes)
        return driver
    }()
    
    //MARK: Private methods
    @objc private func rendering() -> Void {
        for ani in animations.values {
            ani.frameRender()
        }
    }
    
    //MARK: Public methods
    func addAnimation(_ a: Renderable, forKey key: String) -> Void {
        animations.updateValue(a, forKey: key)
        //start render
        if driver.isPaused {
            driver.isPaused = false
        }
    }
    
    func removeAnimation(forKey key: String) -> Void {
        animations.removeValue(forKey: key)
        if animations.values.count == 0 {
            driver.isPaused = true
        }
    }

}
