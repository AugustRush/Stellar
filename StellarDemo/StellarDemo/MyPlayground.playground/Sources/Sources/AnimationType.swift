//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

enum AnimationSubType {
    case MoveX(CGFloat)
    case MoveY(CGFloat)
    case MoveXY(CGFloat,CGFloat)//Layer
    case MoveTo(CGPoint)
    case Color(UIColor)
    case Alpha(CGFloat)
    case Opacity(Float)//Layer
    case RotateX(CGFloat)
    case RotateY(CGFloat)
    case Rotate(CGFloat)
    case RotateXY(CGFloat)
    case Width(CGFloat)
    case Height(CGFloat)
    case Size(CGSize)
    case Frame(CGRect)
    case Bounds(CGRect)
    case ScaleX(CGFloat)
    case ScaleY(CGFloat)
    case ScaleXY(CGFloat,CGFloat)
    case CornerRadius(CGFloat)
    case BorderWidth(CGFloat)
    case ShadowRadius(CGFloat)
    case ZPosition(CGFloat)
    case AnchorPoint(CGPoint)
    case AnchorPointZ(CGFloat)
    case ShadowOffset(CGSize)
    case ShadowColor(UIColor)
    case ShadowOpacity(Float)
    case TintColor(UIColor)
//    UILabel,UITextView...
//    case TextColor(UIColor)
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
