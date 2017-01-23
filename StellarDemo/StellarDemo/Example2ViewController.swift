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

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        for (index, ball) in balls.enumerated() {
            let move = CGFloat(-20 + index * 20)
            let opacity = Float(1 - 0.2 * CGFloat(index))
            let size = CGSize(width: 20 - CGFloat(index) * 5, height: 20 - CGFloat(index) * 5)
            ball.shadowOpacity(opacity).shadowOffset(size).shadowRadius(5).moveX(-move).moveY(-move).shadowColor(UIColor.gray).duration(2).easing(.bounceOut)
                .then().moveY(move).moveX(move).shadowOpacity(0).shadowOffset(CGSize.zero).shadowColor(UIColor.clear).duration(1).easing(.bounceOut)
                .completion({
                    print("all completion")
                }).animate()
        }
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
    }
    
    
}

