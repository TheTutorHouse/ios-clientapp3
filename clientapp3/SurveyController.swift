//
//  SurveyController.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyController: ControllerWithKeyboard {
    
    var logoImage: LogoImage!
    var surveyCard1: SurveyCard1!
    var surveyCard2: SurveyCard2!
    var surveyCard3: SurveyCard3!
    var currentCard: Card!
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(textFieldSequence: [surveyCard1.nameField, surveyCard1.emailField], nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        surveyCard1 = SurveyCard1(parent: contentView, nextButtonTarget: self, nextButtonAction: #selector(onNextButtonClick(_:)), textFieldDelegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        surveyCard1.animate(parent: contentView, anchorObject: logoImage)
        currentCard = surveyCard1
    }
    
    func initialize(){
        view.backgroundColor = CustomColor.red
        contentView.backgroundColor = CustomColor.red
        contentView.addSubview(logoImage)
        contentView.frame.size = view.frame.size
    }
    
    func showCard(_ identifier: Int){
        switch identifier{
        case 0:
            currentCard.bounceOut(to: .bottom, parent: contentView, completionAction: nil)
            surveyCard1 = SurveyCard1(parent: contentView, nextButtonTarget: self, nextButtonAction: #selector(onNextButtonClick(_:)), textFieldDelegate: self)
            logoImage.animate(version: .large, delay: 0.1, parent: contentView, uponCompletion: {
                self.surveyCard1.animate(parent: self.contentView, anchorObject: self.logoImage)
            })
            currentCard = surveyCard1
        case 1:
            currentCard.bounceOut(to: .bottom, parent: contentView, completionAction: nil)
            surveyCard2 = SurveyCard2(parent: contentView, nextButtonTarget: self, nextButtonAction: #selector(onNextButtonClick(_:)))
            
            if currentCard != surveyCard3{
                logoImage.animate(version: .small, delay: 0.2, parent: contentView, uponCompletion: {
                    self.surveyCard2.animate(parent: self.contentView, anchorObject: self.logoImage, delay: 0)
                })
            }
            else{
                self.surveyCard2.animate(parent: self.contentView, anchorObject: self.logoImage, delay: 0.7)
            }
            
            currentCard = surveyCard2
        case 2:
            currentCard.bounceOut(to: .bottom, parent: contentView, completionAction: nil)
            surveyCard3 = SurveyCard3(parent: contentView, nextButtonTarget: self, nextButtonAction: #selector(onNextButtonClick(_:)))
            surveyCard3.animate(parent: contentView, anchorObject: logoImage)
            currentCard = surveyCard3
        default:
            fatalError("SurveyController attempted to show an undefined card.")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == surveyCard1.nameField || textField == surveyCard1.emailField{
            if surveyCard1.contentsAreValid(textField: textField) == true{
                if textField == surveyCard1.nameField{
                    surveyCard1.nameIsValid = true
                }
                else if textField == surveyCard1.emailField{
                    surveyCard1.emailIsValid = true
                }
            }
            else{
                if textField == surveyCard1.nameField{
                    surveyCard1.nameIsValid = false
                }
                else if textField == surveyCard1.emailField{
                    surveyCard1.emailIsValid = false
                }
            }
        }
    }
    
    func onNextButtonClick(_ sender: CustomButton!){
        showCard(sender.tag)
    }
}
