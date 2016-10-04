//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

public protocol BasicChainable: Chainable {
    func moveX(_ increment: CGFloat) -> UIView
    func moveY(_ increment: CGFloat) -> UIView
    func moveTo(_ point: CGPoint) -> UIView
    func makeColor(_ color: UIColor) -> UIView
    func makeAlpha(_ alpha: CGFloat) -> UIView
    func rotate(_ z: CGFloat) -> UIView
    func rotateX(_ x: CGFloat) -> UIView
    func rotateY(_ y: CGFloat) -> UIView
    func rotateXY(_ xy: CGFloat) -> UIView
    func makeWidth(_ width: CGFloat) -> UIView
    func makeHeight(_ height: CGFloat) -> UIView
    func makeSize(_ size: CGSize) -> UIView
    func makeFrame(_ frame: CGRect) -> UIView
    func makeBounds(_ bounds: CGRect) -> UIView
    func scaleX(_ x: CGFloat) -> UIView
    func scaleY(_ y: CGFloat) -> UIView
    func scaleXY(_ x: CGFloat, _ y: CGFloat) -> UIView
    func cornerRadius(_ radius: CGFloat) -> UIView
    func borderWidth(_ width: CGFloat) -> UIView
    func shadowRadius(_ radius: CGFloat) -> UIView
    func zPosition(_ position: CGFloat) -> UIView
    func anchorPoint(_ point: CGPoint) -> UIView
    func anchorPointZ(_ z: CGFloat) -> UIView
    func shadowOffset(_ offset: CGSize) -> UIView
    func shadowColor(_ color: UIColor) -> UIView
    func shadowOpacity(_ opacity: Float) -> UIView
    func makeTintColor(_ color: UIColor) -> UIView
    func completion(_ c: @escaping () -> Void) -> UIView
}

//CALayer
public protocol BasicChainable1: Chainable1 {
    func moveTo(_ point: CGPoint) -> CALayer
    func makeColor(_ color: UIColor) -> CALayer
    func makeOpacity(_ opacity: Float) -> CALayer
    func rotate(_ z: CGFloat) -> CALayer
    func rotateX(_ x: CGFloat) -> CALayer
    func rotateY(_ y: CGFloat) -> CALayer
    func rotateXY(_ xy: CGFloat) -> CALayer
    func makeWidth(_ width: CGFloat) -> CALayer
    func makeHeight(_ height: CGFloat) -> CALayer
    func makeSize(_ size: CGSize) -> CALayer
    func makeFrame(_ frame: CGRect) -> CALayer
    func makeBounds(_ bounds: CGRect) -> CALayer
    func scaleX(_ x: CGFloat) -> CALayer
    func scaleY(_ y: CGFloat) -> CALayer
    func scaleXY(_ x: CGFloat, _ y: CGFloat) -> CALayer
    func cornerRadius(_ radius: CGFloat) -> CALayer
    func borderWidth(_ width: CGFloat) -> CALayer
    func shadowRadius(_ radius: CGFloat) -> CALayer
    func zPosition(_ position: CGFloat) -> CALayer
    func anchorPoint(_ point: CGPoint) -> CALayer
    func anchorPointZ(_ z: CGFloat) -> CALayer
    func shadowOffset(_ offset: CGSize) -> CALayer
    func shadowColor(_ color: UIColor) -> CALayer
    func shadowOpacity(_ opacity: Float) -> CALayer
    func completion(_ c: @escaping () -> Void) -> CALayer
}
