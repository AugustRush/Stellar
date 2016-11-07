//
//  Example3ViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 5/30/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Example3ViewController: UIViewController {
    
    @IBOutlet weak var animatedView: UIView!
    
    @IBAction func startAnimation(_ sender: Any) {
        
        let randomW = CGFloat(arc4random() % 300)
        let randomH = CGFloat(100 + arc4random() % 400)
        let point = CGPoint(x: randomW, y: randomH)
        let color = UIColor(red: randomW / 300.0, green: randomH / 400.0, blue: randomH / 400.0, alpha: 1.0)
        // Basic
//        UIView.st_animate(withDuration: 1.0, animations: {
//            self.animatedView.center = point
//            self.animatedView.backgroundColor = color
//        }, completion: {
//            print("animation completion.")
//        })
        
        // Spring

        UIView.st_spring(withDamping: 5, stiffness: 150, mass: 3, initialVelocity: 0.2, animations: {
            self.animatedView.center = point
            self.animatedView.backgroundColor = color
        }, completion: {
            print("animation completion.")
        })
    }
}
