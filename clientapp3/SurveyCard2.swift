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
    
    init(parent: UIView, nextbuttonTarget: Any, nextbuttonAction: Selector) {
        super.init(image: #imageLiteral(resourceName: "SurveyCard2-Medium"), parent: parent, buttonTarget: nextbuttonTarget, buttonAction: nextbuttonAction, buttonTag: 2, titleText: "What kind of learner are you?", titleMaxWidthFactor: 0.78, titleVerticalOffset: -0.375)
        parent.addSubview(self)
    }
    
    override func prepareForAnimations() {
        super.prepareForAnimations()
    }
    
    func animate(parent: UIView, anchorObject: UIView){
        super.animate()
        self.nextButton.hide()
        self.bounceIn(to: anchorObject, parent: parent, completionAction: nil)
        nextButton.fadeIn(duration: 0.5, delay: 0.5, uponComplete: nil)
    }
    
    final func bounceIn(to anchorObject: UIView, parent: UIView, completionAction: (() -> ())?) {
        super.bounceIn(from: .bottom, to: anchorObject, spacingFactor: 0.03, duration: 0.5, parent: parent, completionAction: completionAction)
    }
    
    final func bounceOut(parent: UIView, completionAction: (() -> ())?) {
        super.bounceOut(to: .bottom, parent: parent, completionAction: completionAction)
    }
}
