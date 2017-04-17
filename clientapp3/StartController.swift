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
        view.backgroundColor = FillColor.red
        
        //Initialize title label
        companyNameLabel = CustomLabel(text: "The Tutor House", fontSize: FontSize.logo, fontWeight: "DemiBold", fontColor: UIColor.white)
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
            self.companyNameLabel.translateByParentProportion(xFactor: 0, yFactor: -0.215, parent: self.view, mode: .positional)
        }, completion: nil)
        
        //Move Image
        UIView.animate(withDuration: 0.7, delay: 0.7, options: [.curveEaseInOut], animations: {
            self.companyLogoImage.repositionFromObject(self.companyNameLabel, parent: self.view, xOffsetFactor: 0, yOffsetFactor: -0.01, mode: .positional)
        }, completion: { (finished: Bool) in
            self.initializeIntroCard()
        })
    }
    
    var introCard = IntroCard(frame: CGRect.zero)
    func initializeIntroCard(){
        introCard = IntroCard(in: view)
        view.addSubview(introCard)
        introCard.slideIn(completionAction: nil)
    }
    
    /*
    func startSurvey(){
        if verbosityLevel >= 3{
            print("\nMethod startSurvey was run from StartController...")
        }
        
        //Hide intro card.
        //Settings:
        let introCardAnimationDelay: TimeInterval = 0.15
        let introCardAnimationDuration: TimeInterval = 1.0
        //Animation:
        UIView.animate(withDuration: introCardAnimationDuration, delay: introCardAnimationDelay, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.4, options: [], animations: {
            self.introCard.transform = CGAffineTransform.init(translationX: 0, y: self.view.frame.height)
        }, completion: { (finished: Bool) in
            self.introCard = UIImageView(frame: CGRect.zero)
            if verbosityLevel >= 3{
                print("...Intro card is now hidden, card data unloaded and reset.")
            }
        })
        
        //Hide title label.
        //Settings:
        let titleAnimationDuration: TimeInterval = 0.5
        let titleLabelDelay: TimeInterval = 0.25
        //Animation:
        UIView.animate(withDuration: titleAnimationDuration, delay: titleLabelDelay, options: [.curveEaseInOut], animations: {
            self.companyNameLabel.alpha = 0
        }, completion: { (finished: Bool) in
            self.companyNameLabel = UILabel()
            if verbosityLevel >= 3{
                print("...Finished animating the title label fadeout. Title data unloaded and reset.")
            }
            self.loadSurveyController()
        })
    }
    
    //Loads next viewcontroller, replacing the current one as root controller.
    func loadSurveyController(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let surveyVC: SurveyController = storyboard.instantiateViewController(withIdentifier: "SurveyController") as! SurveyController
        surveyVC.companyLogoImage = companyLogoImage
        let window = UIApplication.shared.windows[0]
        window.rootViewController = surveyVC
    }
    */
}
