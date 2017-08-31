//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

public enum AnimationStyle {
    case basic
    case snap(CGFloat)
    case attachment(CGFloat,CGFloat)
    case gravity(Double)
}

extension UIView: BasicConfigurable, SnapConfigurable, AttachmentConfigurable, GravityConfigurable, StepControllable {
    
    //MARK: animation methods
    public func moveX(_ increment: CGFloat) -> Self {
        let type = AnimationType(type: .basic, subType: .moveX(increment))
        context.addAnimationType(type)
        return self
    }
    
    public func moveY(_ increment: CGFloat) -> Self {
        let type = AnimationType(type: .basic, subType: .moveY(increment))
        context.addAnimationType(type)
        return self
    }
    
    public func moveTo(_ point: CGPoint) -> Self {
        let type = AnimationType(type: .basic, subType: .moveTo(point))
        context.addAnimationType(type)
        return self
    }
    
    public func makeColor(_ color: UIColor) -> Self {
        let type = AnimationType(type: .basic, subType: .color(color))
        context.addAnimationType(type)
        return self
    }
    
    public func makeAlpha(_ alpha: CGFloat) -> Self {
        let type = AnimationType(type: .basic, subType: .alpha(alpha))
        context.addAnimationType(type)
        return self
    }
    
    public func rotate(_ z: CGFloat) -> Self {
        let type = AnimationType(type: .basic, subType: .rotate(z))
        context.addAnimationType(type)
        return self
    }
    
    public func rotateX(_ x: CGFloat) -> Self {
        let type = AnimationType(type: .basic, subType: .rotateX(x))
        context.addAnimationType(type)
        return self
    }
    
    public func rotateY(_ y: CGFloat) -> Self {
        let type = AnimationType(type: .basic, subType: .rotateY(y))
        context.addAnimationType(type)
        return self
    }
    
    public func rotateXY(_ xy: CGFloat) -> Self {
        let type = AnimationType(type: .basic, subType: .rotateXY(xy))
        context.addAnimationType(type)
        return self
    }
    
    public func makeWidth(_ width: CGFloat) -> Self {
        let type = AnimationType(type: .basic, subType: .width(width))
        context.addAnimationType(type)
        return self
    }
    
    public func makeHeight(_ height: CGFloat) -> Self {
        let type = AnimationType(type: .basic, subType: .height(height))
        context.addAnimationType(type)
        return self
    }
    
    public func makeSize(_ size: CGSize) -> Self {
        let type = AnimationType(type: .basic, subType: .size(size))
        context.addAnimationType(type)
        return self
    }
    
    public func makeFrame(_ frame: CGRect) -> Self {
        let type = AnimationType(type: .basic, subType: .frame(frame))
        context.addAnimationType(type)
        return self
    }
    
    public func makeBounds(_ bounds: CGRect) -> Self {
        let type = AnimationType(type: .basic, subType: .bounds(bounds))
        context.addAnimationType(type)
        return self
    }
    
    public func scaleX(_ x: CGFloat) -> Self {
        let type = AnimationType(type: .basic, subType: .scaleX(x))
        context.addAnimationType(type)
        return self
    }
    
    public func scaleY(_ y: CGFloat) -> Self {
        let type = AnimationType(type: .basic, subType: .scaleY(y))
        context.addAnimationType(type)
        return self
    }
    
    public func scaleXY(_ x: CGFloat, _ y: CGFloat) -> Self {
        let type = AnimationType(type: .basic, subType: .scaleXY(x,y))
        context.addAnimationType(type)
        return self
    }
        
    public func cornerRadius(_ radius: CGFloat) -> Self {
        let type = AnimationType(type: .basic, subType: .cornerRadius(radius))
        context.addAnimationType(type)
        return self
    }
    
    public func borderWidth(_ width: CGFloat) -> Self {
        let type = AnimationType(type: .basic, subType: .borderWidth(width))
        context.addAnimationType(type)
        return self
    }
    
    public func shadowRadius(_ radius: CGFloat) -> Self {
        let type = AnimationType(type: .basic, subType: .shadowRadius(radius))
        context.addAnimationType(type)
        return self
    }
    
    public func zPosition(_ position: CGFloat) -> Self {
        let type = AnimationType(type: .basic, subType: .zPosition(position))
        context.addAnimationType(type)
        return self
    }
    
    public func anchorPoint(_ point: CGPoint) -> Self {
        let type = AnimationType(type: .basic, subType: .anchorPoint(point))
        context.addAnimationType(type)
        return self
    }
    
    public func anchorPointZ(_ z: CGFloat) -> Self {
        let type = AnimationType(type: .basic, subType: .anchorPointZ(z))
        context.addAnimationType(type)
        return self
    }
    
    public func shadowOffset(_ offset: CGSize) -> Self {
        let type = AnimationType(type: .basic, subType: .shadowOffset(offset))
        context.addAnimationType(type)
        return self
    }
    
    public func shadowColor(_ color: UIColor) -> Self {
        let type = AnimationType(type: .basic, subType: .shadowColor(color))
        context.addAnimationType(type)
        return self
    }
    
    public func shadowOpacity(_ opacity: Float) -> Self {
        let type = AnimationType(type: .basic, subType: .shadowOpacity(opacity))
        context.addAnimationType(type)
        return self
    }
    
    public func makeTintColor(_ color: UIColor) -> Self {
        let type = AnimationType(type: .basic, subType: .tintColor(color))
        context.addAnimationType(type)
        return self
    }
    
    // For UILabel UITextView
    public func makeTextColor(color: UIColor) -> Self {
        let type = AnimationType(type: .basic, subType: .textColor(color))
        context.addAnimationType(type)
        return self
    }
    
    public func completion(_ c: @escaping () -> Void) -> Self {
        context.changeCompletion(c)
        return self
    }
    
    //MARK: Physical Animation
    
    //Snap
    public func snap(_ damping: CGFloat = 0.5) -> Self {
        context.changeMainType(.snap(damping))
        return self
    }
    
    //Attachment
    public func attachment(_ damping: CGFloat = 0.5, frequency: CGFloat = 0.5) -> Self {
        context.changeMainType(.attachment(damping, frequency))
        return self
    }
    
    //Gravity
    public func gravity(_ magnitude: Double = 1.0) -> Self {
        context.changeMainType(.gravity(magnitude))
        return self
    }
    
    //MARK: Basic Animation configurations
    public func duration(_ d: CFTimeInterval) -> Self {
        context.changeDuration(d)
        return self
    }
    
    public func easing(_ type: TimingFunctionType) -> Self {
        context.changeEasing(type)
        return self
    }
    
    public func delay(_ d: CFTimeInterval) -> Self {
        context.changeDelay(d)
        return self
    }
    
    public func reverses() -> Self {
        context.changeAutoreverses(true)
        return self
    }
    
    public func repeatCount(_ count: Int) -> Self {
        context.changeRepeatCount(count)
        return self
    }
    
    //MARK: Chainable methods
    
    public func then() -> Self {
        context.makeNextStep()
        return self
    }
    
    //commit to excute
    public func animate() -> Void {
        context.commit()
    }
    
    //MARK: StepControllable methods
    
    public func cancelAllRemaining() {
        context.removeAllRemaining()
    }

    
    //Private Context for view and layer
    internal var context: AnimationContext {
        get {
            let identifier = String(describing: Unmanaged.passUnretained(self.layer).toOpaque())
            var context = self.layer.value(forKey: identifier) as? AnimationContext
            if context == nil {
                context = AnimationContext(object: self)
                self.layer.setValue(context!, forKey: identifier)
            }
            return context!
        }
    }
}

private var AnimationContextIdentifer = "#"
