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
    
    var attachment: UIAttachmentBehavior!
    var animator = UIDynamicAnimator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.98,green: 0.98,blue: 0.98,alpha: 1.0)
        
        self.title = "Chainable"
        
        let animation = Animation<Double>()
        animation.from = 100.0
        animation.to = 200.0
        animation.transmission = BasicTransmission()
        animation.start()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

