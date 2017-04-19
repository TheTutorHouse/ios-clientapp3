//
//  IntroCard.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class IntroCard: Card{
    var parentView: UIView
    var titleLabel: CustomLabel
    var titleUnderline: HorizontalLine
    var headerLabel: CustomLabel
    var bodyLabel: CustomLabel
    var button: CustomButton
    
    required init?(coder aDecoder: NSCoder) {
        parentView = aDecoder.decodeObject(forKey: "IntroCard-parentView") as! UIView
        titleLabel = aDecoder.decodeObject(forKey: "IntroCard-titleLabel") as! CustomLabel
        titleUnderline = aDecoder.decodeObject(forKey: "IntroCard-titleUnderline") as! HorizontalLine
        headerLabel = aDecoder.decodeObject(forKey: "IntroCard-headerLabel") as! CustomLabel
        bodyLabel = aDecoder.decodeObject(forKey: "IntroCard-bodyLabel") as! CustomLabel
        button = aDecoder.decodeObject(forKey: "IntroCard-button") as! CustomButton
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(parentView, forKey: "IntroCard-parentView")
        aCoder.encode(titleLabel, forKey: "IntroCard-titleLabel")
        aCoder.encode(titleUnderline, forKey: "IntroCard-titleUnderline")
        aCoder.encode(headerLabel, forKey: "IntroCard-headerLabel")
        aCoder.encode(bodyLabel, forKey: "IntroCard-bodyLabel")
        aCoder.encode(button, forKey: "IntroCard-button")
    }
    
    override init(frame: CGRect) {
        self.parentView = UIView(frame: CGRect.zero)
        self.titleLabel = CustomLabel(frame: CGRect.zero)
        self.titleUnderline = HorizontalLine()
        self.headerLabel = CustomLabel(frame: CGRect.zero)
        self.bodyLabel = CustomLabel(frame: CGRect.zero)
        self.button = CustomButton(frame: CGRect.zero)
        super.init(frame: frame)
    }
    
    init(in parentView: UIView, buttonTarget: UIViewController, buttonSelector: Selector) {
        self.parentView = parentView
        
        self.titleLabel = CustomLabel(frame: CGRect.zero)
        self.titleUnderline = HorizontalLine()
        self.headerLabel = CustomLabel(frame: CGRect.zero)
        self.bodyLabel = CustomLabel(frame: CGRect.zero)
        self.button = CustomButton(frame: CGRect.zero)
        
        super.init(image: #imageLiteral(resourceName: "IntroCard-Medium"))
        setupCard()
        initializeTitle()
        initializeHeader(shiftFactor: -0.39)
        initializeBody(shiftFactor: -0.39)
        initializeButton(buttonTarget: buttonTarget, buttonSelector: buttonSelector)
        button.hide()
    }
    
    override func setupCard(){
        self.center = parentView.center
        self.resizeProportionallyBy(.width, parent: parentView, byFactor: 0.83)
        super.setupCard()
    }
    
    func initializeTitle(){
        titleLabel = CustomLabel(text: "Welcome!", style: .header1)
        titleLabel.centerInParent(self)
        titleLabel.translateByParentProportion(xFactor: 0, yFactor: -0.35, parent: self)
        self.addSubview(titleLabel)
        
        titleUnderline = HorizontalLine(parent: self, lengthFactor: 0.8)
        titleUnderline.offsetFrom(titleLabel, by: 5, mode: .absolute, parent: self)
        self.layer.addSublayer(titleUnderline)
    }
    
    func initializeHeader(shiftFactor: CGFloat){
        headerLabel = CustomLabel(text: "Need a tutor?", style: .header2)
        headerLabel.centerInParent(self)
        headerLabel.translateByParentProportion(xFactor: 0, yFactor: -0.175, parent: self)
        headerLabel.shiftOriginFromCenter(byFactor: shiftFactor, parent: self)
        self.addSubview(headerLabel)
    }
    
    func initializeBody(shiftFactor: CGFloat){
        let bodyText = "Complete this one-minute match so we can find the tutor that’s right for you!"
        bodyLabel = CustomLabel(text: bodyText, style: .body1, lineWidthLimit: (abs(shiftFactor) * 2 * self.frame.width))
        bodyLabel.absoluteRepositionFromObject(headerLabel, parent: self, xOffset: 0, yOffset: 7)
        bodyLabel.shiftOriginFromCenter(byFactor: shiftFactor, parent: self)
        self.addSubview(bodyLabel)
    }
    
    func initializeButton(buttonTarget: Any, buttonSelector: Selector){
        button = CustomButton(activeImage: #imageLiteral(resourceName: "BeginButton-Regular"), highlightedImage: #imageLiteral(resourceName: "BeginButtonHighlighted-Regular"), parent: self, target: buttonTarget, action: buttonSelector)
        button.centerInParent(self)
        button.relativeShiftFromEdge(x: nil, y: self.frame.height, byFactor: -0.14, parent: self)
        self.addSubview(button)
    }
    
    func slideIn(to anchorObject: UIView, completionAction: ()?) {
        super.slideIn(from: .bottom, to: anchorObject, spacingFactor: 0.03, duration: 0.5, parent: self.parentView, completionAction: completionAction)
    }
}
