//
//  Example4ViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 6/1/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Example4ViewController: UIViewController {
    
    
    @IBOutlet weak var animateView: Ball!
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        
        animateView.makeSize(CGSizeMake(50, 150)).snap(0.3)
            .then().moveX(-100).moveY(-50).anchorPoint(CGPointMake(1, 1)).duration(1)
            .then().rotate(CGFloat(M_PI)).snap(0.3)
            .then().moveY(500).completion({ 
                print("all completion")
            })
            .animate()
    }
}
