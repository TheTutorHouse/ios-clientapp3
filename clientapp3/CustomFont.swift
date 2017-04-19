//
//  CustomFont.swift
//  clientapp3
//
//  Created by Steven Xie on 18-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import Foundation
import UIKit

public struct CustomFontSize{
    static let body1: CGFloat = 20.0
    static let header1: CGFloat = 27.0
    static let logo: CGFloat = 35.0
    static let textField: CGFloat = 19.0
}

public struct CustomFontColor{
    static let headerGrey1 = RGBColor(r: 81, g: 80, b: 80)
    static let headerGrey2 = RGBColor(r: 89, g: 88, b: 88)
    static let headerGrey3 = RGBColor(r: 71, g: 71, b: 71)
    static let bodyGrey1 = RGBColor(r: 106, g: 106, b: 106)
}

public enum FontStyle{
    case logo, header1, header2, header3, body1
}

public func constructFont(_ style: FontStyle) -> [String: Any]?{
    var fontSize: CGFloat
    var fontWeight: String
    var fontColor: UIColor
    
    switch style{
    case .logo:
        fontSize = CustomFontSize.logo
        fontWeight = "DemiBold"
        fontColor = UIColor.white
    case .header1:
        fontSize = CustomFontSize.header1
        fontWeight = "Medium"
        fontColor = CustomFontColor.headerGrey1
        
    case .header2:
        fontSize = CustomFontSize.body1
        fontWeight = "Medium"
        fontColor = CustomFontColor.headerGrey2
        
    case .header3:
        fontSize = CustomFontSize.body1
        fontWeight = "Medium"
        fontColor = CustomFontColor.headerGrey3
        
    case .body1:
        fontSize = CustomFontSize.body1
        fontWeight = "Regular"
        fontColor = CustomFontColor.bodyGrey1
    }
    
    let font = UIFont(name: "AvenirNext-" + fontWeight, size: fontSize)
    let color = fontColor
    
    if let font = font{
        return ["font": font, "color": color]
    }
    else{
        return nil
    }
}
