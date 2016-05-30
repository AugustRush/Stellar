
import UIKit
import XCPlayground

let container = UIView(frame: CGRectMake(0,0,600,600))

container.backgroundColor = UIColor(red: 0.97,green: 0.97,blue: 0.97,alpha: 1.0)

let ball = Ball(frame: CGRectMake(10,10,80,80))
ball.backgroundColor = UIColor.redColor()
container.addSubview(ball)

ball.moveX(100).moveY(100).duration(1).animate()

XCPlaygroundPage.currentPage.liveView = container

////basic curve
//
//100.0.animateTo(300, duration: 1, delay: 0.0, type: .SwiftOut, autoreverses: false, repeatCount: 0, render: { (d) in
//    let y = d
//    }, completion: nil)
//
//
//100.0.pushedTo(300, render: { (d) in
//    let y = d
//    }, completion: nil)
//
//
//100.0.snapTo(150, damping: 0.4, render: { (d) in
//    let t = d
//    }, completion: nil)
//
//100.0.attachmentTo(200, damping: 0.3, frequency: 1, render: { (d) in
//    let y = d
//    }, completion: nil)
//
////100.0.fallTo(200, magnitude: 0.6, render: { (d) in
////    let y = d
////    }, completion: nil)
