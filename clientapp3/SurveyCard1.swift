//
//  SurveyCard1.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyCard1: SurveyCardWithTitle, UITextFieldDelegate{
    var parentView: UIView
    var bottomDividerLeft: HorizontalLine
    var bottomDividerRight: HorizontalLine
    var nameTextField: CustomTextField
    var nameTextLabel: CustomLabel
    var emailTextField: CustomTextField
    var emailTextLabel: CustomLabel
    var gradeTextLabel: CustomLabel
    var gradeButtons: [ImageButton]
    
    required init?(coder aDecoder: NSCoder) {
        parentView = aDecoder.decodeObject(forKey: "SurveyCard1-parentView") as! UIView
        bottomDividerLeft = aDecoder.decodeObject(forKey: "SurveyCard1-bottomDividerLeft") as! HorizontalLine
        bottomDividerRight = aDecoder.decodeObject(forKey: "SurveyCard1-bottomDividerRight") as! HorizontalLine
        nameTextField = aDecoder.decodeObject(forKey: "SurveyCard1-nameTextField") as! CustomTextField
        emailTextField = aDecoder.decodeObject(forKey: "SurveyCard1-emailTextField") as! CustomTextField
        nameTextLabel = aDecoder.decodeObject(forKey: "SurveyCard1-nameTextLabel") as! CustomLabel
        emailTextLabel = aDecoder.decodeObject(forKey: "SurveyCard1-emailTextLabel") as! CustomLabel
        gradeTextLabel = aDecoder.decodeObject(forKey: "SurveyCard1-gradeTextLabel") as! CustomLabel
        gradeButtons = aDecoder.decodeObject(forKey: "SurveyCard1-gradeButtons") as! [ImageButton]
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(parentView, forKey: "SurveyCard1-parentView")
        aCoder.encode(bottomDividerLeft, forKey: "SurveyCard1-bottomDividerLeft")
        aCoder.encode(bottomDividerRight, forKey: "SurveyCard1-bottomDividerRight")
        aCoder.encode(nameTextField, forKey: "SurveyCard1-nameTextField")
        aCoder.encode(emailTextField, forKey: "SurveyCard1-emailTextField")
        aCoder.encode(nameTextLabel, forKey: "SurveyCard1-nameTextLabel")
        aCoder.encode(emailTextLabel, forKey: "SurveyCard1-emailTextLabel")
        aCoder.encode(gradeTextLabel, forKey: "SurveyCard1-gradeTextLabel")
        aCoder.encode(gradeButtons, forKey: "SurveyCard1-gradeButtons")
        super.encode(with: aCoder)
    }
    
    override init(frame: CGRect) {
        parentView = UIView(frame: CGRect.zero)
        bottomDividerLeft = HorizontalLine()
        bottomDividerRight = HorizontalLine()
        nameTextField = CustomTextField(frame: CGRect.zero)
        emailTextField = CustomTextField(frame: CGRect.zero)
        nameTextLabel = CustomLabel(frame: CGRect.zero)
        emailTextLabel = CustomLabel(frame: CGRect.zero)
        gradeTextLabel = CustomLabel(frame: CGRect.zero)
        gradeButtons = [ImageButton]()
        super.init(frame: frame)
    }
    
    init(in parentView: UIView) {
        self.parentView = parentView
        self.bottomDividerLeft = HorizontalLine()
        self.bottomDividerRight = HorizontalLine()
        self.nameTextField = CustomTextField(frame: CGRect.zero)
        emailTextField = CustomTextField(frame: CGRect.zero)
        nameTextLabel = CustomLabel(frame: CGRect.zero)
        emailTextLabel = CustomLabel(frame: CGRect.zero)
        gradeTextLabel = CustomLabel(frame: CGRect.zero)
        gradeButtons = [ImageButton]()
        super.init(image: #imageLiteral(resourceName: "SurveyCard1-Medium"))
        
        setupCard()
        initializeTitle(shiftFactor: -0.39)
        initializeNameSection()
        initializeEmailSection()
        initializeNextButton()
        initializeGradeSection()
        initializeBottomDivider()
        nextButton.hide()
        hideBottomDivider()
    }
    
    override func setupCard() {
        self.center = parentView.center
        self.resizeProportionallyBy(.width, parent: parentView, byFactor: 0.83)
        super.setupCard()
    }

    func initializeTitle(shiftFactor: CGFloat){
        let titleText = "So, who are you?"
        initializeTitleLabel(text: titleText, lineWidthLimit: (2 * abs(shiftFactor) * self.frame.width), verticalOffsetFromCenter: -0.4)
        titleLabel.shiftOriginFromCenter(byFactor: shiftFactor, parent: self)
        initializeTitleUnderline()
    }
    
    func initializeNameSection(){
        nameTextLabel = CustomLabel.init(text: "Name:", style: .header3)
        nameTextLabel.centerInParent(self)
        nameTextLabel.translateByParentProportion(xFactor: 0, yFactor: -0.27, parent: self)
        nameTextLabel.shiftOriginFromCenter(byFactor: -0.4, parent: self)
        self.addSubview(nameTextLabel)
        
        nameTextField = CustomTextField.init(parent: self, widthFactor: 0.8, delegate: self, placeHolder: "Jane Appleseed", enableAutocorrect: false)
        nameTextField.absoluteRepositionFromObject(nameTextLabel, parent: self, xOffset: nil, yOffset: 5)
        nameTextField.autocapitalizationType = .allCharacters
        self.addSubview(nameTextField)
    }
    
    func initializeEmailSection(){
        emailTextLabel = CustomLabel(text: "Email:", style: .header3)
        emailTextLabel.centerInParent(self)
        emailTextLabel.translateByParentProportion(xFactor: 0, yFactor: -0.08, parent: self)
        emailTextLabel.shiftOriginFromCenter(byFactor: -0.4, parent: self)
        self.addSubview(emailTextLabel)
        
        emailTextField = CustomTextField(parent: self, widthFactor: 0.8, delegate: self, placeHolder: "jane@apple.ca")
        emailTextField.absoluteRepositionFromObject(emailTextLabel, parent: self, xOffset: nil, yOffset: 5)
        emailTextField.autocapitalizationType = .none
        self.addSubview(emailTextField)
    }
    
    func initializeGradeSection(){
        gradeTextLabel = CustomLabel(text: "Grade:", style: .header3)
        gradeTextLabel.centerInParent(self)
        gradeTextLabel.translateByParentProportion(xFactor: 0, yFactor: 0.11, parent: self)
        gradeTextLabel.shiftOriginFromCenter(byFactor: -0.4, parent: self)
        self.addSubview(gradeTextLabel)
        
        initializeGradeButtons()
    }
    
    func initializeGradeButtons(){
        //Initializes an array of images for buttons.
        let buttonInactiveImages: [UIImage] = [#imageLiteral(resourceName: "G9ButtonInactive-medium"), #imageLiteral(resourceName: "G10ButtonInactive-medium"), #imageLiteral(resourceName: "G11ButtonInactive-medium"), #imageLiteral(resourceName: "G12ButtonInactive-medium")]
        let buttonHighlightedImages: [UIImage] = [#imageLiteral(resourceName: "G9ButtonHighlighted-medium"), #imageLiteral(resourceName: "G10ButtonHighlighted-medium"), #imageLiteral(resourceName: "G11ButtonHighlighted-medium"), #imageLiteral(resourceName: "G12ButtonHighlighted-medium")]
        
        for buttonID in 0...3{
            //Initialize each button and move them below the grade label.
            gradeButtons.append(ImageButton(activeImage: buttonInactiveImages[buttonID], highlightedImage: buttonHighlightedImages[buttonID], parent: self, target: self, action: #selector(onGradeButtonClick)))
            gradeButtons[buttonID].resizeProportionallyBy(.width, parent: self, byFactor: 0.1225, mode: .positional)
            gradeButtons[buttonID].centerInParent(self)
            gradeButtons[buttonID].absoluteRepositionFromObject(gradeTextLabel, parent: self, xOffset: nil, yOffset: 7)
            
            //Set button tag
            gradeButtons[buttonID].tag = buttonID
            
            //Move each button horizontally to correct position, and add to view
            let buttonShiftFactor: CGFloat = (CGFloat(buttonID) - 1.5) * 0.163
            gradeButtons[buttonID].translateByParentProportion(xFactor: buttonShiftFactor, yFactor: 0, parent: self)
            self.addSubview(gradeButtons[buttonID])
        }
    }
    
    func onGradeButtonClick(sender: ImageButton!){
        /*
        var selectedGrade: Int
        
        switch sender.tag{
        case 0:
            selectedGrade = 9
        case 1:
            selectedGrade = 10
        case 2:
            selectedGrade = 11
        case 3:
            selectedGrade = 12
        default:
            fatalError("Received ImageButton with an invalid sender.")
        }
        */
        
        disableGradeButtons(except: sender.tag)
    }
    
    func disableGradeButtons(except excludedID: Int){
        let buttonInactiveImages: [UIImage] = [#imageLiteral(resourceName: "G9ButtonInactive-medium"), #imageLiteral(resourceName: "G10ButtonInactive-medium"), #imageLiteral(resourceName: "G11ButtonInactive-medium"), #imageLiteral(resourceName: "G12ButtonInactive-medium")]
        let buttonActiveImages: [UIImage] = [#imageLiteral(resourceName: "G9ButtonActive-medium"), #imageLiteral(resourceName: "G10ButtonActive-medium"), #imageLiteral(resourceName: "G11ButtonActive-medium"), #imageLiteral(resourceName: "G12ButtonActive-medium")]
        
        for buttonID in 0...(gradeButtons.count - 1){
            if buttonID == excludedID{
                gradeButtons[buttonID].setImage(buttonActiveImages[buttonID], for: .normal)
            }
            else{
                gradeButtons[buttonID].setImage(buttonInactiveImages[buttonID], for: .normal)
            }
        }
    }
    
    func initializeBottomDivider(){
        bottomDividerLeft = HorizontalLine.init(parent: self, verticalOffsetFactorFromCenter: 0, lengthFactor: 0.8, color: CustomColor.grey1, partialSection: .left)
        bottomDividerLeft.offsetVerticallyFromObject(nextButton, parent: self, offsetFactor: -0.04)
        self.layer.addSublayer(bottomDividerLeft)
        
        bottomDividerRight = HorizontalLine(parent: self, verticalOffsetFactorFromCenter: 0, lengthFactor: 0.8, color: CustomColor.grey1, partialSection: .right)
        bottomDividerRight.offsetVerticallyFromObject(nextButton, parent: self, offsetFactor: -0.04)
        self.layer.addSublayer(bottomDividerRight)
    }
    
    func animateBottomDivider(duration: CFTimeInterval, delay: CFTimeInterval, completionAction: ()?){
        bottomDividerRight.animate(duration: duration, delay: delay, completionAction: completionAction)
        bottomDividerLeft.animate(duration: duration, delay: delay, completionAction: completionAction)
    }
    
    func hideBottomDivider(){
        bottomDividerLeft.hide()
        bottomDividerRight.hide()
    }
    
    func initializeNextButton(){
        super.initializeNextButton(buttonTarget: self, buttonSelector: #selector(onButtonClick))
        nextButton.centerInParent(self)
        nextButton.relativeShiftFromEdge(x: nil, y: self.frame.height, byFactor: -0.1, parent: self)
    }
    
    func onButtonClick(){
        print("Button was clicked.")
    }
    
    func slideIn(to anchorObject: UIView, withSpacing spacingFactor: CGFloat) {
        super.slideIn(from: .bottom, to: anchorObject, spacingFactor: spacingFactor, duration: 0.5, parent: self.parentView, completionAction: loadBottomElements())
    }
    
    func loadBottomElements(){
        nextButton.show(delay: 0.5)
        animateBottomDivider(duration: 0.9, delay: 0.4, completionAction: nil)
    }
}
