
import UIKit
import XCPlayground

let container = UIView(frame: CGRectMake(0,0,600,600))

container.backgroundColor = UIColor(red: 0.97,green: 0.97,blue: 0.97,alpha: 1.0)

//var balls: [Ball] = Array()
//for i in 0...5 {
//    let ball = Ball(frame: CGRectMake(10,10 + 60 * CGFloat(i),50,50))
//    ball.backgroundColor = UIColor.redColor()
//    container.addSubview(ball)
//    balls.append(ball)
//    
//    ball.moveX(200).duration(2)
//        .delay(Double(i) * 0.1).repeatCount(1)
//        .autoreverses()
//        .animate()
//    
//    ball.makeWidth(200).duration(2).autoreverses().animate()
//}

let ball = Ball(frame: CGRectMake(100,100,50,50))
ball.backgroundColor = UIColor.cyanColor()
container.addSubview(ball)

//ball.moveX(100).moveY(100).delay(0.5).duration(1)
//    .then().makeWidth(160).duration(2).anchorPoint(CGPointMake(0, 0.5))
//    .then().rotate(1.5).snap(0.5)
//    .then().moveY(500).gravity(100)
//    .animate()



XCPlaygroundPage.currentPage.liveView = container

//basic curve

100.0.animateTo(300, duration: 1, delay: 0.0, type: .Custom(0.0, 1.39, 1.0, -0.55), autoreverses: false, repeatCount: 0, render: { (d) in
    let y = d
    }, completion: nil)


100.0.pushedTo(300, render: { (d) in
    let y = d
    }, completion: nil)


100.0.snapTo(150, damping: 0.4, render: { (d) in
    let t = d
    }, completion: nil)

100.0.attachmentTo(200, damping: 0.3, frequency: 1, render: { (d) in
    let y = d
    }, completion: nil)

//100.0.fallTo(200, magnitude: 0.6, render: { (d) in
//    let y = d
//    }, completion: nil)
