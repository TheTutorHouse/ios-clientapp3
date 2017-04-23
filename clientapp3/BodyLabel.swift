//
//  BodyLabel.swift
//  clientapp3
//
//  Created by Steven Xie on 20-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class BodyLabel: CustomLabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    enum BodySize: CGFloat{
        case regular = 20.0
    }
    
    enum BodyColor{
        case grey
    }
    
    init(text: String, size: BodySize, color: BodyColor, lineWidthLimit: CGFloat? = nil){
        let font = UIFont(name: "AvenirNext-REgular", size: size.rawValue)
        super.init(text: text, font: font, color: UIColor.white, lineWidthLimit: lineWidthLimit)
        self.textColor = getColor(color)
    }
    
    func getColor(_ bodyColor: BodyColor) -> UIColor{
        switch bodyColor{
        case .grey:
            return RGBColor(r: 106, g: 106, b: 106)
        }
    }
}
