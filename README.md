<img src="https://github.com/AugustRush/Stellar/blob/master/title.png">

A fantastic Physical animation library for swift(Not Just Spring !!!), it is base on UIDynamic and extension to it, friendly APIs make you use it or custom your own animation very easily!

## Support

### Features
- View's Animation
- Layer's Animation
- Chainable (every step can be observed)
- File configurable (come soon)

### Animations

- Basic
- Gravity
- Snap
- Attachment
- Push
- Collsion(come soon)

### Animatable type

- Float
- CGFloat
- Double
- CGSize
- CGPoint
- CGRect
- UIColor
- ......(Any Intrpolatable)

## On display

#### Funny demo's gif(s)
<img src="https://github.com/AugustRush/Stellar/blob/master/balls.gif" width="320">
<img src="https://github.com/AugustRush/Stellar/blob/master/layers.gif" width="320">
<img src="https://github.com/AugustRush/Stellar/blob/master/example6.gif" width="320">

#### Chainable 

1) Common</br>

<img src="https://github.com/AugustRush/Stellar/blob/master/lines.gif" width="200">

``` swift
for (index,line) in leftLines.enumerate() {
    let delay = Double(index) * 0.2
    
    line.moveX(200).duration(2).easing(.SwiftOut).delay(delay)
        .then().moveX(-200).rotateY(1.43).easing(.SwiftOut)
        .makeColor(UIColor.greenColor()).repeatCount(100)
        .autoreverses().duration(2).animate()
 }
        
 for (index,line) in rightLines.enumerate() {
    let delay = Double(index) * 0.2
    
    line.moveX(-200).duration(2).easing(.SwiftOut).delay(delay)
        .then().moveX(200).rotateY(1.43).easing(.SwiftOut)
        .makeColor(UIColor.purpleColor()).repeatCount(100)
        .autoreverses().duration(2).animate()
 }
```

2) every step completion observable </br>

<img src="https://github.com/AugustRush/Stellar/blob/master/example4.gif" width="200">

``` swift
animateView.makeSize(CGSizeMake(50, 150)).snap(0.3).completion({
                print("First step")
            })
            .then().moveX(-100).moveY(-50).anchorPoint(CGPointMake(1, 1)).duration(1).completion({
                print("Second step!")
            })
            .then().rotate(CGFloat(M_PI)).attachment(0.3, frequency: 0.8).completion({
                print("Third step!")
            })
            .then().moveY(500).completion({
                print("last step, all completion")
            })
            .animate()
```

----------
#### Snap Curve
<img src="https://github.com/AugustRush/Stellar/blob/master/snapCurve.gif">

#### Attachment Curve
<img src="https://github.com/AugustRush/Stellar/blob/master/attachmentCurve.gif">

#### Gravity Curve
<img src="https://github.com/AugustRush/Stellar/blob/master/gravityCurve.gif">

#### Push Curve
<img src="https://github.com/AugustRush/Stellar/blob/master/pushCurve.gif">

#### Basic Curve
<img src="https://github.com/AugustRush/Stellar/blob/master/basicCurve.gif">

### To do
- File configurable
- Easily Interactive Animations
- Collision
- Mutilple View/Layer performance
- More demos

### Licence

Copyright (c) 2016 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
