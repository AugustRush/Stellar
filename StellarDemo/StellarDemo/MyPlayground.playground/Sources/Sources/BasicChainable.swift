//
//  BasicChainable.swift
//  StellarDemo
//
//  Created by AugustRush on 5/28/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

public protocol BasicChainable: Chainable {
    func moveX(increment: CGFloat) -> UIView
    func moveY(increment: CGFloat) -> UIView
    func moveTo(point: CGPoint) -> UIView
    func makeColor(color: UIColor) -> UIView
    func makeAlpha(alpha: CGFloat) -> UIView
    func rotate(z: CGFloat) -> UIView
    func rotateX(x: CGFloat) -> UIView
    func rotateY(y: CGFloat) -> UIView
    func rotateXY(xy: CGFloat) -> UIView
    func makeWidth(width: CGFloat) -> UIView
    func makeHeight(height: CGFloat) -> UIView
    func makeSize(size: CGSize) -> UIView
    func makeFrame(frame: CGRect) -> UIView
    func makeBounds(bounds: CGRect) -> UIView
    func scaleX(x: CGFloat) -> UIView
    func scaleY(y: CGFloat) -> UIView
    func scaleXY(x: CGFloat, _ y: CGFloat) -> UIView
    func cornerRadius(radius: CGFloat) -> UIView
    func borderWidth(width: CGFloat) -> UIView
    func shadowRadius(radius: CGFloat) -> UIView
    func zPosition(position: CGFloat) -> UIView
    func anchorPoint(point: CGPoint) -> UIView
    func anchorPointZ(z: CGFloat) -> UIView
    func shadowOffset(offset: CGSize) -> UIView
    func shadowColor(color: UIColor) -> UIView
    func shadowOpacity(opacity: Float) -> UIView
    func makeTintColor(color: UIColor) -> UIView
}