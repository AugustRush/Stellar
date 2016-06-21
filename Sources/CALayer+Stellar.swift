//Copyright (c) 2016
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

extension CALayer: BasicConfigurable1, SnapConfigurable1, AttachmentConfigurable1, GravityConfigurable1, StepControllable {
    
    //MARK: animation methods
    public func moveTo(point: CGPoint) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .MoveTo(point))
        context.addAnimationType(type)
        return self
    }
    
    public func makeColor(color: UIColor) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .Color(color))
        context.addAnimationType(type)
        return self
    }
    
    public func makeOpacity(opacity: Float) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .Opacity(opacity))
        context.addAnimationType(type)
        return self
    }
    
    public func rotate(z: CGFloat) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .Rotate(z))
        context.addAnimationType(type)
        return self
    }
    
    public func rotateX(x: CGFloat) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .RotateX(x))
        context.addAnimationType(type)
        return self
    }
    
    public func rotateY(y: CGFloat) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .RotateY(y))
        context.addAnimationType(type)
        return self
    }
    
    public func rotateXY(xy: CGFloat) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .RotateXY(xy))
        context.addAnimationType(type)
        return self
    }
    
    public func makeWidth(width: CGFloat) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .Width(width))
        context.addAnimationType(type)
        return self
    }
    
    public func makeHeight(height: CGFloat) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .Height(height))
        context.addAnimationType(type)
        return self
    }
    
    public func makeSize(size: CGSize) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .Size(size))
        context.addAnimationType(type)
        return self
    }
    
    public func makeFrame(frame: CGRect) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .Frame(frame))
        context.addAnimationType(type)
        return self
    }
    
    public func makeBounds(bounds: CGRect) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .Bounds(bounds))
        context.addAnimationType(type)
        return self
    }
    
    public func scaleX(x: CGFloat) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .ScaleX(x))
        context.addAnimationType(type)
        return self
    }
    
    public func scaleY(y: CGFloat) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .ScaleY(y))
        context.addAnimationType(type)
        return self
    }
    
    public func scaleXY(x: CGFloat, _ y: CGFloat) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .ScaleXY(x,y))
        context.addAnimationType(type)
        return self
    }
    
    public func cornerRadius(radius: CGFloat) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .CornerRadius(radius))
        context.addAnimationType(type)
        return self
    }
    
    public func borderWidth(width: CGFloat) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .BorderWidth(width))
        context.addAnimationType(type)
        return self
    }
    
    public func shadowRadius(radius: CGFloat) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .ShadowRadius(radius))
        context.addAnimationType(type)
        return self
    }
    
    public func zPosition(position: CGFloat) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .ZPosition(position))
        context.addAnimationType(type)
        return self
    }
    
    public func anchorPoint(point: CGPoint) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .AnchorPoint(point))
        context.addAnimationType(type)
        return self
    }
    
    public func anchorPointZ(z: CGFloat) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .AnchorPointZ(z))
        context.addAnimationType(type)
        return self
    }
    
    public func shadowOffset(offset: CGSize) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .ShadowOffset(offset))
        context.addAnimationType(type)
        return self
    }
    
    public func shadowColor(color: UIColor) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .ShadowColor(color))
        context.addAnimationType(type)
        return self
    }
    
    public func shadowOpacity(opacity: Float) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .ShadowOpacity(opacity))
        context.addAnimationType(type)
        return self
    }
    
    public func makeTintColor(color: UIColor) -> CALayer {
        let type = AnimationType(type: .Basic, subType: .TintColor(color))
        context.addAnimationType(type)
        return self
    }
    
    public func completion(c: () -> Void) -> CALayer {
        context.changeCompletion(c)
        return self
    }
    
    //MARK: Physical Animation
    
    //Snap
    public func snap(damping: CGFloat = 0.5) -> SnapConfigurable1 {
        context.changeMainType(.Snap(damping))
        return self
    }
    
    //Attachment
    public func attachment(damping: CGFloat = 0.5, frequency: CGFloat = 0.5) -> AttachmentConfigurable1 {
        context.changeMainType(.Attachment(damping, frequency))
        return self
    }
    
    //Gravity
    public func gravity(magnitude: Double = 1.0) -> GravityConfigurable1 {
        context.changeMainType(.Gravity(magnitude))
        return self
    }
    
    //MARK: Basic Animation configurations
    public func duration(d: CFTimeInterval) -> BasicConfigurable1 {
        context.changeDuration(d)
        return self
    }
    
    public func easing(type: TimingFunctionType) -> BasicConfigurable1 {
        context.changeEasing(type)
        return self
    }
    
    public func delay(d: CFTimeInterval) -> BasicConfigurable1 {
        context.changeDelay(d)
        return self
    }
    
    public func autoreverses() -> BasicConfigurable1 {
        context.changeAutoreverses(true)
        return self
    }
    
    public func repeatCount(count: Int) -> BasicConfigurable1 {
        context.changeRepeatCount(count)
        return self
    }

    //MARK: Chainable methods
    
    public func then() -> CALayer {
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
            let identifier = String(unsafeAddressOf(self))
            var context = self.valueForKey(identifier) as? AnimationContext
            if context == nil {
                context = AnimationContext(object: self)
                self.setValue(context!, forKey: identifier)
            }
            return context!
        }
    }

}
