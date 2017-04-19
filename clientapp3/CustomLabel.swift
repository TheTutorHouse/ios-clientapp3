//
//  CustomLabel.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class CustomLabel: UILabel{
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(text: String, fontSize: CGFloat, fontWeight: String, fontColor: UIColor, lineWidthLimit: CGFloat? = nil) {
        if let font = UIFont(name: "AvenirNext-" + fontWeight, size: fontSize){
            self.init(text: text, font: font, fontColor: fontColor, lineWidthLimit: lineWidthLimit)
        }
        else{
            self.init(frame: CGRect.zero)
        }
    }
    
    init(text: String, font: UIFont, fontColor: UIColor, lineWidthLimit: CGFloat? = nil){
        super.init(frame: CGRect.zero)
        super.text = text
        super.font = font
        super.textColor = fontColor
        
        if let maxWidth = lineWidthLimit{
            super.numberOfLines = 0
            super.lineBreakMode = .byWordWrapping
            super.frame.size.width = maxWidth
        }
        
        sizeToFit()
    }
    
    convenience init(text: String, style: FontStyle, lineWidthLimit: CGFloat? = nil) {
        if let packagedFont = constructFont(style){
            let font = packagedFont["font"] as! UIFont
            let color = packagedFont["color"] as! UIColor
            self.init(text: text, font: font, fontColor: color, lineWidthLimit: lineWidthLimit)
        }
        else{
            self.init(frame: CGRect.zero)
        }
    }
    
    func shiftOriginFromCenter(byFactor offsetFactor: CGFloat, parent: UIView){
        self.frame.origin.x = parent.frame.width/2 + (offsetFactor * parent.frame.width)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
