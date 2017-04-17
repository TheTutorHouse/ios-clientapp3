//
//  CustomLabel.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class CustomLabel: UILabel{
    
    enum FontStyle {
        case header1, header2, body1
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(text: String, fontSize: CGFloat, fontWeight: String, fontColor: UIColor, lineWidthLimit: CGFloat? = nil) {
        super.init(frame: CGRect.zero)
        super.text = text
        super.font = UIFont(name: "AvenirNext-" + fontWeight, size: fontSize)
        super.textColor = fontColor
        
        if let maxWidth = lineWidthLimit{
            super.numberOfLines = 0
            super.lineBreakMode = .byWordWrapping
            super.frame.size.width = maxWidth
        }
        
        super.sizeToFit()
    }
    
    func shiftOriginFromCenter(byFactor offsetFactor: CGFloat, parent: UIView){
        self.frame.origin.x = parent.center.x + (offsetFactor * parent.frame.width)
    }
    
    convenience init(text: String, style: FontStyle, lineWidthLimit: CGFloat? = nil) {
        var fontSize: CGFloat
        var fontWeight: String
        var fontColor: UIColor
        
        switch style{
        case .header1:
            fontSize = FontSize.header1
            fontWeight = "Medium"
            fontColor = FontColor.headerGrey1
            
        case .header2:
            fontSize = FontSize.header2
            fontWeight = "Medium"
            fontColor = FontColor.headerGrey2
            
        case .body1:
            fontSize = FontSize.body1
            fontWeight = "Regular"
            fontColor = FontColor.bodyGrey1
        }
        
        self.init(text: text, fontSize: fontSize, fontWeight: fontWeight, fontColor: fontColor, lineWidthLimit: lineWidthLimit)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
