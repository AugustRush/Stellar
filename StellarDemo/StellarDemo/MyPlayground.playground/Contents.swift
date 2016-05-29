
import UIKit
import XCPlayground

let container = UIView(frame: CGRectMake(0,0,1000,400))
container.backgroundColor = UIColor(red: 0.97,green: 0.97,blue: 0.97,alpha: 1.0)

let ball = Ball(frame: CGRectMake(10,10,100,100))
ball.backgroundColor = UIColor.lightGrayColor()
container.addSubview(ball)

ball.moveX(100).duration(1).delay(0.5)
    .then().moveY(100).moveX(100).duration(0.5)
    .then().scaleXY(2, 2)
    .then().rotate(3.141592).duration(2).easing(.SwiftOut)
    .then().scaleXY(0.5, 0.5).makeColor(UIColor.redColor()).duration(1)
    .then().makeWidth(200).makeHeight(50).duration(0.5).easing(.EaseInEaseOut).moveY(-100)
    .then().anchorPoint(CGPointMake(0, 0.5)).duration(0.5)
    .then().makeWidth(100).snap(0.2)
    .animate()

XCPlaygroundPage.currentPage.liveView = container
