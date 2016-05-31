//
//  AnimationType.swift
//  StellarDemo
//
//  Created by AugustRush on 5/31/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

enum ViewAnimationSubType {
    case MoveX(CGFloat)
    case MoveY(CGFloat)
    case MoveTo(CGPoint)
    case Color(UIColor)
    case Alpha(CGFloat)
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
    //UILabel,UITextView...
    case TextColor(UIColor)
}

//temp record for animation type
internal class AnimationType {
    var mainType: ViewAnimationType
    var subType: ViewAnimationSubType
    
    init (type: ViewAnimationType, subType: ViewAnimationSubType) {
        self.mainType = type
        self.subType = subType
    }
}
