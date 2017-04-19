//
//  SurveyCard.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyCard: Card{
    var nextButton: ImageButton
    
    required init?(coder aDecoder: NSCoder) {
        nextButton = aDecoder.decodeObject(forKey: "SurveyCard-nextButton") as! ImageButton
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(nextButton, forKey: "SurveyCard-nextButton")
        super.encode(with: aCoder)
    }
    
    override init(frame: CGRect) {
        nextButton = ImageButton(frame: CGRect.zero)
        super.init(frame: frame)
    }
    
    override init(image: UIImage?){
        nextButton = ImageButton(frame: CGRect.zero)
        super.init(image: image)
    }
    
    func initializeNextButton(buttonTarget: Any, buttonSelector: Selector){
        nextButton = ImageButton.init(activeImage: #imageLiteral(resourceName: "NextButton-Medium"), highlightedImage: #imageLiteral(resourceName: "NextButtonHighlighted-Medium"), parent: self, target: buttonTarget, action: buttonSelector, inactiveImage: #imageLiteral(resourceName: "NextButtonInactive-Medium"))
        nextButton.centerInParent(self)
        nextButton.center.y = self.frame.height - (nextButton.frame.height/2) - 57.5
        self.addSubview(nextButton)
    }
    
    func slideInSurveyObject(object: UIView, from origin: Direction = .right, delay: TimeInterval = 0, duration: TimeInterval = 0.5, parent: UIView, completionAction: ()?){
        let objectOriginalPosition = object.center
        
        switch origin{
        case .top:
            object.center.y -= parent.frame.height
        case .bottom:
            object.center.y += parent.frame.height
        case .left:
            object.center.x -= parent.frame.width
        case .right:
            object.center.x += parent.frame.width
        }
        
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            object.center = objectOriginalPosition
        }, completion: {finished in completionAction})
    }
}
