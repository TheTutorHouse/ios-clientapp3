//
//  IntroCard.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class IntroCard: Card{
    var titleLabel: IntroCardTitleLabel
    var titleUnderline: IntroCardTitleUnderline
    var headerLabel: IntroCardHeaderLabel
    var bodyLabel: IntroCardBodyLabel
    var beginButton: IntroCardBeginButton
    
    required init?(coder aDecoder: NSCoder) {
        titleLabel = aDecoder.decodeObject(forKey: "IntroCardTitleLabel") as! IntroCardTitleLabel
        titleUnderline = aDecoder.decodeObject(forKey: "IntroCardTitleUnderline") as! IntroCardTitleUnderline
        headerLabel = aDecoder.decodeObject(forKey: "IntroCardHeaderLabel") as! IntroCardHeaderLabel
        bodyLabel = aDecoder.decodeObject(forKey: "IntroCardBodyLabel") as! IntroCardBodyLabel
        beginButton = aDecoder.decodeObject(forKey: "IntroCardBeginButton") as! IntroCardBeginButton
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(titleLabel, forKey: "IntroCardIntroCardTitleLabeltitleLabel")
        aCoder.encode(titleUnderline, forKey: "IntroCardTitleUnderline")
        aCoder.encode(headerLabel, forKey: "IntroCardHeaderLabel")
        aCoder.encode(bodyLabel, forKey: "IntroCardBodyLabel")
        aCoder.encode(beginButton, forKey: "IntroCardBeginButton")
    }
    
    override init(frame: CGRect) {
        self.titleLabel = IntroCardTitleLabel(frame: frame)
        self.titleUnderline = IntroCardTitleUnderline()
        self.headerLabel = IntroCardHeaderLabel(frame: frame)
        self.bodyLabel = IntroCardBodyLabel(frame: frame)
        self.beginButton = IntroCardBeginButton(frame: frame)
        super.init(frame: frame)
    }
    
    init(parent: UIView, buttonTarget: Any, buttonAction: Selector) {
        self.titleLabel = IntroCardTitleLabel(frame: CGRect.zero)
        self.titleUnderline = IntroCardTitleUnderline()
        self.headerLabel = IntroCardHeaderLabel(frame: CGRect.zero)
        self.bodyLabel = IntroCardBodyLabel(frame: CGRect.zero)
        self.beginButton = IntroCardBeginButton(frame: CGRect.zero)
        super.init(image: #imageLiteral(resourceName: "IntroCard-Medium"), parent: parent, xSizeFactor: 0.83)
        
        initializeContents(buttonTarget: buttonTarget, buttonAction: buttonAction)
        parent.addSubview(self)
        self.prepareForAnimations()
    }
    
    func initializeContents(buttonTarget target: Any, buttonAction action: Selector){
        self.titleLabel = IntroCardTitleLabel(parent: self)
        self.titleUnderline = IntroCardTitleUnderline(parent: self, cardTitleLabel: titleLabel)
        self.headerLabel = IntroCardHeaderLabel(parent: self)
        self.bodyLabel = IntroCardBodyLabel(parent: self, cardHeaderLabel: headerLabel)
        self.beginButton = IntroCardBeginButton(parent: self, target: target, action: action)
    }
    
    override func prepareForAnimations(){
        super.prepareForAnimations()
        beginButton.hide()
    }
    
    func animate(parent: UIView, anchorObject: UIView){
        super.animate()
        self.bounceIn(to: anchorObject, parent: parent, completionAction: nil)
        beginButton.fadeIn(delay: 0.15)
    }
    
    func bounceIn(to anchorObject: UIView, parent: UIView, completionAction: (()->())?){
        super.bounceIn(from: .bottom, to: anchorObject, spacingFactor: 0.03, parent: parent, completionAction: completionAction)
    }
    
    func bounceOut(parent: UIView) {
        super.bounceOut(to: .bottom, parent: parent, completionAction: nil)
    }
}
