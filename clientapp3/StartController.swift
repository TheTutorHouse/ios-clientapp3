//
//  StartController.swift
//  clientapp3
//
//  Created by Steven Xie on 15-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class StartController: UIViewController {
    
    var logoImage: StartLogoImage!
    var logoLabel: StartLogoLabel!
    var introCard: IntroCard!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColor.red
        logoLabel = StartLogoLabel(parent: view)
        logoImage = StartLogoImage(parent: view, logoLabel: logoLabel)
        introCard = IntroCard(parent: view, buttonTarget: self, buttonAction: #selector(onButtonClick))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        shiftUpLogo()
    }
    
    func shiftUpLogo(){
        logoLabel.shiftUp(parent: view)
        logoImage.shiftUp(parent: view, logoLabel: logoLabel, uponComplete: slideInCard)
    }
    
    func slideInCard(){
        introCard.animate(parent: view, anchorObject: logoLabel)
    }
    
    func onButtonClick(){
        //saveProgramState()
        introCard.slideOut(parent: view)
        logoLabel.fadeOut(uponCompletion: loadNextController)
    }
    
    func loadNextController(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let surveyVC: SurveyController = storyboard.instantiateViewController(withIdentifier: "SurveyController1") as! SurveyController
        surveyVC.logoImage = logoImage
        let window = UIApplication.shared.windows[0]
        window.rootViewController = surveyVC
    }
}
