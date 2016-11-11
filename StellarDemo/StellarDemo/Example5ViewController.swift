//
//  Example5ViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 6/1/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Example5ViewController: UIViewController {

    var animation: Animation<CGPoint>!
    
    
    @IBOutlet weak var blueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let randomW = CGFloat(300)
        let randomH = CGFloat(400)
        let point = CGPoint(x: randomW, y: randomH)
        
        let transimission = BasicTransmission()
        transimission.duration = 1.0
        transimission.timingCurve = TimingFunctionType.ElasticIn.easing()
        
        animation = Animation<CGPoint>()
        animation.from = blueView.center
        animation.to = point
        animation.transmission = transimission
        animation.render = { (p) in
            self.blueView.center = p
        }
        
        animation.completion = {
            print("animation completion.")
        }
//        animation.start()

    }
    
    @IBAction func sliderValueDidChanged(_ sender: UISlider) {
        animation.frameRender(forProgress: Double(sender.value))
    }
}
