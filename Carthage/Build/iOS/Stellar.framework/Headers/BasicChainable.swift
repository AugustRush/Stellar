//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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
    func completion(c: () -> Void) -> UIView
}