//
//  VariablePanel.swift
//  clientapp3
//
//  Created by Steven Xie on 15-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import Foundation
import UIKit

//Developer Options
public let verbosityLevel = 5 //Minimum is 0, maximum is 5.

//Names & Strings
public let companyName = "The Tutor House"

//Colors & Styles
public struct FillColor{
    static let red = RGBColor(r: 211, g: 60, b: 60)
}

public struct FontSize{
    static let regular = 20.0
    static let header1 = 27.0
    static let logo = 35.0
}

public struct FontColor{
}

public func stylizedLabel(text: String, fontSize: Double = 20, fontStyle: String? = nil, fontColor: UIColor? = nil) -> UILabel{
    //Data logging:
    if verbosityLevel == 5 {
        print("\n>> Function stylizedLabel now creating a new stylized label.")
    }
    
    //Create label, initial setup.
    let label = UILabel(frame: CGRect.zero)
    
    //Setup optional font names and colors.
    var fontName = "Avenir Next"
    if let fontStyle = fontStyle {
        fontName = "AvenirNext-" + fontStyle
    }
    if let fontColor = fontColor{
        label.textColor = fontColor
    }
    
    //Setup rest of font and text information.
    label.text = text
    label.font = UIFont(name: fontName, size: CGFloat(fontSize))
    label.sizeToFit()
    
    if verbosityLevel >= 4{
        print(">> ...new Label created with a font designation of \(label.font).")
    }
    return label
}
