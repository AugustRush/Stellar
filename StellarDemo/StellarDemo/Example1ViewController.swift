//
//  GravityViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 5/25/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Example1ViewController: UIViewController {

    
    @IBOutlet weak var animatedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.97,green: 0.97,blue: 0.97,alpha: 1.0)
        
        self.title = "Basic"
    }
    
    @IBAction func startAnimation(_ sender: Any) {
        let randomW = CGFloat(arc4random() % 300)
        let randomH = CGFloat(arc4random() % 200)
        let size = CGSize(width: randomW, height: randomH)

        // 1
        
//        let transimission = BasicTransmission()
//        transimission.duration = 1.0
//        transimission.repeatCount = 2
//        transimission.autoreverses = true
//        transimission.timingCurve = TimingFunctionType.SwiftOut.easing()
//        
//        let animation = Animation<CGSize>()
//        animation.from = animatedView.bounds.size
//        animation.to = size
//        animation.transmission = transimission
//        animation.render = { (s) in
//            self.animatedView.bounds.size = s
//            print("size is \(s), \(size)")
//        }
//        
//        animation.completion = {
//            print("animation completion.")
//        }
//        animation.start()
        
//        // 2
        animatedView.bounds.size.animateTo(size, duration: 1.0, timingFunction: .SwiftOut, autoreverses: true, repeatCount: 2, render: { (size) in
            
            self.animatedView.bounds.size = size
        }, completion: {
            print("animation completion.")
        })
        
    }
}

