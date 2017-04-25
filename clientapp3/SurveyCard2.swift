//
//  SurveyCard2.swift
//  clientapp3
//
//  Created by Steven Xie on 21-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyCard2: SurveyCardWithTitle{
    var learnerButtons: [SurveyCard2LearnerButton]!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(parent: UIView, nextButtonTarget: Any, nextButtonAction: Selector) {
        super.init(image: #imageLiteral(resourceName: "SurveyCard2-Medium"), parent: parent, buttonTarget: nextButtonTarget, buttonAction: nextButtonAction, buttonTag: 2, titleText: "What kind of learner are you?", titleMaxWidthFactor: 0.78, titleVerticalOffset: -0.375)
        titleLabel.textAlignment = .left
        nextButton.isEnabled = false
        self.initializeContents()
        parent.addSubview(self)
        self.prepareForAnimations()
    }
    
    override func prepareForAnimations() {
        hideSurveyObjects(learnerButtons)
        super.prepareForAnimations()
    }
    
    func initializeContents(){
        titleLabel.translateOrigin(by: -0.39, axis: .horizontal, parent: self, relative: true)
        learnerButtons = [SurveyCard2LearnerButton]()
        learnerButtons.append(SurveyCard2LearnerButton.init(parent: self, learnerType: .visual, target: self, action: #selector(onLearnerButtonClick(_:))))
        learnerButtons.append(SurveyCard2LearnerButton.init(parent: self, learnerType: .auditory, target: self, action: #selector(onLearnerButtonClick(_:))))
        learnerButtons.append(SurveyCard2LearnerButton.init(parent: self, learnerType: .kinesthetic, target: self, action: #selector(onLearnerButtonClick(_:))))
        
        for button in learnerButtons{
            if button.isChosen == true{
                nextButton.isEnabled = true
            }
        }
    }
    
    func onLearnerButtonClick(_ sender: SurveyCard2LearnerButton){
        let defaults = UserDefaults.standard
        for button in learnerButtons{
            if button == sender{
                button.isChosen = true
                button.popInIndicator(delay: 0.01)
                defaults.set(button.tag, forKey: "surveyCard2LearnerButtonTag")
                nextButton.enable()
            }
            else if button != sender && button.isChosen == true{
                button.isChosen = false
                button.fadeOutIndicator(delay: 0.01)
            }
        }
    }
    
    func animate(parent: UIView, anchorObject: UIView, delay: TimeInterval){
        super.animate()
        self.bounceIn(to: anchorObject, parent: parent, delay: delay, completionAction: nil)
        
        for arrayID in 0...(learnerButtons.count - 1){
            bounceInSurveyObject(object: learnerButtons[arrayID], from: .bottom, delay: TimeInterval(0.15 + (0.15 * Double(arrayID))), duration: 0.5, parent: parent, completionAction: nil)
        }
        
        nextButton.fadeIn(duration: 0.5, delay: 0.6, uponComplete: nil)
        backButton.fadeIn(duration: 0.7, delay: 0.7, uponComplete: nil)
    }
    
    override func bounceInSurveyObject(object: UIView, from origin: Direction = .bottom, delay: TimeInterval = 0, duration: TimeInterval = 0.5, parent: UIView, completionAction: (()->())?){
        let objectOriginalPosition = object.center
        
        switch origin{
        case .top:
            object.center.y -= parent.frame.height
        case .bottom:
            object.center.y += parent.frame.height
        case .left:
            object.center.x -= parent.frame.width
        case .right:
            object.center.x += parent.frame.width
        }
        
        object.alpha = 1
        
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: [], animations: {
            object.center = objectOriginalPosition
        }, completion: {finished in
            if let completionAction = completionAction{
                completionAction()
            }
        })
    }
    
    final func bounceIn(to anchorObject: UIView, parent: UIView, delay: TimeInterval, completionAction: (() -> ())?) {
        super.bounceIn(from: .bottom, to: anchorObject, spacingFactor: 0.05, delay: delay, duration: 0.5, parent: parent, completionAction: completionAction)
    }
    
    final func bounceOut(parent: UIView, completionAction: (() -> ())?) {
        super.bounceOut(to: .bottom, parent: parent, completionAction: completionAction)
    }
}
