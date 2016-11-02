//
//  ViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 5/7/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Example2ViewController: UIViewController {
    
   
    @IBOutlet var balls: [UIView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.98,green: 0.98,blue: 0.98,alpha: 1.0)
        
        self.title = "Chainable"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for ball in balls {
            let random = CGFloat(arc4random() % 100)
            let size = CGSize(width: ball.bounds.size.width + random, height: ball.bounds.size.height + random)
            
            UIView.st_animate(withDuration: 1.0, delay: 0.0, animations: { 
                ball.bounds.size = size
                ball.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
            })
        }
    }
    
    deinit {
        print("dealloc !!!")
    }
}

