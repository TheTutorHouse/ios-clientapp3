//
//  UIExtensions.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

extension UIView{
    func centerInParent(_ parent: UIView){
        let parentCenterX = (parent.frame.width)/2
        let parentCenterY = (parent.frame.height)/2
        let parentCenter = CGPoint(x: parentCenterX, y: parentCenterY)
        self.center = parentCenter
    }
    
    public enum TransformMode{
        case graphical, positional
    }
    
    func translateByParentProportion(xFactor: CGFloat, yFactor: CGFloat, parent: UIView, mode: TransformMode = .positional){
        let xShiftValue = xFactor * parent.frame.width
        let yShiftValue = yFactor * parent.frame.height
        
        absoluteTranslate(xShift: xShiftValue, yShift: yShiftValue, parent: parent, mode: mode)
    }
    
    func absoluteTranslate(xShift: CGFloat, yShift: CGFloat, parent: UIView, mode: TransformMode = .positional){
        switch mode{
        case .positional:
            self.center.x += xShift
            self.center.y += yShift
        case .graphical:
            self.transform = CGAffineTransform.init(translationX: xShift, y: yShift)
        }
    }
    
    func repositionFromObject(_ object: UIView, parent: UIView, xOffsetFactor: CGFloat?, yOffsetFactor: CGFloat?, mode: TransformMode = .positional){
        if let xOffsetFactor = xOffsetFactor{
            self.center.x = object.center.x
            if xOffsetFactor != 0{
                if xOffsetFactor > 0{
                    self.center.x += (self.frame.width/2) + (object.frame.width/2)
                }
                else{
                    self.center.x -= (self.frame.width/2) + (object.frame.width/2)
                }
            }
        }
        if let yOffsetFactor = yOffsetFactor{
            self.center.y = object.center.y
            if yOffsetFactor != 0{
                if yOffsetFactor > 0{
                    self.center.y += (self.frame.height/2) + (object.frame.height/2)
                }
                else{
                    self.center.y -= (self.frame.height/2) + (object.frame.height/2)
                }
            }
        }
        self.translateByParentProportion(xFactor: xOffsetFactor ?? 0, yFactor: yOffsetFactor ?? 0, parent: parent, mode: mode)
    }
    
    func absoluteRepositionFromObject(_ object: UIView, parent: UIView, xOffset: CGFloat?, yOffset: CGFloat?, mode: TransformMode = .positional){
        if let xOffsetFactor = xOffset{
            self.center.x = object.center.x
            if xOffsetFactor != 0{
                if xOffsetFactor > 0{
                    self.center.x += (self.frame.width/2) + (object.frame.width/2)
                }
                else{
                    self.center.x -= (self.frame.width/2) + (object.frame.width/2)
                }
            }
        }
        if let yOffsetFactor = yOffset{
            self.center.y = object.center.y
            if yOffsetFactor != 0{
                if yOffsetFactor > 0{
                    self.center.y += (self.frame.height/2) + (object.frame.height/2)
                }
                else{
                    self.center.y -= (self.frame.height/2) + (object.frame.height/2)
                }
            }
        }
        self.absoluteTranslate(xShift: xOffset ?? 0, yShift: yOffset ?? 0, parent: parent, mode: mode)
    }
    
    public enum Dimension{
        case width, height
    }
    
    func resizeProportionallyBy(_ dimension: Dimension, parent: UIView, byFactor sizeFactor: CGFloat, mode: TransformMode = .positional){
        let dimensionRatio: CGFloat = self.frame.height/self.frame.width
        
        var newWidth: CGFloat
        var newHeight: CGFloat
        
        switch dimension{
        case .width:
            newWidth = sizeFactor * parent.frame.width
            newHeight = dimensionRatio * newWidth
        case .height:
            newHeight = sizeFactor * parent.frame.height
            newWidth = (1/dimensionRatio) * newHeight
        }
    
        switch mode{
        case .positional:
            self.frame = CGRect(x: self.center.x - (newWidth/2), y: self.center.y - (newHeight/2), width: newWidth, height: newHeight)
        case .graphical:
            print("Error: Graphical resizing option currently unavailable.")
        }
    }
    
    func relativeShiftFromEdge(x: CGFloat?, y: CGFloat?, byFactor factor: CGFloat, parent: UIView){
        if let x = x{
            let spacing = abs(self.frame.width/2)
            if factor > 0 {
                self.center.x = x + spacing + (factor * parent.frame.width)
            }
            else if factor < 0 {
                self.center.x = x - spacing + (factor * parent.frame.width)
            }
        }
        if let y = y{
            let spacing = abs(self.frame.height/2)
            if factor > 0{
                self.center.y = y + spacing + (factor * parent.frame.height)
            }
            else if factor < 0 {
                self.center.y = y - spacing + (factor * parent.frame.height)
            }
        }
    }
    
}
