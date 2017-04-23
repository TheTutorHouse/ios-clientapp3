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
    @IBOutlet weak var contentView: UIView!
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(contentView: contentView, textFieldSequence: [surveyCard1.nameField, surveyCard1.emailField], nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        initializeContents()
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
    
    func initializeContents(){
        surveyCard1 = SurveyCard1(parent: contentView, nextButtonTarget: self, nextButtonAction: #selector(onNextButtonClick(_:)), textFieldDelegate: self)
        surveyCard2 = SurveyCard2(parent: contentView, nextbuttonTarget: self, nextbuttonAction: #selector(onNextButtonClick(_:)))
    }
    
    func showCard(_ identifier: Int){
        switch identifier{
        case 0:
            currentCard.bounceOut(to: .bottom, parent: contentView, completionAction: nil)
            surveyCard1.animate(parent: view, anchorObject: logoImage)
        case 1:
            currentCard.bounceOut(to: .bottom, parent: contentView, completionAction: nil)
            logoImage.animate(version: .small, delay: 0.2, parent: contentView, uponCompletion: {
                self.surveyCard2.animate(parent: self.contentView, anchorObject: self.logoImage)
            })
            currentCard = surveyCard2
        case 2:
            currentCard.bounceOut(to: .bottom, parent: contentView, completionAction: nil)
        default:
            fatalError("SurveyController attempted to show an undefined card.")
        }
    }
    
    func onNextButtonClick(_ sender: CustomButton!){
        showCard(sender.tag)
    }
}
