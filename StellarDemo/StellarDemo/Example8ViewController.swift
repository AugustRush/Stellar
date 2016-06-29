//
//  Example8ViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 6/29/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Example8ViewController: UIViewController {
    @IBOutlet weak var animateView: Ball!
    
    @IBAction func segment1ValueChanged(sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex;
        
        switch index {
        case 0:
            animateView.moveX(200).duration(1.0).easing(.Default).autoreverses().animate()
        case 1:
            animateView.moveX(200).duration(1.0).easing(.EaseIn).autoreverses().animate()
        case 2:
            animateView.moveX(200).duration(1.0).easing(.EaseOut).autoreverses().animate()
        case 3:
            animateView.moveX(200).duration(1.0).easing(.EaseInEaseOut).autoreverses().animate()
        default:
            print("")
        }
        
    }
    @IBAction func segment2ValueChanged(sender: UISegmentedControl) {
        animateView.frame = CGRect(x: 20,y: 120,width: 40,height: 40)
        let index = sender.selectedSegmentIndex;
        
        switch index {
        case 0:
            animateView.moveX(200).duration(1.0).easing(.Linear).autoreverses().animate()
        case 1:
            animateView.moveX(200).duration(1.0).easing(.SwiftOut).autoreverses().animate()
        case 2:
            animateView.moveX(200).duration(1.0).easing(.BackEaseIn).autoreverses().animate()
        case 3:
            animateView.moveX(200).duration(1.0).easing(.BackEaseOut).autoreverses().animate()
        default:
            print("")
        }

    }
    @IBAction func segment3ValueChanged(sender: UISegmentedControl) {
        animateView.frame = CGRect(x: 20,y: 120,width: 40,height: 40)
        let index = sender.selectedSegmentIndex;
        
        switch index {
        case 0:
            animateView.moveX(200).duration(1.0).easing(.BackEaseInOut).autoreverses().animate()
        case 1:
            animateView.moveX(200).duration(1.0).easing(.BounceOut).autoreverses().animate()
        case 2:
            animateView.moveX(200).duration(1.0).easing(.Sine).autoreverses().animate()
        case 3:
            animateView.moveX(200).duration(1.0).easing(.Circ).autoreverses().animate()
        default:
            print("")
        }

    }
    
    @IBAction func segment4ValueChanged(sender: UISegmentedControl) {
        animateView.frame = CGRect(x: 20,y: 120,width: 40,height: 40)
        let index = sender.selectedSegmentIndex;
        
        switch index {
        case 0:
            animateView.moveX(200).duration(1.0).easing(.ExponentialIn).autoreverses().animate()
        case 1:
            animateView.moveX(200).duration(1.0).easing(.ExponentialOut).autoreverses().animate()
        case 2:
            animateView.moveX(200).duration(1.0).easing(.ElasticIn).autoreverses().animate()
        case 3:
            animateView.moveX(200).duration(1.0).easing(.ElasticOut).autoreverses().animate()
        default:
            print("")
        }
        
    }
    
    @IBAction func segment5ValueChanged(sender: UISegmentedControl) {
        animateView.frame = CGRect(x: 20,y: 120,width: 40,height: 40)
        let index = sender.selectedSegmentIndex;
        
        switch index {
        case 0:
            animateView.moveX(200).duration(1.0).easing(.BounceReverse).autoreverses().animate()
        case 1:
            fallthrough
        case 2:
            fallthrough
        case 3:
            fallthrough
        default:
            print("")
        }
        
    }
}
