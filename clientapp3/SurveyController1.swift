//
//  SurveyController.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyController1: UIViewController {
    
    var companyLogoImage: UIImageView!
    @IBOutlet weak var contentView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.backgroundColor = CustomColor.red
        contentView.addSubview(companyLogoImage)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initializeSurveyCard1()
    }
    
    var surveyCard1 = SurveyCard1(frame: CGRect.zero)
    func initializeSurveyCard1(){
        surveyCard1 = SurveyCard1(in: view)
        contentView.addSubview(surveyCard1)
        surveyCard1.slideIn(to: companyLogoImage, withSpacing: 0.03)
    }
    
    /*
    //First Survey Question - Contact Details
    //Settings:
    var contactDetailsCard: UIImageView!
    var contactDetailsCardTitle: UILabel!
    var contactDetailsCardTitleUnderline: CAShapeLayer!
    var contactDetailsCardNameLabel: UILabel!
    var contactDetailsCardNameField: UITextField!
    var contactDetailsCardEmailLabel: UILabel!
    var contactDetailsCardEmailField: UITextField!
    var contactDetailsCardGradeLabel: UILabel!
    var contactDetailsCardGradeButtons: [UIButton]!
    var contactDetailsCardLowerDivider: CAShapeLayer!
    var contactDetailsCardNextButton: UIButton!
    
    //Method:
    func popInContactDetailsCard(){
    }
    */

}
