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
            line.moveX(200).duration(2).easing(.SwiftOut).delay(delay).completion({ 
              line.rotateY(1.43).duration(1).autoreverses().repeatCount(1).animate()
            }).then().moveX(-200).makeColor(UIColor.greenColor()).repeatCount(1).autoreverses().duration(2).animate()
        }
        
        for (index,line) in rightLines.enumerate() {
            let delay = Double(index) * 0.2
            line.moveX(-200).duration(2).easing(.SwiftOut).delay(delay).completion({ 
              line.rotateY(1.43).duration(1).autoreverses().repeatCount(1).animate()
            }).then().moveX(200).makeColor(UIColor.purpleColor()).repeatCount(1).autoreverses().duration(2).animate()
        }


    }
}
