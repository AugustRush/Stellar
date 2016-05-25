//
//  ViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 5/7/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var button1: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func button1Cliked(sender: AnyObject) {        
//        let gravity = view1.gravityBehavior()
//        let collision = view1.collisionBehavior(path: UIBezierPath(rect: self.view.bounds))
//        AnimatorCoordinator.shared.addBehaviors([gravity,collision])
//        
//        let size = CGSizeMake(100, 200)
//        self.view1.bounds.size = size
//        view1.bounds.size.animationTo(size, duration: 0.3, type: .SwiftOut, render: { (s) in
//            self.view1.bounds.size = s
//            }) { (c) in
//                print(c)
//        }
        
        let x = CGFloat(arc4random() % 300)
        let y = CGFloat(arc4random() % 500)
        
        self.view1.bounds.size.snapTo(CGSizeMake(x, y), render: { (s) in
            self.view1.bounds.size = s
            }) { 
                self.view2.center.snapTo(CGPointMake(x, y), render: {(p) in
                    print(p)
                    self.view2.center = p
                    }, completion: {
                        
                        CGFloat(0).snapTo(4, render: { (r) in
                            self.view3.transform = CGAffineTransformMakeRotation(r)
                            }, completion: {
                                print("all completion")
                        })
                })
        }
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        
    }
}

