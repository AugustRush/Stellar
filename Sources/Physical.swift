//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

public protocol Physical: Interpolatable {}

extension Physical {
    public func fall(to: Self,magnitude: Double = 1.0, render: @escaping (Self) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItemGravity(from: self, to: to, render: render)
        let push = item.pushBehavior(.down)
        item.behavior = push
        item.magnitude = magnitude
        item.completion = completion
        push.commitToBasic()
    }
    
    public func snap(to: Self, damping: CGFloat = 0.5,render: @escaping (Self) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem(from: self, to: to, render: render)
        let toP = CGPoint.init(x: 0, y: CGFloat(item.referenceChangeLength))
        let snap = item.snapBehavior(toP, damping: damping)
        item.behavior = snap
        item.completion = completion
        snap.commit()
    }
    
    public func attachment(to: Self,damping: CGFloat = 0.5, frequency: CGFloat = 0.5,render: @escaping (Self) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem(from: self, to: to,render: render)
        let toP = CGPoint.init(x: 0, y: CGFloat(item.referenceChangeLength))
        let attachment = item.attachmentBehavior(toP, length: 0.0, damping: damping, frequency: frequency)
        item.behavior = attachment
        item.completion = completion
        attachment.commit()
    }
    
    public func pushed(to: Self,render: @escaping (Self) -> Void, completion: (() -> Void)? = nil) {
        let item = DynamicItem(from: self,to: to,render: render)
        let direction = CGVector(dx: item.toR.one - item.fromR.one, dy: item.toR.two - item.fromR.two)
        let push = item.pushBehavior(direction, mode: .instantaneous, magnitude: 1.0)
        item.behavior = push
        item.boundaryLimit = true
        item.completion = completion
        push.commit()
    }
    
    public func animate(to: Self, duration: CFTimeInterval = 0.25, delay: CFTimeInterval = 0.0, type: TimingFunctionType = .default, autoreverses: Bool = false, repeatCount: Int = 0, render: @escaping (Self) -> Void, completion: ((Bool) -> Void)? = nil) {
        let basicItem = DynamicItemBasic(from: self, to: to, render: render)
        let push = basicItem.pushBehavior(.down)
        basicItem.behavior = push
        basicItem.duration = duration
        basicItem.timingFunction = type.easing()
        basicItem.completion = completion
        basicItem.delay = delay
        basicItem.autoreverses = autoreverses
        push.commitToBasic()
    }
}


