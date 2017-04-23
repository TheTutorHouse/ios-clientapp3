//
//  SurveyCard3.swift
//  clientapp3
//
//  Created by Steven Xie on 22-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyCard3: SurveyCardWithTitle{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(parent: UIView, buttonTarget: Any, buttonAction: Selector, titleText: String, titleMaxWidthFactor: CGFloat, titleVerticalOffset: CGFloat) {
        super.init(image: #imageLiteral(resourceName: "SurveyCard2-Medium"), parent: parent, buttonTarget: buttonTarget, buttonAction: buttonAction, buttonTag: 3, titleText: "Pick your subjects!", titleMaxWidthFactor: (0.78 * parent.frame.width), titleVerticalOffset: -0.4)
    }
    
    override func prepareForAnimations() {
        super.prepareForAnimations()
    }
    
    final func bounceIn(to anchorObject: UIView, parent: UIView, completionAction: (() -> ())?) {
        super.bounceIn(from: .bottom, to: anchorObject, spacingFactor: 0.03, duration: 0.5, parent: parent, completionAction: completionAction)
        print("done")
    }
    
    final func bounceOut(parent: UIView, completionAction: (() -> ())?) {
        super.bounceOut(to: .bottom, parent: parent, completionAction: completionAction)
    }
}
