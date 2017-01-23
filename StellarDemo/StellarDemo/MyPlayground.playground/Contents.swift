
import UIKit
import PlaygroundSupport

let container = UIView(frame: CGRect.init(x: 0, y: 0, width: 600, height: 600))

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

let ball = Ball(frame: CGRect.init(x: 100, y: 100, width: 25, height: 25))
ball.backgroundColor = UIColor.cyan
container.addSubview(ball)

//ball.moveX(100).moveY(100).duration(2.5)
//    .then().makeColor(UIColor.purple)
//    .animate()

ball.moveX(100).moveY(100).delay(0.5).duration(2)
    .then().makeWidth(160).duration(2).anchorPoint(CGPoint.init(x: 0, y: 0.5))
    .then().rotate(1.5).snap(0.2)
    .then().moveY(500).gravity(100)
    .animate()

//let rotation: CGFloat = CGFloat(M_PI) * 20.0
//ball.makeSize(CGSizeMake(100, 30)).gravity()
//    .then().moveY(-100).snap(1)
//    .then().rotate(rotation).duration(2).easing(.SwiftOut).makeHeight(100).cornerRadius(50)
//    .then().moveY(100).gravity()
//    .then().moveY(-80)
//    .then().moveY(80).gravity()
//    .then().moveY(-40)
//    .then().moveY(40).gravity()
//    .then().makeWidth(120).makeHeight(30).cornerRadius(15).easing(.SwiftOut).makeColor(UIColor.brownColor())
//    .animate()

/**
 *  @brief Easing Curve
 *
 *  @param 200 move foreard
 */
//ball.moveX(200).easing(.BounceOut).delay(0.5).duration(1).animate()
//ball.moveX(200).easing(.ElasticIn).delay(0.5).duration(1).animate()
//ball.moveX(200).easing(.ElasticOut).delay(0.5).duration(1).animate()
//ball.moveX(200).easing(.Sine).delay(0.5).duration(1).animate()
//ball.moveX(200).easing(.Circ).delay(0.5).duration(1).animate()
//ball.moveX(200).easing(.ExponentialOut).delay(0.5).duration(1).animate()
//ball.moveX(200).easing(.ExponentialIn).delay(0.5).duration(1).animate()

ball.moveX(200).easing(.bounceReverse).delay(0.5).duration(3).autoreverses().animate()

PlaygroundPage.current.liveView = container

//basic curve

100.0.animate(to: 300, duration: 1, delay: 0.0, type: .custom(0.0, 1.39, 1.0, -0.55), autoreverses: false, repeatCount: 0, render: { (d) in
    let y = d
    }, completion: nil)


100.0.pushed(to: 300, render: { (d) in
    let y = d
    }, completion: nil)


100.0.snap(to: 150, damping: 0.8, render: { (d) in
    let t = d
    }, completion: nil)

100.0.attachment(to: 200, damping: 0.3, frequency: 1, render: { (d) in
    let y = d
    }, completion: nil)

//100.0.fallTo(200, magnitude: 0.6, render: { (d) in
//    let y = d
//    }, completion: nil)
