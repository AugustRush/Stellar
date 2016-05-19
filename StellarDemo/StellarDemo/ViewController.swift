//
//  ViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 5/7/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var animateView: UIView!
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func button1Cliked(sender: AnyObject) {        

        var x = CGFloat(arc4random()%300)
        var y = CGFloat(arc4random()%500)
        
        print(x,y)
//        let size = CGSizeMake(x, y)
//        let point = CGPointMake(x, y)
  
        animateView.fall()
        
//        y.fallTo(x) { (f) in
//            y = f
//            print(y)
//        }
        
        
//        let x = CGFloat(arc4random()%300)
//        let y = CGFloat(arc4random()%500)
//        let item = DynamicItem()
//        
//        snap = UISnapBehavior(item: self.animateView, snapToPoint: CGPointMake(x, y))
//        snap.action = {
//            let ax = self.animateView.center.x
//            self.animateView.transform = CGAffineTransformMakeScale(1 + ax/300.0, 1 + x/300.0)
//        };
//        
//        animator = UIDynamicAnimator()
//        animator.addBehavior(snap)
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        
//        let point = touches.first?.locationInView(self.view)
//        if #available(iOS 9.0, *) {
//            snap.snapPoint = point!
//        } else {
//            // Fallback on earlier versions
//        }
    }
}

