//
//  SurveyCard2.swift
//  clientapp3
//
//  Created by Steven Xie on 21-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyCard2: SurveyCardWithTitle{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(parent: UIView, buttonTarget: Any, buttonAction: Selector, buttonTag: Int, titleText: String, titleMaxWidthFactor: CGFloat, titleVerticalOffset: CGFloat) {
        super.init(image: #imageLiteral(resourceName: "SurveyCard2-Medium"), parent: parent, xSizeFactor: 0.83, buttonTarget: buttonTarget, buttonAction: buttonAction, buttonTag: buttonTag, titleText: "What kind of learner are you?", titleMaxWidthFactor: (0.78 * parent.frame.width), titleVerticalOffset: -0.4)
    }
    
    func slideIn(to anchorObject: UIView, parent: UIView, completionAction: (() -> ())?) {
        super.slideIn(from: .bottom, to: anchorObject, spacingFactor: 0.03, duration: 0.5, parent: parent, completionAction: completionAction)
    }
}
