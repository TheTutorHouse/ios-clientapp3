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
    
    init(text: String, font: UIFont?, color: UIColor, lineWidthLimit: CGFloat? = nil){
        super.init(frame: CGRect.zero)
        self.text = text
        self.font = font
        self.textColor = color
        if let maxWidth = lineWidthLimit{
            super.numberOfLines = 0
            super.lineBreakMode = .byWordWrapping
            super.frame.size.width = maxWidth
        }
        sizeToFit()
    }
    
    func translateOrigin(by amount: CGFloat, axis: UIView.Axis, parent: UIView, relative: Bool, mode: UIView.TransformMode = .positional) {
        var absoluteAmount: CGFloat
        switch axis{
        case .horizontal:
            switch relative{
            case true:
                absoluteAmount = parent.frame.width * amount
            case false:
                absoluteAmount = amount
            }
            absoluteAmount += self.frame.width/2
        case .vertical:
            switch relative{
            case true:
                absoluteAmount = parent.frame.height * amount
            case false:
                absoluteAmount = amount
            }
            absoluteAmount += self.frame.height/2
        }
        super.translate(by: absoluteAmount, axis: axis, parent: parent, relative: false, mode: mode)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
