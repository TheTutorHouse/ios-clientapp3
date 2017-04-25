//
//  IntroCardBeginButton.swift
//  clientapp3
//
//  Created by Steven Xie on 20-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class IntroCardBeginButton: CustomButton{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(parent: UIView, target: Any, action: Selector){
        let defaults = UserDefaults.standard
        if let surveyProgress = defaults.object(forKey: "surveyProgress") as? String{
            if surveyProgress == "started"{
                super.init(activeImage: #imageLiteral(resourceName: "ContinueButton-Regular"), highlightedImage: #imageLiteral(resourceName: "ContinueButtonHighlighted-Regular"), parent: parent, target: target, action: action)
            }
            else{
                super.init(activeImage: #imageLiteral(resourceName: "BeginButton-Regular"), highlightedImage: #imageLiteral(resourceName: "BeginButtonHighlighted-Regular"), parent: parent, target: target, action: action)
            }
        }
        else{
            super.init(activeImage: #imageLiteral(resourceName: "BeginButton-Regular"), highlightedImage: #imageLiteral(resourceName: "BeginButtonHighlighted-Regular"), parent: parent, target: target, action: action)
        }
        
        
        self.centerInParent(parent)
        var amount: CGFloat{
            switch Display.type{
            case .iphone5: return -0.12
            default: return -0.14
            }
        }
        self.shiftFrom(position: parent.frame.height, by: amount, axis: .vertical, parent: parent, relative: true)
        parent.addSubview(self)
    }
    
    func fadeIn(delay: TimeInterval) {
        super.fadeIn(duration: 0.4, delay: delay, uponComplete: nil)
    }
}
