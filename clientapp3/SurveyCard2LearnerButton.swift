//
//  SurveyCard2LearnerButton.swift
//  clientapp3
//
//  Created by Steven Xie on 23-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyCard2LearnerButton: CustomButton{
    var indicator: UIImageView
    var isChosen: Bool = false
    
    required init?(coder aDecoder: NSCoder) {
        indicator = aDecoder.decodeObject(forKey: "SurveyCard2LearnerButton-indicator") as! UIImageView
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        indicator = UIImageView.init(frame: frame)
        super.init(frame: frame)
    }
    
    enum LearnerType{
        case visual, auditory, kinesthetic
    }
    
    init(parent: UIView, learnerType: LearnerType, target: Any, action: Selector){
        indicator = UIImageView(frame: CGRect.zero)
        var normalImage: UIImage
        var highlightedImage: UIImage
        
        switch learnerType{
        case .visual:
            normalImage = #imageLiteral(resourceName: "VisualLearnerButton-Inactive")
            highlightedImage = #imageLiteral(resourceName: "VisualLearnerButton-Highlighted")
        case .auditory:
            normalImage = #imageLiteral(resourceName: "AuditoryLearnerButton-Inactive")
            highlightedImage = #imageLiteral(resourceName: "AuditoryLearnerButton-Highlighted")
        case .kinesthetic:
            normalImage = #imageLiteral(resourceName: "KinestheticLearnerButton-Inactive")
            highlightedImage = #imageLiteral(resourceName: "KinestheticLearnerButton-Highlighted")
        }
        
        super.init(activeImage: normalImage, highlightedImage: highlightedImage, parent: parent, target: target, action: action)
        self.resizeProportionally(on: .horizontal, by: 0.7, parent: parent, relative: true)
        self.initializeButtonTags(for: learnerType)
        self.setPosition(tag: self.tag, parent: parent)
        self.initializeIndicator()
        parent.addSubview(self)
    }
    
    func initializeButtonTags(for learnerType: LearnerType){
        switch learnerType {
        case .visual:
            self.tag = 1
        case .auditory:
            self.tag = 2
        case .kinesthetic:
            self.tag = 3
        }
    }
    
    private func initializeIndicator(){
        indicator = UIImageView(image: #imageLiteral(resourceName: "RoundLearnerButtonIndicator"))
        indicator.sizeToFit()
        indicator.resizeProportionally(on: .horizontal, by: 0.01, parent: self, relative: true)
        indicator.centerInParent(self)
        indicator.center.x = self.frame.width * 0.8697
        indicator.alpha = 0
        self.addSubview(indicator)
    }
    
    func popInIndicator(delay: TimeInterval){
        indicator.resizeProportionally(on: .horizontal, by: 0.01, parent: self, relative: true)
        UIView.animate(withDuration: 0.1, delay: delay, options: .curveEaseInOut, animations: {
            self.indicator.alpha = 1
        }, completion: nil)
        UIView.animate(withDuration: 0.45, delay: delay, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.6, options: [], animations: {
            self.indicator.resizeProportionally(on: .horizontal, by: 0.092, parent: self, relative: true)
        }, completion: nil)
    }
    
    func fadeOutIndicator(delay: TimeInterval){
        UIView.animate(withDuration: 0.45, delay: delay, options: .curveEaseInOut, animations: {
            self.indicator.alpha = 0
        }, completion: nil)
    }
    
    func setPosition(tag: Int, parent: UIView){
        let spacing: CGFloat = 0.1575
        self.centerInParent(parent)
        self.translate(by: CGFloat(-1.8 + Double(tag)) * spacing, axis: .vertical, parent: parent, relative: true)
    }
}
