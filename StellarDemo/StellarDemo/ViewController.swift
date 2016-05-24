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
        // Dispose of any resources that can be recreated.
    }


    @IBAction func button1Cliked(sender: AnyObject) {        

        let x = CGFloat(arc4random()%300)
        let y = CGFloat(arc4random()%500)
        let z = CGFloat(arc4random()%254)

//        view1.center.y.animationTo(x, duration: 1, type: .SwiftOut, render: { (f) in
//            self.view1.center.y = f
//            
//            }) { (completion) in
//                self.view2.center.y.animationTo(y, duration: 1, type: .SwiftOut, render: { (f) in
//                    self.view2.center.y = f
//                    }, completion: { (completion) in
//                        self.view3.center.y.animationTo(z, duration: 1, type: .SwiftOut, render: { (f) in
//                            self.view3.center.y = f
//                            }, completion: { (c) in
//                                print("all completion")
//                        })
//                })
//        }

        
        view1.bounds.size.animationTo(CGSizeMake(x, y), duration: 1, type: .SwiftOut, autoReverse: true,repeatCount: 2, render: { (size) in
            self.view1.bounds.size = size
            }) { (c) in
                print("completion")
        }
        
        
        view2.center.animationTo(CGPointMake(x, y), duration: 1, type: .Default, autoReverse: false, repeatCount: 2, render: { (p) in
            self.view2.center = p
            }) { (c) in
                print("completion 2")
        }
        
        view3.backgroundColor?.animationTo(UIColor.purpleColor(), duration: 1, type: .SwiftOut, autoReverse: true, repeatCount: 2, render: { (color) in
            self.view3.backgroundColor = color
            }, completion: { (completion) in
                print("completion 3")
        })
    
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        
    }
}

