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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        let point = touches.first?.location(in: self.view)
        
        for (index,ball) in balls.enumerated() {
            let center = ball.center
            let interval = 0.1 * Double(index)
            
            center.animate(to: point!,
                             duration: 0.8,
                             delay: interval,
                             type: .swiftOut,
                             autoreverses:  false,
                             render: { (p) in
                                
                            ball.center = p
                                
                }, completion: { (f) in
                 
                    ball.backgroundColor?.animate(to: UIColor.red,
                        duration: 0.4,
                        delay: interval,
                        type: .easeIn,
                        autoreverses: true,
                        repeatCount: 2,
                        render: { (c) in
                            
                        ball.backgroundColor = c
                    })
            })
        }
    }
    
}

