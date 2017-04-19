//
//  CustomLine.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class HorizontalLine: CAShapeLayer{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    enum Section{
        case left, right
    }
    
    init(parent: UIView, verticalOffsetFactorFromCenter offsetFactor: CGFloat = 0, lengthFactor: CGFloat, lineWidth: CGFloat = 1.0, color: UIColor = CustomColor.red, partialSection: Section? = nil){
        super.init()
        
        let length = parent.frame.width * lengthFactor
        let leftX = (parent.frame.width/2) - (length/2)
        let rightX = (parent.frame.width/2) + (length/2)
        let yVal = (parent.frame.height/2) + (offsetFactor * parent.frame.height)
        
        var startPoint = CGPoint(x: leftX, y: yVal)
        var endPoint = CGPoint(x: rightX, y: yVal)
        
        if let partialSection = partialSection{
            switch partialSection{
            case .left:
                startPoint = CGPoint(x: (length/2), y: yVal)
                endPoint = CGPoint(x: leftX, y: yVal)
            case .right:
                startPoint = CGPoint(x: (length/2), y: yVal)
                endPoint = CGPoint(x: rightX, y: yVal)
            }
        }

        let pathDrawer = UIBezierPath()
        pathDrawer.move(to: startPoint)
        pathDrawer.addLine(to: endPoint)
        pathDrawer.close()
        
        self.path = pathDrawer.cgPath
        self.strokeColor = color.cgColor
        self.lineWidth = lineWidth
        self.lineJoin = kCALineJoinBevel
    }
    
    enum Axis{
        case vertical
    }
    
    enum TransformMode{
        case relative, absolute
    }
    
    func animate(duration: CFTimeInterval, delay: CFTimeInterval, completionAction: ()?){
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            completionAction
        })
        self.opacity = 1
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = duration
        pathAnimation.fromValue = 0
        pathAnimation.toValue = 1.0
        pathAnimation.timingFunction = CAMediaTimingFunction.init(controlPoints: 0.65, 0.00, 0.35, 1)
        self.add(pathAnimation, forKey: nil)
        CATransaction.commit()
    }
    
    func offsetFrom(_ object: UIView, direction axis: Axis = .vertical, by offset: CGFloat, mode: TransformMode, parent: UIView){
        var maxParentBound: CGFloat
        var maxObjectBound: CGFloat
        var maxSelfBound: CGFloat
        var targetPosition: CGFloat
        
        switch  axis {
        case .vertical:
            maxParentBound = parent.frame.height
            maxSelfBound = self.frame.height
            maxObjectBound = object.frame.height
            targetPosition = object.center.y
        }
        
        var shiftAmount: CGFloat
        switch mode{
        case .relative:
            shiftAmount = offset * maxParentBound
        case .absolute:
            shiftAmount = offset
        }
        
        let totalSpacing = maxSelfBound/2 + abs(shiftAmount) + maxObjectBound/2
        switch axis{
        case .vertical:
            if shiftAmount > 0{
                self.position = CGPoint(x: self.position.x, y: (targetPosition - maxParentBound/2) + totalSpacing)
            }
            else if shiftAmount < 0 {
                self.position = CGPoint(x: self.position.x, y: (targetPosition - maxParentBound/2) - totalSpacing)
            }
        }
    }
    
    func hide(){
        self.opacity = 0
    }
    
    func show(){
        self.opacity = 1
    }
    
    override init() {
        super.init()
    }
}
