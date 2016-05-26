//
//  GravityViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 5/25/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class GravityViewController: UIViewController {

    
    @IBOutlet var balls: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        let point = touches.first?.locationInView(self.view)
        
        for (index,ball) in balls.enumerate() {
            let center = ball.center
            center.snapTo(point!, render: { (p) in
                ball.center = p
                }, completion: {
                    let interval = 0.1 * Double(index)
                ball.center.animateTo(center, duration: 1, delay: interval, type: .Default, autoReverse: false, repeatCount: 2, render: { (p) in
                    ball.center = p
                    }, completion: nil)
            })
        }
    }
    
    
    
}
