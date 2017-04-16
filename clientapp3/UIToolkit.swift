//
//  UIToolkit.swift
//  clientapp3
//
//  Created by Steven Xie on 15-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import Foundation
import UIKit

public func RGBColor(r: Double, g: Double, b: Double) -> UIColor{
    if verbosityLevel == 5{
        print("\n>> RGBColor now converting an RGB value of (\(r),\(g), \(b)) into a UIColor.")
    }
    
    let redDecimal = CGFloat(r)/255
    let greenDecimal = CGFloat(g)/255
    let blueDecimal = CGFloat(b)/255
    let convertedColor = UIColor(red: redDecimal, green: greenDecimal, blue: blueDecimal, alpha: 1.0)
    
    if verbosityLevel == 5{
        print(">> ...UIColor of value \(convertedColor) created.")
    }
    return convertedColor
}

public func resizeObject(object: UIView, parentView: UIView, scaleFactor: CGFloat){
    if verbosityLevel == 5{
        print("\n>> Method resizeObject now resizing an object of width \(object.frame.width) to a new width that is \(scaleFactor) times the screen width.")
    }
    
    let objectToParentRatio = (object.frame.width)/(parentView.frame.width)
    let objectScaleMultipler = scaleFactor/objectToParentRatio
    object.transform = CGAffineTransform.init(scaleX: objectScaleMultipler, y: objectScaleMultipler)
    
    if verbosityLevel >= 4{
        print(">> ...An object has been resized to the width \(object.frame.width).")
    }
}

public enum Axis{
    case vertical, horizontal
}

public func setRelativePosition(of firstObject: UIView, to secondObject: UIView, by shiftAmount: CGFloat, for axis: Axis = .vertical){
    if verbosityLevel == 5{
        print("\n>> Method setRelativePosition now shifting an object by \(shiftAmount) relative to another object.")
    }
    
    switch axis{
    case .vertical:
        let firstObjectSpacer = (firstObject.frame.height)/2
        let secondObjectSpacer = (secondObject.frame.height)/2
        let totalSpacing = firstObjectSpacer + secondObjectSpacer + CGFloat(abs(shiftAmount))
        
        firstObject.center.y = secondObject.center.y
        if shiftAmount < 0{
            firstObject.center.y -= totalSpacing
            if verbosityLevel >= 4{
                print(">> ...An object has been set to be spaced \(totalSpacing) above another object.")
            }
        }
        else{
            firstObject.center.y += totalSpacing
            if verbosityLevel >= 4{
                print(">> ...An object has been set to be spaced \(totalSpacing) below another object.")
            }
        }
        
    case .horizontal:
        let firstObjectSpacer = (firstObject.frame.width)/2
        let secondObjectSpacer = (secondObject.frame.width)/2
        let totalSpacing = firstObjectSpacer + secondObjectSpacer + abs(shiftAmount)
        
        firstObject.center.x = secondObject.center.x
        if shiftAmount > 0{
            firstObject.center.x += totalSpacing
            if verbosityLevel >= 4{
                print(">> ...An object has been set to be spaced \(totalSpacing) to the right of another object.")
            }
        }
        else{
            firstObject.center.x -= totalSpacing
            if verbosityLevel >= 4{
                print(">> ...An object has been set to be spaced \(totalSpacing) to the left of of another object.")
            }
        }
    }
}
