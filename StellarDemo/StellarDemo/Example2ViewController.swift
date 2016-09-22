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
        
        let transimission = BasicTransmission()
        transimission.repeatCount = 100
        transimission.duration = 1.0
        
        let animation = Animation<Double>()
        animation.from = 100.0
        animation.to = 210.0
        animation.transmission = transimission
        animation.render = { (v: Double) in
            print("render value is \(v)")
        }
        animation.start()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

