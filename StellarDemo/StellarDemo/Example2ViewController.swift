//
//  ViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 5/7/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Example2ViewController: UIViewController {
    
   
    @IBOutlet var balls: [UIView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.98,green: 0.98,blue: 0.98,alpha: 1.0)
        
        self.title = "Chainable"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for ball in balls {
//            let targetX = ball.center.x + 30
//            ball.center.x.animateTo(targetX, render: { (x) in
//                ball.center.x = x
//            })
//            
//            let targetY = ball.center.y + 30
//            ball.center.y.animateTo(targetY, render: { (y) in
//                ball.center.y = y
//            })
            // TimingFunction
            let random = CGFloat(arc4random() % 100)
            let size = CGSize(width: ball.bounds.size.width + random, height: ball.bounds.size.height + random)
//            ball.bounds.size.animateTo(size, duration: 1.0, timingFunction: TimingFunctionType.BounceOut, render: { (s) in
//                print("ball is \(ball) size is \(s)")
//                ball.bounds.size = s
//                }, completion: { 
//                    print("completion")
//            })
            //Custom Easing
            ball.bounds.size.animateTo(size, duration: 1.0, easing: { (t) -> Double in
                return sin(13.0 * M_PI_2 * t) * pow(2, 10 * (t - 1))
                }, render: { (s) in
                    print("ball is \(ball) size is \(s)")
                    ball.bounds.size = s
                }, completion: { 
                    print("animation completion!")
            })
        }
    }
    
    deinit {
        print("dealloc !!!")
    }
}

