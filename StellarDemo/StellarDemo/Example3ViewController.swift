//
//  Example3ViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 5/30/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Example3ViewController: UIViewController {

    @IBOutlet var leftLines: [Ball]!
    @IBOutlet var rightLines: [Ball]!
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        
        for (index,line) in leftLines.enumerate() {
            let delay = Double(index) * 0.2
            line.moveX(200).duration(2).delay(delay)
                .then().moveX(-200).makeColor(UIColor.greenColor()).easing(.Linear).repeatCount(100).autoreverses().duration(2).animate()
            line.makeWidth(80).delay(delay).duration(1).autoreverses().easing(.Linear).repeatCount(100).animate()
        }
        
        for (index,line) in rightLines.enumerate() {
            let delay = Double(index) * 0.2
            line.moveX(-200).duration(2).delay(delay)
                .then().moveX(200).makeColor(UIColor.purpleColor()).easing(.Linear).repeatCount(100).autoreverses().duration(2).animate()
            line.makeWidth(80).delay(delay).duration(1).autoreverses().easing(.Linear).repeatCount(100).animate()
        }


    }
}
