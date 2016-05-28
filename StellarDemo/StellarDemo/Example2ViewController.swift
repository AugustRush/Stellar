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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        for (index, ball) in balls.enumerate() {
            let move = CGFloat(-20 + index * 20)
            let opacity = Float(1 - 0.2 * CGFloat(index))
            ball.makeColor(UIColor.blackColor()).autoreverses()
                .then().shadowOpacity(opacity).shadowOffset(CGSizeMake(20 - CGFloat(index) * 5, 20 - CGFloat(index) * 5)).shadowRadius(5).moveX(-move).moveY(-move).shadowColor(UIColor.grayColor()).duration(2)
                .then().moveY(move).moveX(move).shadowOpacity(0).shadowOffset(CGSizeZero).shadowColor(UIColor.clearColor()).duration(1).animate()
            
        }
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        
    }
    
    
}

