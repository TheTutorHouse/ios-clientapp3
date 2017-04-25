//
//  SurveyCardWithTitle.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyCardWithTitle: SurveyCard{
    var titleLabel: HeaderLabel
    var titleUnderline: HorizontalLine
    
    required init?(coder aDecoder: NSCoder) {
        titleLabel = aDecoder.decodeObject(forKey: "SurveyCardWithTitle-titleLabel") as! HeaderLabel
        titleUnderline = aDecoder.decodeObject(forKey: "SurveyCardWithTitle-titleUnderline") as! HorizontalLine
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(titleLabel, forKey: "SurveyCardWithTitle-titleLabel")
        aCoder.encode(titleUnderline, forKey: "SurveyCardWithTitle-titleUnderline")
        super.encode(with: aCoder)
    }
    
    override init(frame: CGRect) {
        titleLabel = HeaderLabel(frame: CGRect.zero)
        titleUnderline = HorizontalLine()
        super.init(frame: frame)
    }
    
    init(image: UIImage?, parent: UIView, xSizeFactor: CGFloat = Card.defaultXSizeFactor, buttonTarget: Any, buttonAction: Selector, buttonTag: Int, titleText: String, titleMaxWidthFactor: CGFloat, titleVerticalOffset: CGFloat) {
        titleLabel = HeaderLabel(frame: CGRect.zero)
        titleUnderline = HorizontalLine()
        super.init(image: image, parent: parent, xSizeFactor: xSizeFactor, buttonTarget: buttonTarget, buttonAction: buttonAction, buttonTag: buttonTag)
        
        initializeTitleLabel(text: titleText, lineWidthLimit: titleMaxWidthFactor * self.frame.width, verticalOffset: titleVerticalOffset)
        initializeTitleUnderline()
    }
    
    func initializeTitleLabel(text: String, lineWidthLimit: CGFloat, verticalOffset offset: CGFloat){
        titleLabel = HeaderLabel(text: text, size: .regular, color: .grey, lineWidthLimit: lineWidthLimit)
        titleLabel.centerInParent(self)
        titleLabel.translate(by: offset, axis: .vertical, parent: self, relative: true)
        self.addSubview(titleLabel)
    }
    
    func initializeTitleUnderline(){
        titleUnderline = HorizontalLine(parent: self, lengthFactor: 0.8)
        titleUnderline.offsetFrom(titleLabel, direction: .vertical, by: 5, relative: false, parent: self)
        self.layer.addSublayer(titleUnderline)
    }
}
