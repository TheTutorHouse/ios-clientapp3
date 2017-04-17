//
//  SurveyController.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyController: UIViewController {
    
    var companyLogoImage: UIImageView!
    @IBOutlet weak var contentView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if verbosityLevel >= 3{
            print("Method viewDidLoad was run from StartController.")
        }
        
        contentView.backgroundColor = FillColor.red
        contentView.addSubview(companyLogoImage)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //popInContactDetailsCard()
    }
    
    
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

}
