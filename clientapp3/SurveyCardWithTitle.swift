//
//  SurveyCardWithTitle.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyCardWithTitle: SurveyCard{
    var titleLabel: CustomLabel
    var titleUnderline: HorizontalLine
    
    required init?(coder aDecoder: NSCoder) {
        titleLabel = aDecoder.decodeObject(forKey: "SurveyCardWithTitle-titleLabel") as! CustomLabel
        titleUnderline = aDecoder.decodeObject(forKey: "SurveyCardWithTitle-titleUnderline") as! HorizontalLine
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(titleLabel, forKey: "SurveyCardWithTitle-titleLabel")
        aCoder.encode(titleUnderline, forKey: "SurveyCardWithTitle-titleUnderline")
        super.encode(with: aCoder)
    }
    
    override init(frame: CGRect) {
        titleLabel = CustomLabel(frame: CGRect.zero)
        titleUnderline = HorizontalLine()
        super.init(frame: frame)
    }
    
    override init(image: UIImage?) {
        titleLabel = CustomLabel(frame: CGRect.zero)
        titleUnderline = HorizontalLine()
        super.init(image: image)
    }
    
    func initializeTitleLabel(text: String, lineWidthLimit: CGFloat, verticalOffsetFromCenter offset: CGFloat){
        titleLabel = CustomLabel(text: text, style: .header1, lineWidthLimit: lineWidthLimit)
        titleLabel.centerInParent(self)
        titleLabel.translateByParentProportion(xFactor: 0, yFactor: offset, parent: self)
        self.addSubview(titleLabel)
    }
    
    func initializeTitleUnderline(){
        titleUnderline = HorizontalLine(parent: self, lengthFactor: 0.8)
        titleUnderline.absoluteOffsetVerticallyFromObject(titleLabel, parent: self, offset: 5)
        self.layer.addSublayer(titleUnderline)
    }
}
