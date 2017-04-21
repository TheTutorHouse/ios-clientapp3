//
//  CustomColor.swift
//  clientapp3
//
//  Created by Steven Xie on 18-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import Foundation
import UIKit

public struct CustomColor{
    static let red = RGBColor(r: 211, g: 60, b: 60)
    static let grey1 = RGBColor(r: 147, g: 147, b: 147)
}

public func RGBColor(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor{
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
}


