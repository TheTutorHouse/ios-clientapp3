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
    
    init(parent: UIView, verticalOffsetFactorFromCenter offsetFactor: CGFloat = 0, lengthFactor: CGFloat, lineWidth: CGFloat = 1.0, color: UIColor = CustomColor.red){
        super.init()
        
        let length = parent.frame.width * lengthFactor
        let leftX = (parent.frame.width/2) - (length/2)
        let rightX = (parent.frame.width/2) + (length/2)
        let yVal = (parent.frame.height/2) + (offsetFactor * parent.frame.height)
        let startPoint = CGPoint(x: leftX, y: yVal)
        let endPoint = CGPoint(x: rightX, y: yVal)

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
    
    func offsetFrom(_ object: UIView, direction axis: Axis = .vertical, by offset: CGFloat, relative: Bool, parent: UIView){
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
        switch relative{
        case true:
            shiftAmount = offset * maxParentBound
        case false:
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
    
    override init() {
        super.init()
    }
}
