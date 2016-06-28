//
//  Example6ViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 6/1/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Example6ViewController: UIViewController {

    //should be have more easily APIs to do
    
    @IBOutlet var views: [UIView]!
    var centerItems: [DynamicItemBasic<CGPoint>] = Array()
    var colorItems: [DynamicItemBasic<UIColor>] = Array()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for view in views {
            let basic = DynamicItemBasic(from: view.center,to: CGPointMake(160, 200), render: { (p) in
                view.center = p
            })
            basic.duration = 1.0
            basic.speed = 0.0
            basic.timingFunction = TimingFunctionType.SwiftOut.easing()
            centerItems.append(basic)
            
            let color = view.backgroundColor!
            let basic1 = DynamicItemBasic(from: color, to: UIColor.redColor(), render: { (c) in
                view.backgroundColor = c
            })
            basic1.duration = 1.0
            basic1.speed = 0.0
            basic1.timingFunction = TimingFunctionType.SwiftOut.easing()
            colorItems.append(basic1)

        }
        
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let offset = Double(sender.value)
        for item in centerItems {
            item.timeOffset = offset
        }
        
        for item in colorItems {
            item.timeOffset = offset
        }
    }
   
}
