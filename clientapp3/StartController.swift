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
        self.animateIn()
    }
    
    func animateIn(){
        logoLabel.shiftUp(parent: view)
        logoImage.shiftUp(parent: view, logoLabel: logoLabel, uponCompletion: showCard)
    }
    
    func showCard(){
        introCard.animate(parent: view, anchorObject: logoLabel)
    }
    
    func animateOut(){
        introCard.slideOut(parent: view)
        logoLabel.fadeOut(uponCompletion: loadNextController)
    }
    
    func onButtonClick(){
        //saveProgramState()
        animateOut()
    }
    
    func loadNextController(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let surveyVC: SurveyController = storyboard.instantiateViewController(withIdentifier: "SurveyController1") as! SurveyController
        surveyVC.logoImage = logoImage
        let window = UIApplication.shared.windows[0]
        window.rootViewController = surveyVC
    }
}
