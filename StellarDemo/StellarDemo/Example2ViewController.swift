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
        
//        let transimission = BasicTransmission()
//        transimission.repeatCount = 100
//        transimission.duration = 1.0
//        
//        let animation = Animation<CGSize>()
//        animation.from = CGSize(width: 100,height: 100)
//        animation.to = CGSize(width: 30,height: 30)
//        animation.transmission = transimission
//        animation.render = { (v: CGSize) in
//            print("render value is \(v)")
//        }
//        animation.start()
        
        100.0.animateTo(200, duration: 1.0, render: { (v) in
            print("value is \(v)")
            }) { 
                print("animation is completion!!!")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

