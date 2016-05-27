//
//  ViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 5/7/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Example2ViewController: UIViewController {
    
    @IBOutlet weak var interactionView: UIView!
    
    var attachment: UIAttachmentBehavior!
    var animator = UIDynamicAnimator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.98,green: 0.98,blue: 0.98,alpha: 1.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)

        interactionView.duration(1).shadowOffset(CGSizeMake(10, 10)).shadowColor(UIColor.blueColor()).shadowRadius(8).shadowOpacity(0.8)
        .then().rotateX(CGFloat(M_PI_4)).moveX(-100).moveY(-100).duration(2)
        .then().makeColor(UIColor.purpleColor()).autoreverses(true).moveX(100)
        .then().moveY(200).duration(1).easing(.SwiftOut).animate()
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
    }
}

