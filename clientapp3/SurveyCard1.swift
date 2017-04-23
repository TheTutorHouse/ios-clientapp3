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
    
    var emailIsValid: Bool = false{
        didSet{
            self.checkNextButtonValidity()
        }
    }
    var nameIsValid: Bool = false{
        didSet{
            self.checkNextButtonValidity()
        }
    }
    var gradeIsValid: Bool = false{
        didSet{
            self.checkNextButtonValidity()
        }
    }
    
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
        
        super.init(image: #imageLiteral(resourceName: "SurveyCard1-Medium"), parent: parent, buttonTarget: nextButtonTarget,  buttonAction: nextButtonAction, buttonTag: 1, titleText: "So, who are you?", titleMaxWidthFactor: (0.78), titleVerticalOffset: -0.4)
        initializeContents(textFieldDelegate: textFieldDelegate)
        nextButton.isEnabled = false
        parent.addSubview(self)
        self.prepareForAnimations()
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
    }
    
    func onGradeButtonClick(_ sender: SurveyCard1GradeButton!){
        for button in gradeButtons{
            if button == sender{
                button.assignState(state: .active, for: button.tag)
                self.gradeIsValid = true
            }
            else{
                button.assignState(state: .inactive, for: button.tag)
            }
        }
    }
    
    func contentsAreValid(textField: UITextField) -> Bool{
        var valid: Bool
        
        switch textField{
        case nameField:
            if textField.text == ""{
                valid = false
            }
            else{
                valid = true
            }
        case emailField:
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            valid = emailTest.evaluate(with: textField.text)
        default:
            fatalError("SurveyCard1 tried to verify the contents of an invalid textfield.")
        }
        
        switch valid{
        case true:
            UIView.animate(withDuration: 0.45, animations: {
                textField.backgroundColor = RGBColor(r: 201, g: 238, b: 164)
            })
        case false:
            UIView.animate(withDuration: 0.45, animations: {
                textField.backgroundColor = RGBColor(r: 244, g: 160, b: 160)
            })
        }
        return valid
    }
    
    func checkNextButtonValidity(){
        if self.gradeIsValid && self.emailIsValid && nameIsValid{
            nextButton.enable()
        }
        else{
            nextButton.disable()
        }
    }
    
    override func prepareForAnimations(){
        self.hideSurveyObjects([nameLabel, nameField, emailLabel, emailField, gradeLabel, divider])
        hideSurveyObjects(gradeButtons)
        super.prepareForAnimations()
    }
    
    func animate(parent: UIView, anchorObject: UIView){
        super.animate()
        self.bounceIn(to: anchorObject, parent: parent, uponCompletion: nil)
        
        let formElements: [UIView] = [nameLabel, nameField, emailLabel, emailField, gradeLabel]
        for arrayID in 0...(formElements.count - 1){
            easeInSurveyObject(object: formElements[arrayID], delay: (0.05 + 0.06 * TimeInterval(arrayID)), duration: 0.4)
        }
        
        for arrayID in 0...(gradeButtons.count - 1){
            bounceInSurveyObject(object: gradeButtons[arrayID], from: .bottom, delay: (0.45 + (0.04 * TimeInterval(arrayID))), duration: 0.45)
        }
        
        divider.animate(delay: 0.6)
        nextButton.show()
        easeInSurveyObject(object: nextButton, delay: 0.47, duration: 0.5)
    }
    
    final func bounceInSurveyObject(object: UIView, from origin: Card.Direction, delay: TimeInterval, duration: TimeInterval) {
        super.bounceInSurveyObject(object: object, from: origin, delay: delay, duration: delay, parent: self, completionAction: nil)
    }
    
    final func easeInSurveyObject(object: UIView, delay: TimeInterval, duration: TimeInterval) {
        super.easeInSurveyObject(object: object, from: .bottom, delay: delay, duration: duration, parent: self, completionAction: nil)
    }
    
    final func bounceIn(to anchorObject: UIView, parent: UIView, uponCompletion completionAction: (()->())?) {
        super.bounceIn(from: .bottom, to: anchorObject, spacingFactor: 0.03, parent: parent, completionAction: completionAction)
    }
    
    final func bounceOut(parent: UIView, completionAction: (() -> ())?) {
        super.bounceOut(to: .bottom, parent: parent, completionAction: completionAction)
    }
}
