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
    
    init(parent: UIView, nextButtonTarget: Any, nextButtonAction: Selector) {
        super.init(image: #imageLiteral(resourceName: "SurveyCard2-Medium"), parent: parent, buttonTarget: nextButtonTarget, buttonAction: nextButtonAction, buttonTag: 3, titleText: "Pick your subjects!", titleMaxWidthFactor: 0.78, titleVerticalOffset: -0.4)
        nextButton.isEnabled = false
        parent.addSubview(self)
        self.prepareForAnimations()
    }
    
    override func prepareForAnimations() {
        super.prepareForAnimations()
    }
    
    func animate(parent: UIView, anchorObject: UIView){
        super.animate()
        self.bounceIn(to: anchorObject, parent: parent, completionAction: nil)
        nextButton.fadeIn(duration: 0.5, delay: 0.4, uponComplete: nil)
        backButton.fadeIn(duration: 0.7, delay: 0.5, uponComplete: nil)
    }
    
    final func bounceIn(to anchorObject: UIView, parent: UIView, completionAction: (() -> ())?) {
        super.bounceIn(from: .bottom, to: anchorObject, spacingFactor: 0.05, delay: 0.7, duration: 0.5, parent: parent, completionAction: completionAction)
    }
    
    final func bounceOut(parent: UIView, completionAction: (() -> ())?) {
        super.bounceOut(to: .bottom, parent: parent, completionAction: completionAction)
    }
}
