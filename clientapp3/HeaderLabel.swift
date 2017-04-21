//
//  HeaderLabel.swift
//  clientapp3
//
//  Created by Steven Xie on 20-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class HeaderLabel: CustomLabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    enum HeaderSize: CGFloat{
        case regular = 27.0
        case small = 20.0
    }
    
    enum HeaderColor{
        case grey, darkGrey, lightGrey
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(text: String, size: HeaderSize, color: HeaderColor, lineWidthLimit: CGFloat? = nil){
        let font = UIFont(name: "AvenirNext-Medium", size: size.rawValue)
        super.init(text: text, font: font, color: UIColor.white, lineWidthLimit: lineWidthLimit)
        self.textColor = getColor(color)
    }
    
    func getColor(_ headerColor: HeaderColor) -> UIColor{
        switch headerColor{
        case .grey:
            return RGBColor(r: 81, g: 80, b: 80)
        case .darkGrey:
            return RGBColor(r: 89, g: 88, b: 88)
        case .lightGrey:
            return RGBColor(r: 71, g: 71, b: 71)
        }
    }
}
