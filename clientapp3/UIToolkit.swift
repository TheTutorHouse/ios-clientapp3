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
    let redDecimal = CGFloat(r)/255
    let greenDecimal = CGFloat(g)/255
    let blueDecimal = CGFloat(b)/255
    let convertedColor = UIColor(red: redDecimal, green: greenDecimal, blue: blueDecimal, alpha: 1.0)
    return convertedColor
}

/*
//Returns parent center relative to the parent object.
public func relativeCenterPoint(_ view: UIView) -> CGPoint{
    let y = view.frame.height/2
    let x = view.frame.width/2
    
    if verbosityLevel == 5{
        print("\n>>> Method relativeCenterPoint has calculated the relative centerpoint of a view.")
    }
    return CGPoint.init(x: x, y: y)
}
*/
