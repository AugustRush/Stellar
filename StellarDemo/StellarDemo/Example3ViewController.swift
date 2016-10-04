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
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        for (index,line) in leftLines.enumerated() {
            let delay = Double(index) * 0.2
            line.moveX(200).duration(2).delay(delay)
                .then().moveX(-200).makeColor(UIColor.green).easing(.linear).repeatCount(100).autoreverses().duration(2).animate()
            line.makeWidth(80).delay(delay).duration(1).autoreverses().easing(.linear).repeatCount(100).animate()
        }
        
        for (index,line) in rightLines.enumerated() {
            let delay = Double(index) * 0.2
            line.moveX(-200).duration(2).delay(delay)
                .then().moveX(200).makeColor(UIColor.purple).easing(.linear).repeatCount(100).autoreverses().duration(2).animate()
            line.makeWidth(80).delay(delay).duration(1).autoreverses().easing(.linear).repeatCount(100).animate()
        }


    }
}
