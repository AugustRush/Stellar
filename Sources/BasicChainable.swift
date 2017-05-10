//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

public protocol BasicChainable: Chainable {
    func moveX(_ increment: CGFloat) -> Self
    func moveY(_ increment: CGFloat) -> Self
    func moveTo(_ point: CGPoint) -> Self
    func makeColor(_ color: UIColor) -> Self
    func makeAlpha(_ alpha: CGFloat) -> Self
    func rotate(_ z: CGFloat) -> Self
    func rotateX(_ x: CGFloat) -> Self
    func rotateY(_ y: CGFloat) -> Self
    func rotateXY(_ xy: CGFloat) -> Self
    func makeWidth(_ width: CGFloat) -> Self
    func makeHeight(_ height: CGFloat) -> Self
    func makeSize(_ size: CGSize) -> Self
    func makeFrame(_ frame: CGRect) -> Self
    func makeBounds(_ bounds: CGRect) -> Self
    func scaleX(_ x: CGFloat) -> Self
    func scaleY(_ y: CGFloat) -> Self
    func scaleXY(_ x: CGFloat, _ y: CGFloat) -> Self
    func cornerRadius(_ radius: CGFloat) -> Self
    func borderWidth(_ width: CGFloat) -> Self
    func shadowRadius(_ radius: CGFloat) -> Self
    func zPosition(_ position: CGFloat) -> Self
    func anchorPoint(_ point: CGPoint) -> Self
    func anchorPointZ(_ z: CGFloat) -> Self
    func shadowOffset(_ offset: CGSize) -> Self
    func shadowColor(_ color: UIColor) -> Self
    func shadowOpacity(_ opacity: Float) -> Self
    func makeTintColor(_ color: UIColor) -> Self
    func completion(_ c: @escaping () -> Void) -> Self
}
