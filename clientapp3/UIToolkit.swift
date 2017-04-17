//
//  UIToolkit.swift
//  clientapp3
//
//  Created by Steven Xie on 15-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import Foundation
import UIKit

//Converts colors from RGB to UIColor
public func RGBColor(r: Double, g: Double, b: Double) -> UIColor{
    if verbosityLevel == 5{
        print(">> RGBColor now converting an RGB value of (\(r),\(g), \(b)) into a UIColor.")
    }
    
    let redDecimal = CGFloat(r)/255
    let greenDecimal = CGFloat(g)/255
    let blueDecimal = CGFloat(b)/255
    let convertedColor = UIColor(red: redDecimal, green: greenDecimal, blue: blueDecimal, alpha: 1.0)
    
    if verbosityLevel == 5{
        print(">> ...UIColor of value \(convertedColor) created.\n")
    }
    return convertedColor
}

//Resizes objects in relation to the screen width.
public func resizeObjectByWidth(object: UIView, parentView: UIView, widthFactor scaleFactor: CGFloat){
    if verbosityLevel == 5{
        print(">> Method resizeObjectByWidth now resizing an object of width \(object.frame.width) to a new width that is \(scaleFactor) times the screen width.")
    }
    
    let objectToParentRatio = (object.frame.width)/(parentView.frame.width)
    let objectScaleMultipler = scaleFactor/objectToParentRatio
    object.transform = CGAffineTransform.init(scaleX: objectScaleMultipler, y: objectScaleMultipler)
    
    if verbosityLevel >= 4{
        print(">> ...An object has been resized to the width \(object.frame.width).\n")
    }
}


//Returns the offset between two onscreen elements
/*
public func positionOffset(from firstObject: UIView, to secondObject: UIView, spacing shiftAmount: CGFloat, axis: Axis = .vertical) -> CGFloat{
    if verbosityLevel == 5{
        print(">> Method positionOffset now calculating total spacing.\n")
    }
    
    switch axis{
    case .vertical:
        let firstObjectSpacer = (firstObject.frame.height)/2
        let secondObjectSpacer = (secondObject.frame.height)/2
        let totalSpacing = firstObjectSpacer + secondObjectSpacer + CGFloat(abs(shiftAmount))
        
        firstObject.center.y = secondObject.center.y
        if shiftAmount < 0{
            if verbosityLevel >= 4{
                print(">> ...Returning a vertical spacing of \(-totalSpacing) to another object.\n")
            }
            return -totalSpacing
        }
        else{
            if verbosityLevel >= 4{
                print(">> ...Returning a vertical spacing of \(totalSpacing) to another object.\n")
            }
            return totalSpacing
        }
        
    case .horizontal:
        let firstObjectSpacer = (firstObject.frame.width)/2
        let secondObjectSpacer = (secondObject.frame.width)/2
        let totalSpacing = firstObjectSpacer + secondObjectSpacer + abs(shiftAmount)
        
        firstObject.center.x = secondObject.center.x
        if shiftAmount > 0{
            if verbosityLevel >= 4{
                print(">> ...Returning a horizontal spacing of \(totalSpacing) to another object.\n")
            }
            return totalSpacing
        }
        else{
            if verbosityLevel >= 4{
                print(">> ...Returning a horizontal spacing of \(-totalSpacing) to another object.\n")
            }
            return -totalSpacing
        }
    }
}
*/

//Returns parent center relative to the parent object.
public func relativeCenterPoint(_ view: UIView) -> CGPoint{
    let y = view.frame.height/2
    let x = view.frame.width/2
    
    if verbosityLevel == 5{
        print("\n>>> Method relativeCenterPoint has calculated the relative centerpoint of a view.")
    }
    return CGPoint.init(x: x, y: y)
}
