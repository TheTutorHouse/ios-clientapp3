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
        
        if verbosityLevel >= 3{
            print("Method viewDidLoad was run from StartController.")
        }
        
        //Settings:
        let titleLabelVerticalShiftConstant: CGFloat = 25
        let titleImageSizeFactor: CGFloat = 0.22
        let titleElementSpacing: CGFloat = -17
        
        //Initialize background color
        view.backgroundColor = FillColor.red
        if verbosityLevel >= 3{
            print("...Start background color initialized...")
        }
        
        //Initialize title label
        companyNameLabel = stylizedLabel(text: companyName, fontSize: FontSize.logo, fontStyle: "DemiBold", fontColor: UIColor.white)
        companyNameLabel.center = view.center
        companyNameLabel.center.y += titleLabelVerticalShiftConstant
        view.addSubview(companyNameLabel)
        if verbosityLevel >= 3{
            print("...Start Screen Title initialized...")
        }
        
        //Initialize title image in relation to title label
        companyLogoImage = UIImageView(image: #imageLiteral(resourceName: "MainLogo"))
        companyLogoImage.center = view.center
        resizeObject(object: companyLogoImage, parentView: view, scaleFactor: titleImageSizeFactor)
        setRelativePosition(of: companyLogoImage, to: companyNameLabel, by: titleElementSpacing)
        view.addSubview(companyLogoImage)
        if verbosityLevel >= 3{
            print("...Start Screen Logo initialized...")
        }
        
        if verbosityLevel >= 2{
            print("...All subviews have been initialized through viewDidLoad.")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if verbosityLevel >= 3{
            print("Method viewWillAppear was run from StartController.")
        }
        
        if verbosityLevel >= 2{
            print("...All initial view animations have finished initializing through viewWillAppear.")
        }
    }
}
