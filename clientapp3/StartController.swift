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
    var companyNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Starting output log with a verbosity level of \(verbosityLevel); to change this, please see Options.swift\n.")
        
        if verbosityLevel >= 3{
            print("Method viewDidLoad was run from StartController.")
        }
        
        //Initialize background color
        view.backgroundColor = FillColor.red
        if verbosityLevel >= 3{
            print("...Start background color initialized...")
        }
        
        //Initialize title label
        //Settings:
        let titleLabelVerticalShiftConstant: CGFloat = 25
        let titleImageSizeFactor: CGFloat = 0.23
        let titleElementSpacing: CGFloat = -17
        //Init:
        companyNameLabel = stylizedLabel(text: companyName, fontSize: FontSize.logo, fontStyle: "DemiBold", fontColor: UIColor.white)
        //Position & Sizing:
        companyNameLabel.center = view.center
        companyNameLabel.center.y += titleLabelVerticalShiftConstant
        //Adding:
        view.addSubview(companyNameLabel)
        if verbosityLevel >= 3{
            print("...Start Screen Title initialized...")
        }
        
        //Initialize title image in relation to title label
        //Init
        companyLogoImage = UIImageView(image: #imageLiteral(resourceName: "MainLogo"))
        //Position & Sizing
        companyLogoImage.center = view.center
        resizeObjectByWidth(object: companyLogoImage, parentView: view, widthFactor: titleImageSizeFactor)
        setRelativePosition(of: companyLogoImage, to: companyNameLabel, by: titleElementSpacing)
        //Adding
        view.addSubview(companyLogoImage)
        if verbosityLevel >= 3{
            print("...Start Screen Logo initialized...")
        }
        
        if verbosityLevel >= 2{
            print("...All subviews have been initialized through viewDidLoad.\n")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if verbosityLevel >= 3{
            print("\nMethod viewWillAppear was run from StartController.")
        }
        
        //Call function to move up title elements.
        shiftUpTitleElements()
        
        if verbosityLevel >= 2{
            print("...viewWillAppear process has finished loading.\n")
        }
    }
    
    //Make room for first card by moving up title elements.
    func shiftUpTitleElements(){
        if verbosityLevel >= 3{
            print("Method shiftUpTitleElements will now shift up title elements...")
        }
        
        //Settings:
        //Spacing/Positioning
        let titleLabelShiftFactor: CGFloat = -0.215
        let titleSpacingFactor: CGFloat = -10
        //Animation
        let titleAnimationSpeed: Double = 0.7
        let titleImageDelay: TimeInterval = 0.7
        let titleLabelDelay: TimeInterval = titleImageDelay
        
        
        //Move title screen elements upwards to make room for the first card.
        //Move Label
        UIView.animate(withDuration: TimeInterval(0.5 * (1/titleAnimationSpeed)), delay: titleLabelDelay, options: [.curveEaseInOut], animations: {
            repositionObject(object: self.companyNameLabel, parentView: self.view, shiftFactor: titleLabelShiftFactor)
        }, completion: { (finished: Bool) in
            if verbosityLevel >= 3{
                print("...Finished animating the title label shift.")
            }
        })
        //Move Image
        UIView.animate(withDuration: TimeInterval(0.5 * (1/titleAnimationSpeed)), delay: titleImageDelay, options: [.curveEaseInOut], animations: {
            setRelativePosition(of: self.companyLogoImage, to: self.companyNameLabel, by: titleSpacingFactor)
        }, completion: { (finished: Bool) in
            if verbosityLevel >= 3{
                print("...Finished animating the title image shift.")
            }
            
            //Function completion
            if verbosityLevel >= 2{
                print("...All title elements have been shifted to make room for the first card.")
            }
            self.popInIntroCard()
        })
    }
    
    
    //Generate intro card, and make it pop in from the bottom.
    var introCard: UIImageView!
    var introCardTitle: UILabel!
    var introCardHeader: UILabel!
    var introCardBody: UILabel!
    var introCardStartButton: UIButton!
    var introCardTitleUnderline: CAShapeLayer!
    
    func popInIntroCard(){
        if verbosityLevel >= 3{
            print("\nMethod popInIntroCard started.")
        }
        
        //Initialize card background.
        //Settings:
        let cardWidthFactor: CGFloat = 0.83
        //Init
        introCard = UIImageView(image: #imageLiteral(resourceName: "IntroCard-Medium"))
        introCard.isUserInteractionEnabled = true
        //Positioning & Sizing
        introCard.center = view.center
        introCard.center.y += view.frame.height
        reframeObjectByWidth(object: introCard, parentView: view, widthFactor: cardWidthFactor)
        //Adding
        view.addSubview(introCard)
        if verbosityLevel >= 3{
            print("...Card background initialized...")
        }
        
        //Initialize card title.
        //Settings:
        let titleVerticalPositionFactor: CGFloat = -0.365
        let introLabelText = "Welcome!"
        //Init
        introCardTitle = centeredCardLabel(forCard: introCard, labelVerticalOffsetFactor: titleVerticalPositionFactor, labelText: introLabelText, labelFontSize: FontSize.header1, labelFontStyle: "Medium", labelFontColor: FontColor.headerGrey)
        //Adding
        introCard.addSubview(introCardTitle)
        if verbosityLevel >= 3{
            print("...Card title initialized...\n")
        }
        
        //Initialize title underline.
        //Settings:
        let introTitleLineOffsetX: CGFloat = 0.1
        let introTitleLineOffsetY: CGFloat = 0.03
        //Init:
        introCardTitleUnderline = cardTitleUnderLine(forCard: introCard, forTitle: introCardTitle, horizontalOffset: introTitleLineOffsetX, verticalOffset: introTitleLineOffsetY, color: FillColor.red)
        //Adding:
        introCard.layer.addSublayer(introCardTitleUnderline)
        if verbosityLevel >= 3{
            print("...Card title underline layer initialized...\n")
        }
        
        //Initialize intro card header label.
        //Settings:
        let headerVerticalPositionFactor: CGFloat = -0.175 //Factored shift from center.
        let headerLeadingShiftFactor: CGFloat = -0.39 //Factored origin shift from center.
        let headerLabelText = "Need a tutor?"
        //Init
        introCardHeader = centeredCardLabel(forCard: introCard, labelVerticalOffsetFactor: headerVerticalPositionFactor, labelText: headerLabelText, labelFontSize: FontSize.body, labelFontStyle: "Medium", labelFontColor: FontColor.headerGrey2)
        introCardHeader.frame.origin.x = relativeCenterPoint(introCard).x + (introCard.frame.width * headerLeadingShiftFactor)
        //Adding
        introCard.addSubview(introCardHeader)
        if verbosityLevel >= 3{
            print("...Card header initialized...\n")
        }
        
        //Initialize intro card body label.
        //Settings:
        let bodyVerticalShiftAmount: CGFloat = 7 //Factored shift from header.
        let bodyLeadingShiftFactor: CGFloat = headerLeadingShiftFactor //Factored origin shift from center.
        let bodyLabelText = "Complete this one-minute match so we can find the tutor that’s right for you!"
        //Init
        introCardBody = centeredCardLabel(forCard: introCard, labelVerticalOffsetFactor: 0, labelText: bodyLabelText, labelFontSize: FontSize.body, labelFontStyle: nil, labelFontColor: FontColor.bodyGrey, lineWidthLimiter: (introCard.frame.width * abs(bodyLeadingShiftFactor) * 2))
        //Position & Size
        introCardBody.frame.origin.x = relativeCenterPoint(introCard).x + (introCard.frame.width * bodyLeadingShiftFactor)
        setRelativePosition(of: introCardBody, to: introCardHeader, by: bodyVerticalShiftAmount)
        //Adding
        introCard.addSubview(introCardBody)
        if verbosityLevel >= 3{
            print("...Card body initialized...\n")
        }
        
        //Initialize intro card begin button.
        //Settings:
        let startButtonBottomSpacingFactor: CGFloat = -0.125
        //Init
        introCardStartButton = fixedSizeImageButton(activeImage: #imageLiteral(resourceName: "BeginButton-Regular"), highlightedImage: #imageLiteral(resourceName: "BeginButtonHighlighted-Regular"))
        introCardStartButton.setTitle("Gays.", for: .normal)
        introCardStartButton.addTarget(self, action: #selector(startSurvey), for: .touchUpInside)
        //Position & Size
        centerInParentView(object: introCardStartButton, parentView: introCard)
        introCardStartButton.center.y = introCard.frame.height - (introCardStartButton.frame.height/2) + startButtonBottomSpacingFactor * introCard.frame.height
        //Adding
        introCard.addSubview(introCardStartButton)
        if verbosityLevel >= 3{
            print("...Card start button initialized...\n")
        }
        
        //Animate card slidein.
        //Settings:
        let introCardAnimationDelay: TimeInterval = 0
        let introCardAnimationDuration: TimeInterval = 0.5
        let introCardToTitleLabelSpacingFactor: CGFloat = 0.03
        //Animation:
        UIView.animate(withDuration: introCardAnimationDuration, delay: introCardAnimationDelay, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            self.introCard.transform = CGAffineTransform.init(translationX: 0, y: positionOffset(from: self.introCard, to: self.companyNameLabel, spacing: self.view.frame.height * introCardToTitleLabelSpacingFactor))
        }, completion: { (finished: Bool) in
            if verbosityLevel >= 2{
            print("...Entire intro card has finished loading and animating.")
            }
        })
    }
    
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
    
    func loadSurveyController(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let surveyVC: SurveyController = storyboard.instantiateViewController(withIdentifier: "SurveyController") as! SurveyController
        surveyVC.companyLogoImage = companyLogoImage
        let window = UIApplication.shared.windows[0]
        window.rootViewController = surveyVC
    }
}
