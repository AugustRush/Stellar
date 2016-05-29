
import UIKit
import XCPlayground

let container = UIView(frame: CGRectMake(0,0,1000,400))
let square = UIView(frame: CGRectMake(50,50,60,60))
square.backgroundColor = UIColor.redColor()
square.layer.cornerRadius = 30
container.addSubview(square)

square.moveY(100).moveX(600).duration(1).easing(.SwiftOut)
    .then().moveX(-200).duration(2).makeColor(UIColor.purpleColor()).cornerRadius(5)
    .then().moveY(-100).snap(0.1)
    .then().rotate(1).snap(0.5)
    .animate()

let number: Float = 100

number.fallTo(200,magnitude: 0.1, render: { (f) in
    let y = f
    }, completion: nil)

XCPlaygroundPage.currentPage.liveView = container
