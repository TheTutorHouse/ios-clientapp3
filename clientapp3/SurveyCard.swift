//
//  SurveyCard.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyCard: Card{
    var nextButton: CustomButton
    
    required init?(coder aDecoder: NSCoder) {
        nextButton = aDecoder.decodeObject(forKey: "SurveyCard-nextButton") as! CustomButton
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(nextButton, forKey: "SurveyCard-nextButton")
        super.encode(with: aCoder)
    }
    
    override init(frame: CGRect) {
        nextButton = CustomButton(frame: CGRect.zero)
        super.init(frame: frame)
    }
    
    init(image: UIImage?, parent: UIView, xSizeFactor: CGFloat = 0.83, buttonTarget: Any, buttonAction: Selector, buttonTag: Int){
        nextButton = CustomButton(frame: CGRect.zero)
        super.init(image: image, parent: parent, xSizeFactor: xSizeFactor)
        
        initializeNextButton(target: buttonTarget, action: buttonAction, tag: buttonTag)
    }
    
    private func initializeNextButton(target: Any, action: Selector, tag: Int){
        nextButton = CustomButton.init(activeImage: #imageLiteral(resourceName: "NextButton-Medium"), highlightedImage: #imageLiteral(resourceName: "NextButtonHighlighted-Medium"), parent: self, target: target, action: action, inactiveImage: #imageLiteral(resourceName: "NextButtonInactive-Medium"))
        nextButton.centerInParent(self)
        nextButton.shiftFrom(position: self.frame.height, by: -0.1, axis: .vertical, parent: self, relative: true)
        nextButton.tag = tag
        self.addSubview(nextButton)
    }
    
    func hideSurveyObjects(_ objects: [UIView]){
        for object in objects{
            object.alpha = 0
        }
    }
    
    func slideInSurveyObject(object: UIView, from origin: Direction = .right, delay: TimeInterval = 0, duration: TimeInterval = 0.5, parent: UIView, completionAction: (()->())?){
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
        
        object.alpha = 1
        
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            object.center = objectOriginalPosition
        }, completion: {finished in
            if let completionAction = completionAction{
                completionAction()
            }
        })
    }
    
    func easeInSurveyObject(object: UIView, from origin: Direction = .right, delay: TimeInterval = 0, duration: TimeInterval = 0.5, parent: UIView, completionAction: (()->())?){
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
        
        object.alpha = 1
        
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseInOut, animations: {
            object.center = objectOriginalPosition
        }, completion:{finished in
            if let completionAction = completionAction{
                completionAction()
            }
        })
    }
}
