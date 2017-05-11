//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

enum AnimationSubType {
    case moveX(CGFloat)
    case moveY(CGFloat)
    case moveXY(CGFloat,CGFloat)//Layer
    case moveTo(CGPoint)
    case color(UIColor)
    case alpha(CGFloat)
    case opacity(Float)//Layer
    case rotateX(CGFloat)
    case rotateY(CGFloat)
    case rotate(CGFloat)
    case rotateXY(CGFloat)
    case width(CGFloat)
    case height(CGFloat)
    case size(CGSize)
    case frame(CGRect)
    case bounds(CGRect)
    case scaleX(CGFloat)
    case scaleY(CGFloat)
    case scaleXY(CGFloat,CGFloat)
    case cornerRadius(CGFloat)
    case borderWidth(CGFloat)
    case shadowRadius(CGFloat)
    case zPosition(CGFloat)
    case anchorPoint(CGPoint)
    case anchorPointZ(CGFloat)
    case shadowOffset(CGSize)
    case shadowColor(UIColor)
    case shadowOpacity(Float)
    case tintColor(UIColor)
//    UILabel,UITextView...
    case textColor(UIColor)
}

//temp record for animation type
internal class AnimationType {
    var mainType: AnimationStyle
    var subType: AnimationSubType
    
    init (type: AnimationStyle, subType: AnimationSubType) {
        self.mainType = type
        self.subType = subType
    }
}
