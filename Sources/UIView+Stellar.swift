//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

public enum AnimationStyle {
    case Basic
    case Snap(CGFloat)
    case Attachment(CGFloat,CGFloat)
    case Gravity(Double)
}

extension UIView: BasicConfigurable, SnapConfigurable, AttachmentConfigurable, GravityConfigurable, StepControllable {
    
    //MARK: animation methods
    public func moveX(increment: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .MoveX(increment))
        context.addAnimationType(type)
        return self
    }
    
    public func moveY(increment: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .MoveY(increment))
        context.addAnimationType(type)
        return self
    }
    
    public func moveTo(point: CGPoint) -> UIView {
        let type = AnimationType(type: .Basic, subType: .MoveTo(point))
        context.addAnimationType(type)
        return self
    }
    
    public func makeColor(color: UIColor) -> UIView {
        let type = AnimationType(type: .Basic, subType: .Color(color))
        context.addAnimationType(type)
        return self
    }
    
    public func makeAlpha(alpha: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .Alpha(alpha))
        context.addAnimationType(type)
        return self
    }
    
    public func rotate(z: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .Rotate(z))
        context.addAnimationType(type)
        return self
    }
    
    public func rotateX(x: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .RotateX(x))
        context.addAnimationType(type)
        return self
    }
    
    public func rotateY(y: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .RotateY(y))
        context.addAnimationType(type)
        return self
    }
    
    public func rotateXY(xy: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .RotateXY(xy))
        context.addAnimationType(type)
        return self
    }
    
    public func makeWidth(width: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .Width(width))
        context.addAnimationType(type)
        return self
    }
    
    public func makeHeight(height: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .Height(height))
        context.addAnimationType(type)
        return self
    }
    
    public func makeSize(size: CGSize) -> UIView {
        let type = AnimationType(type: .Basic, subType: .Size(size))
        context.addAnimationType(type)
        return self
    }
    
    public func makeFrame(frame: CGRect) -> UIView {
        let type = AnimationType(type: .Basic, subType: .Frame(frame))
        context.addAnimationType(type)
        return self
    }
    
    public func makeBounds(bounds: CGRect) -> UIView {
        let type = AnimationType(type: .Basic, subType: .Bounds(bounds))
        context.addAnimationType(type)
        return self
    }
    
    public func scaleX(x: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .ScaleX(x))
        context.addAnimationType(type)
        return self
    }
    
    public func scaleY(y: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .ScaleY(y))
        context.addAnimationType(type)
        return self
    }
    
    public func scaleXY(x: CGFloat, _ y: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .ScaleXY(x,y))
        context.addAnimationType(type)
        return self
    }
        
    public func cornerRadius(radius: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .CornerRadius(radius))
        context.addAnimationType(type)
        return self
    }
    
    public func borderWidth(width: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .BorderWidth(width))
        context.addAnimationType(type)
        return self
    }
    
    public func shadowRadius(radius: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .ShadowRadius(radius))
        context.addAnimationType(type)
        return self
    }
    
    public func zPosition(position: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .ZPosition(position))
        context.addAnimationType(type)
        return self
    }
    
    public func anchorPoint(point: CGPoint) -> UIView {
        let type = AnimationType(type: .Basic, subType: .AnchorPoint(point))
        context.addAnimationType(type)
        return self
    }
    
    public func anchorPointZ(z: CGFloat) -> UIView {
        let type = AnimationType(type: .Basic, subType: .AnchorPointZ(z))
        context.addAnimationType(type)
        return self
    }
    
    public func shadowOffset(offset: CGSize) -> UIView {
        let type = AnimationType(type: .Basic, subType: .ShadowOffset(offset))
        context.addAnimationType(type)
        return self
    }
    
    public func shadowColor(color: UIColor) -> UIView {
        let type = AnimationType(type: .Basic, subType: .ShadowColor(color))
        context.addAnimationType(type)
        return self
    }
    
    public func shadowOpacity(opacity: Float) -> UIView {
        let type = AnimationType(type: .Basic, subType: .ShadowOpacity(opacity))
        context.addAnimationType(type)
        return self
    }
    
    public func makeTintColor(color: UIColor) -> UIView {
        let type = AnimationType(type: .Basic, subType: .TintColor(color))
        context.addAnimationType(type)
        return self
    }
    
    public func completion(c: () -> Void) -> UIView {
        context.changeCompletion(c)
        return self
    }
    
    //MARK: Physical Animation
    
    //Snap
    public func snap(damping: CGFloat = 0.5) -> SnapConfigurable {
        context.changeMainType(.Snap(damping))
        return self
    }
    
    //Attachment
    public func attachment(damping: CGFloat = 0.5, frequency: CGFloat = 0.5) -> AttachmentConfigurable {
        context.changeMainType(.Attachment(damping, frequency))
        return self
    }
    
    //Gravity
    public func gravity(magnitude: Double = 1.0) -> GravityConfigurable {
        context.changeMainType(.Gravity(magnitude))
        return self
    }
    
    //MARK: Basic Animation configurations
    public func duration(d: CFTimeInterval) -> BasicConfigurable {
        context.changeDuration(d)
        return self
    }
    
    public func easing(type: TimingFunctionType) -> BasicConfigurable {
        context.changeEasing(type)
        return self
    }
    
    public func delay(d: CFTimeInterval) -> BasicConfigurable {
        context.changeDelay(d)
        return self
    }
    
    public func autoreverses() -> BasicConfigurable {
        context.changeAutoreverses(true)
        return self
    }
    
    public func repeatCount(count: Int) -> BasicConfigurable {
        context.changeRepeatCount(count)
        return self
    }
    
    //MARK: Chainable methods
    
    public func then() -> UIView {
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
    private var context: AnimationContext {
        get {
            let identifier = String(unsafeAddressOf(self.layer))
            var context = self.layer.valueForKey(identifier) as? AnimationContext
            if context == nil {
                context = AnimationContext(object: self)
                self.layer.setValue(context!, forKey: identifier)
            }
            return context!
        }
    }
}

private var AnimationContextIdentifer = "#"
