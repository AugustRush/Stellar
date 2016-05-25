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
        
        for ball in balls {
            let center = ball.center
            center.attachmentTo(point!, render: { (p) in
                ball.center = p
                }, completion: {
                 ball.center.animateTo(center, render: { (p) in
                    ball.center = p
                 })
            })
        }
    }
    
    
    
}
