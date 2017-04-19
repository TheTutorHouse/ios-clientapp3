//
//  StartController.swift
//  clientapp3
//
//  Created by Steven Xie on 15-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class StartController: UIViewController {
    
    var companyLogoImage: UIImageView!
    var companyNameLabel: CustomLabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize background color
        view.backgroundColor = CustomColor.red
        
        //Initialize title label
        companyNameLabel = CustomLabel(text: "The Tutor House", fontSize: CustomFontSize.logo, fontWeight: "DemiBold", fontColor: UIColor.white)
        companyNameLabel.centerInParent(view)
        companyNameLabel.translateByParentProportion(xFactor: 0, yFactor: 0.037, parent: view)
        view.addSubview(companyNameLabel)
        
        //Initialize title image in relation to title label
        companyLogoImage = UIImageView(image: #imageLiteral(resourceName: "MainLogo"))
        companyLogoImage.resizeProportionallyBy(.width, parent: view, byFactor: 0.23)
        companyLogoImage.repositionFromObject(companyNameLabel, parent: view, xOffsetFactor: 0, yOffsetFactor: -0.025)
        view.addSubview(companyLogoImage)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Call function to move up title elements.
        shiftUpTitleElements()
    }
    
    //Make room for first card by moving up title elements.
    func shiftUpTitleElements(){
        //Move Label
        UIView.animate(withDuration: 0.7, delay: 0.7, options: [.curveEaseInOut], animations: {
            self.companyNameLabel.translateByParentProportion(xFactor: 0, yFactor: -0.225, parent: self.view, mode: .positional)
        }, completion: nil)
        
        //Move Image
        UIView.animate(withDuration: 0.7, delay: 0.7, options: [.curveEaseInOut], animations: {
            self.companyLogoImage.repositionFromObject(self.companyNameLabel, parent: self.view, xOffsetFactor: 0, yOffsetFactor: -0.0175, mode: .positional)
        }, completion: { (finished: Bool) in
            self.initializeIntroCard()
        })
    }
    
    var introCard = IntroCard(frame: CGRect.zero)
    func initializeIntroCard(){
        introCard = IntroCard(in: view, buttonTarget: self, buttonSelector: #selector(onButtonClick))
        view.addSubview(introCard)
        introCard.slideIn(to: companyNameLabel, completionAction: {introCard.button.show(delay: 0.05)}())
    }
    
    func onButtonClick(){
        //saveData()
        
        //Hide card
        introCard.slideOut(delay: 0.1, parent: view, completionAction: nil)
        
        //Fade out label
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.curveEaseInOut], animations: {
            self.companyNameLabel.alpha = 0
        }, completion: { (finished: Bool) in
            self.loadNextController()
        })
    }
    
    func loadNextController(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let surveyVC: SurveyController1 = storyboard.instantiateViewController(withIdentifier: "SurveyController1") as! SurveyController1
        surveyVC.companyLogoImage = companyLogoImage
        let window = UIApplication.shared.windows[0]
        window.rootViewController = surveyVC
    }
}
