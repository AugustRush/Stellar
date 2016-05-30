//
//  GravityViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 5/25/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Example1ViewController: UIViewController {

    
    @IBOutlet var balls: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.97,green: 0.97,blue: 0.97,alpha: 1.0)
        
        self.title = "Basic"
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        let point = touches.first?.locationInView(self.view)
        
        for (index,ball) in balls.enumerate() {
            let center = ball.center
            let interval = 0.1 * Double(index)
            
            center.animateTo(point!,
                             duration: 0.8,
                             delay: interval,
                             type: .SwiftOut,
                             autoreverses:  true,
                             render: { (p) in
                                
                                ball.center = p
                                
                }, completion: { (f) in
                 
                    ball.backgroundColor?.animateTo(UIColor.redColor(),
                        duration: 0.5,
                        delay: interval,
                        type: .EaseIn,
                        autoreverses: true,
                        repeatCount: 2,
                        render: { (c) in
                            
                        ball.backgroundColor = c
                    })
                    
                    ball.center.snapTo(center, damping: 0.3,render: { (c) in
                        ball.center = c
                    })
            })
        }
    }
    
}

