
import UIKit
import XCPlayground

let container = UIView(frame: CGRectMake(0,0,1000,400))
let square = UIView(frame: CGRectMake(50,50,60,60))
square.backgroundColor = UIColor.redColor()
square.layer.cornerRadius = 30
container.addSubview(square)

square.moveY(200).moveX(600).duration(1).easing(.SwiftOut)
    .then().moveX(-200).duration(2).makeColor(UIColor.purpleColor()).cornerRadius(5)
    .then().moveY(-200).snap(0.1)
    .then().rotate(1).snap(0.5)
    .animate()

var x: Float = 100
x.attachmentTo(350, render: { (f) in
    let y = f
})

let number: Float = 100


XCPlaygroundPage.currentPage.liveView = container
