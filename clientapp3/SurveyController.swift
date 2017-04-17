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

    override func viewDidLoad() {
        super.viewDidLoad()

        if verbosityLevel >= 3{
            print("Method viewDidLoad was run from StartController.")
        }
        
        view.backgroundColor = FillColor.red
        view.addSubview(companyLogoImage)
        
    }
    
    func gays(){
        
    }

}
