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
    
    public enum Axis{
        case vertical, horizontal
    }
    
    func translate(by amount: CGFloat, axis: Axis, parent: UIView, relative: Bool, mode: TransformMode = .positional){
        var parentMaxBound: CGFloat
        switch axis{
        case .horizontal:
            parentMaxBound = parent.frame.width
        case .vertical:
            parentMaxBound = parent.frame.height
        }
        
        var shift: CGFloat
        switch relative {
        case true:
            shift = parentMaxBound * amount
        case false:
            shift = amount
        }
        
        switch mode{
        case .positional:
            switch axis{
            case .horizontal:
                self.center.x += shift
            case .vertical:
                self.center.y += shift
            }
        case .graphical:
            switch axis{
            case .horizontal:
                self.transform = CGAffineTransform(translationX: shift, y: 0)
            case .vertical:
                self.transform = CGAffineTransform(translationX: 0, y: shift)
            }
        }
    }
    
    func repositionFrom(_ object: UIView, by amount: CGFloat, axis: Axis, parent: UIView, relative: Bool,  mode: TransformMode = .positional){
        switch axis{
        case .horizontal:
            self.center.x = object.center.x
            if amount != 0{
                if amount > 0{
                    self.center.x += (self.frame.width/2) + (object.frame.width/2)
                }
                else if amount < 0{
                    self.center.x -= (self.frame.width/2) + (object.frame.width/2)
                }
            }
        case .vertical:
            self.center.y = object.center.y
            if amount != 0{
                if amount > 0{
                    self.center.y += (self.frame.height/2) + (object.frame.height/2)
                }
                else if amount < 0{
                    self.center.y -= (self.frame.height/2) + (object.frame.height/2)
                }
            }
        }
        self.translate(by: amount, axis: axis, parent: parent, relative: relative, mode: mode)
    }
    
    func resizeProportionally(on axis: Axis, by amount: CGFloat, parent: UIView, relative: Bool, mode: TransformMode = .positional){
        let dimensionRatio: CGFloat = self.frame.height/self.frame.width
        
        var newWidth: CGFloat
        var newHeight: CGFloat
        switch axis{
        case .horizontal:
            switch relative{
            case true:
                newWidth = amount * parent.frame.width
            case false:
                newWidth = amount
            }
            newHeight = dimensionRatio * newWidth
        case .vertical:
            switch relative{
            case true:
                newHeight = amount * parent.frame.height
            case false:
                newHeight = amount
            }
            newWidth = (1/dimensionRatio) * newHeight
        }
    
        switch mode{
        case .positional:
            self.frame = CGRect(x: self.center.x - (newWidth/2), y: self.center.y - (newHeight/2), width: newWidth, height: newHeight)
        case .graphical:
            print("Error: Graphical resizing option currently unavailable.")
        }
    }
    
    func shiftFrom(position: CGFloat, by amount: CGFloat, axis: Axis, parent: UIView, relative: Bool){
        switch axis{
        case .vertical:
            let spacing = abs(self.frame.height/2)
            if amount > 0{
                switch relative{
                case true:
                    self.center.y = position + spacing + (amount * parent.frame.height)
                case false:
                    self.center.y = position + spacing + amount
                }
            }
            else if amount < 0{
                switch relative{
                case true:
                    self.center.y = position - spacing + (amount * parent.frame.height)
                case false:
                    self.center.y = position - spacing + amount
                }
            }
        case .horizontal:
            let spacing = abs(self.frame.width/2)
            if amount > 0{
                switch relative{
                case true:
                    self.center.x = position + spacing + (amount * parent.frame.width)
                case false:
                    self.center.x = position + spacing + amount
                }
            }
            else if amount < 0{
                switch relative{
                case true:
                    self.center.x = position - spacing + (amount * parent.frame.width)
                case false:
                    self.center.x = position - spacing + amount
                }
            }
        }
    }
}
