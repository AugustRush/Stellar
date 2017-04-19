//
//  Example4ViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 6/1/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Example4ViewController: UIViewController {
    
    
    @IBOutlet weak var animateView: Ball!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        animateView.makeSize(CGSize(width: 50, height: 150)).snap(0.3).completion({
                print("First step")
            })
            .then().moveX(-100).moveY(-50).anchorPoint(CGPoint(x: 1, y: 1)).duration(1).completion({
                print("Second step!")
            })
            .then().rotate(.pi).attachment(0.3, frequency: 0.8).completion({
                print("Third step!")
            })
            .then().moveY(500).gravity().completion({
                print("last step, all completion")
            })
            .animate()
    }
}
