//
//  ViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 5/7/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Example2ViewController: UIViewController {
    
    @IBOutlet weak var animatedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.98,green: 0.98,blue: 0.98,alpha: 1.0)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func startAnimation(_ sender: Any) {
        
        let randomW = CGFloat(arc4random() % 300)
        let randomH = CGFloat(100 + arc4random() % 400)
        let point = CGPoint(x: randomW, y: randomH)
        
        // 1
        
//        let transimission = SpringTransmission()
//        transimission.stiffness = 200
//        transimission.mass = 2.0
//        transimission.initialVelocity = 0.3
//        
//        let animation = Animation<CGPoint>()
//        animation.from = animatedView.center
//        animation.to = point
//        animation.transmission = transimission
//        animation.render = { (p) in
//            self.animatedView.center = p
//        }
//        
//        animation.completion = {
//            print("animation completion.")
//        }
//        animation.start()
        
        // 2
        
        animatedView.center.springTo(point, damping: 8.0, stiffness: 200, mass: 1.0, initialVelocity: 0.5, render: { (p) in
            self.animatedView.center = p
        }, completion: {
            print("animation completion")
        })
        

    }
    
    deinit {
        print("dealloc !!!")
    }
}

