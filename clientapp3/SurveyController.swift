//
//  SurveyController.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyController: UIViewController {
    
    var logoImage: UIImageView!
    var lastSenderTag: Int = 1
    var surveyCard1: SurveyCard1!
    @IBOutlet weak var contentView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.backgroundColor = CustomColor.red
        contentView.addSubview(logoImage)
        surveyCard1 = SurveyCard1(parent: view, nextButtonTarget: self, nextButtonAction: #selector(onNextButtonClick(_:)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        surveyCard1.animate(parent: view, anchorObject: logoImage)
    }
    
    func showCard(){
        switch lastSenderTag{
        case 1:
            print("gay...")
        default:
            fatalError("SurveyController attempted to show an undefined card.")
        }
    }
    
    func onNextButtonClick(_ sender: CustomButton!){
        lastSenderTag = sender.tag
        switch sender.tag{
        case 1:
            surveyCard1.slideOut(parent: view, completionAction: showCard)
        default:
            fatalError("SurveyController attempted to initiate action from an undefined button tag.")
        }
    }
}
