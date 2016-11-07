//
//  Example4ViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 6/1/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Example4ViewController: UIViewController {
    
    @IBOutlet weak var blueViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var redViewTopConsrtaint: NSLayoutConstraint!
   
    
            
    @IBAction func StartAnimation(_ sender: Any) {
        let randomW = CGFloat(arc4random() % 300)
        let randomH = CGFloat(100 + arc4random() % 400)
        
        blueViewTopConstraint.constant = randomW
        redViewTopConsrtaint.constant = randomH
        
        self.view.setNeedsLayout()
        
        // Basic
//        UIView.st_animate(withDuration: 1.0, animations: {
//            self.view.layoutIfNeeded()
//        }, completion: {
//            print("animation completion")
//        })
        
        // Spring
        UIView.st_spring(withDamping: 12.0, stiffness: 100, mass: 2, initialVelocity: 0.1, animations: {
            self.view.layoutIfNeeded()
        }, completion: {
            print("animation completion.")
        })
        
    }
}
