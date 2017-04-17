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
    
    init(parent: UIView, verticalOffsetFactorFromCenter offsetFactor: CGFloat = 0, lengthFactor: CGFloat, lineWidth: CGFloat = 1.0, color: UIColor = FillColor.red){
        super.init()
        
        let length = parent.frame.width * lengthFactor
        let startX = (parent.frame.width/2) - (length/2)
        let endX = (parent.frame.width/2) + (length/2)
        let yVal = (parent.frame.height/2) + (offsetFactor * parent.frame.height)
        let startPoint = CGPoint(x: startX, y: yVal)
        let endPoint = CGPoint(x: endX, y: yVal)
        
        let pathDrawer = UIBezierPath()
        pathDrawer.move(to: startPoint)
        pathDrawer.addLine(to: endPoint)
        pathDrawer.close()
        
        self.path = pathDrawer.cgPath
        self.strokeColor = color.cgColor
        self.lineWidth = lineWidth
    }
    
    func offsetVerticallyFromObject(_ object: UIView, parent: UIView, offsetFactor: CGFloat){
        let offset = offsetFactor * parent.frame.height
        absoluteOffsetVerticallyFromObject(object, parent: parent, offset: offset)
    }
    
    func absoluteOffsetVerticallyFromObject(_ object: UIView, parent: UIView, offset: CGFloat){
        let verticalSpacing = (object.frame.height)/2 + (self.frame.height/2)
        if offset > 0{
            self.anchorPoint.y = object.center.y + verticalSpacing + offset
        }
        else if offset < 0{
            self.anchorPoint.y = object.center.y - verticalSpacing + offset
        }
    }
    
    override init() {
        super.init()
    }
}
