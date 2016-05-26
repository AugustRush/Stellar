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
        
        let center = interactionView.center
        attachment = interactionView.attachmentBehavior(center)
        attachment.action = {
            let c = self.interactionView.center
            self.interactionView.transform = CGAffineTransformMakeScale(c.x / 200, c.x / 200)
        }
        animator.addBehavior(attachment)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        
        let point = touches.first?.locationInView(self.view)
        
            attachment.anchorPoint = point!
       
    }
}

