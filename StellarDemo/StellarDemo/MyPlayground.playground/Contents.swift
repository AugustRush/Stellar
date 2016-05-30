
import UIKit
import XCPlayground

let container = UIView(frame: CGRectMake(0,0,2000,400))
container.backgroundColor = UIColor(red: 0.97,green: 0.97,blue: 0.97,alpha: 1.0)

let ball = Ball(frame: CGRectMake(10,10,100,100))
ball.backgroundColor = UIColor.lightGrayColor()
container.addSubview(ball)

ball.moveX(100).snap().moveY(100).snap()
    .then().makeColor(UIColor.blackColor()).duration(2).moveX(100).duration(1)
    .animate()

XCPlaygroundPage.currentPage.liveView = container
