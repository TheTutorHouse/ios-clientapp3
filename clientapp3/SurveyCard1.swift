//
//  SurveyCard1.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyCard1: SurveyCardWithTitle{
    var nameLabel: SurveyCard1NameLabel
    var nameField: SurveyCard1NameField
    var emailLabel: SurveyCard1EmailLabel
    var emailField: SurveyCard1EmailField
    var gradeLabel: SurveyCard1GradeLabel
    var gradeButtons: [SurveyCard1GradeButton]
    var divider: SurveyCard1Divider
    
    required init?(coder aDecoder: NSCoder) {
        nameLabel = aDecoder.decodeObject(forKey: "SurveyCard1NameLabel") as! SurveyCard1NameLabel
        nameField = aDecoder.decodeObject(forKey: "SurveyCard1NameField") as! SurveyCard1NameField
        emailLabel = aDecoder.decodeObject(forKey: "SurveyCard1EmailLabel") as! SurveyCard1EmailLabel
        emailField = aDecoder.decodeObject(forKey: "SurveyCard1EmailField") as! SurveyCard1EmailField
        gradeLabel = aDecoder.decodeObject(forKey: "SurveyCard1GradeLabel") as! SurveyCard1GradeLabel
        gradeButtons = aDecoder.decodeObject(forKey: "SurveyCard1GradeButtons") as! [SurveyCard1GradeButton]
        divider = aDecoder.decodeObject(forKey: "SurveyCard1Divider") as! SurveyCard1Divider
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(nameLabel, forKey: "SurveyCard1NameLabel")
        aCoder.encode(nameField, forKey: "SurveyCard1NameField")
        aCoder.encode(emailLabel, forKey: "SurveyCard1EmailLabel")
        aCoder.encode(emailField, forKey: "SurveyCard1EmailField")
        aCoder.encode(gradeLabel, forKey: "SurveyCard1GradeLabel")
        aCoder.encode(gradeButtons, forKey: "SurveyCard1GradeButtons")
        aCoder.encode(divider, forKey: "SurveyCard1Divider")
        super.encode(with: aCoder)
    }
    
    override init(frame: CGRect) {
        nameLabel = SurveyCard1NameLabel(frame: frame)
        nameField = SurveyCard1NameField(frame: frame)
        emailLabel = SurveyCard1EmailLabel(frame: frame)
        emailField = SurveyCard1EmailField(frame: frame)
        gradeLabel = SurveyCard1GradeLabel(frame: frame)
        gradeButtons = [SurveyCard1GradeButton]()
        divider = SurveyCard1Divider(frame: frame)
        super.init(frame: frame)
    }
    
    init(parent: UIView, nextButtonTarget: Any, nextButtonAction: Selector, textFieldDelegate: UITextFieldDelegate) {
        nameLabel = SurveyCard1NameLabel(frame: CGRect.zero)
        nameField = SurveyCard1NameField(frame: CGRect.zero)
        emailLabel = SurveyCard1EmailLabel(frame: CGRect.zero)
        emailField = SurveyCard1EmailField(frame: CGRect.zero)
        gradeLabel = SurveyCard1GradeLabel(frame: CGRect.zero)
        gradeButtons = [SurveyCard1GradeButton]()
        divider = SurveyCard1Divider(frame: CGRect.zero)
        super.init(image: #imageLiteral(resourceName: "SurveyCard1-Medium"), parent: parent, xSizeFactor: 0.83, buttonTarget: nextButtonTarget,  buttonAction: nextButtonAction, buttonTag: 1, titleText: "So, who are you?", titleMaxWidthFactor: (0.78), titleVerticalOffset: -0.4)
        initializeContents(textFieldDelegate: textFieldDelegate)
        self.hide()
        parent.addSubview(self)
    }
    
    func initializeContents(textFieldDelegate: UITextFieldDelegate){
        titleLabel.translateOrigin(by: -0.39, axis: .horizontal, parent: self, relative: true)
        nameLabel = SurveyCard1NameLabel(parent: self)
        nameField = SurveyCard1NameField(parent: self, nameLabel: nameLabel, delegate: textFieldDelegate)
        emailLabel = SurveyCard1EmailLabel(parent: self)
        emailField = SurveyCard1EmailField(parent: self, emailLabel: emailLabel, delegate: textFieldDelegate)
        gradeLabel = SurveyCard1GradeLabel(parent: self)
        for grade in 9...12{
            let gradeButton = SurveyCard1GradeButton(parent: self, grade: grade, gradeLabel: gradeLabel, target: self, action: #selector(onGradeButtonClick(_:)))
            gradeButtons.append(gradeButton)
        }
        divider = SurveyCard1Divider(parent: self, nextButton: self.nextButton)
        
        hideSurveyObjects([nameLabel, nameField, emailLabel, emailField, gradeLabel, divider])
        hideSurveyObjects(gradeButtons)
    }
    
    func animate(parent: UIView, anchorObject: UIView){
        nextButton.hide()
        self.slideIn(to: anchorObject, parent: parent, uponCompletion: nil)
        animateContents()
    }
    
    func animateContents(){
        let formElements: [UIView] = [nameLabel, nameField, emailLabel, emailField, gradeLabel]
        for arrayID in 0...(formElements.count - 1){
            easeInSurveyObject(object: formElements[arrayID], delay: (0.05 + 0.075 * TimeInterval(arrayID)), duration: 0.4)
        }
        
        for arrayID in 0...(gradeButtons.count - 1){
            slideInSurveyObject(object: gradeButtons[arrayID], from: .bottom, delay: (0.5 + (0.04 * TimeInterval(arrayID))), duration: 0.45)
        }
        
        divider.animate(delay: 0.7)
        nextButton.isHidden = false
        easeInSurveyObject(object: nextButton, delay: 0.55, duration: 0.6)
    }
    
    func slideInFormElement(element: UIView, delay: TimeInterval, duration: TimeInterval){
        slideInSurveyObject(object: element, from: .bottom, delay: delay, duration: duration)
    }
    
    func slideInSurveyObject(object: UIView, from origin: Card.Direction, delay: TimeInterval, duration: TimeInterval) {
        super.slideInSurveyObject(object: object, from: origin, delay: delay, duration: delay, parent: self, completionAction: nil)
    }
    
    func easeInSurveyObject(object: UIView, delay: TimeInterval, duration: TimeInterval) {
        super.easeInSurveyObject(object: object, from: .bottom, delay: delay, duration: duration, parent: self, completionAction: nil)
    }
    
    func onGradeButtonClick(_ sender: SurveyCard1GradeButton!){
        for button in gradeButtons{
            if button == sender{
                button.assignState(state: .active, for: button.tag)
            }
            else{
                button.assignState(state: .inactive, for: button.tag)
            }
        }
    }
    
    func slideIn(to anchorObject: UIView, parent: UIView, uponCompletion completionAction: (()->())?) {
        super.slideIn(from: .bottom, to: anchorObject, spacingFactor: 0.03, duration: 0.5, parent: parent, completionAction: completionAction)
    }
    
    func slideOut(parent: UIView, completionAction: (() -> ())?) {
        super.slideOut(to: .bottom, delay: 0.25, parent: parent, completionAction: completionAction)
    }
}
