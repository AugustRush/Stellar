//
//  Example5ViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 6/1/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Example5ViewController: UIViewController {

    @IBOutlet weak var cyanView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        let rotation: CGFloat = CGFloat(M_PI) * 20.0
        cyanView.makeSize(CGSizeMake(100, 30)).snap()
            .then().moveY(-100).snap(1)
            .then().rotate(rotation).duration(2).easing(.SwiftOut).makeHeight(100).cornerRadius(50)
            .then().moveY(100).duration(1).easing(.BounceOut)
            .then().makeWidth(120).makeHeight(30).cornerRadius(15).easing(.SwiftOut).makeColor(UIColor.brownColor())
            .animate()

    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        //will cancel all remaining animations
//        cyanView.cancelAllRemaining()
    }
}
