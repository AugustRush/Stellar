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

        let x = CGFloat(arc4random()%254) / 255.0
        let y = CGFloat(arc4random()%254) / 255.0
        let z = CGFloat(arc4random()%254) / 255.0
//
        print(x,y,z)
//        let size = CGSizeMake(x, y)
//        let point = CGPointMake(x, y)
  
//        view1.frame.pushedTo(CGRectMake(0, 0, x, y)) { (r) in
//            print("r is \(r)")
//            self.view1.frame = r
//        }
        
//        let color = UIColor(red: x,green: y,blue: z,alpha: 1)
        let color = UIColor(hue: x, saturation: y, brightness: z, alpha: 1)
        self.view1.backgroundColor?.pushedTo(color, render: { (c) in
            self.view1.backgroundColor = c
        })
        
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

