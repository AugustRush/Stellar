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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        let rotation: CGFloat = .pi * 20.0
        cyanView.makeSize(CGSize(width: 100, height: 30)).snap()
            .then().moveY(-100).snap(1)
            .then().rotate(rotation)
                   .duration(2)
                   .easing(.swiftOut)
                   .makeHeight(100)
                   .cornerRadius(50)
            .then().moveY(100).gravity()
            .then().moveY(-80)
            .then().moveY(80).gravity()
            .then().moveY(-40)
            .then().moveY(40).gravity()
            .then().makeWidth(120)
                   .makeHeight(30)
                   .cornerRadius(15)
                   .easing(.swiftOut)
                   .makeColor(UIColor.brown)
            .animate()
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        //will cancel all remaining animations
//        cyanView.cancelAllRemaining()
    }
}
