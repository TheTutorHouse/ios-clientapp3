//
//  Card.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class Card: UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(image: UIImage?){
        super.init(image: image)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    enum Direction {
        case top, bottom, left, right
    }
    
    func slideIn(from origin: Direction = .bottom, to anchorObject: UIView, spacingFactor: CGFloat, delay: TimeInterval = 0,duration: TimeInterval = 0.5, parent: UIView, completionAction: ()?){
        self.centerInParent(parent)
        
        switch origin{
        case .top:
            self.center.y -= parent.frame.height
        case .bottom:
            self.center.y += parent.frame.height
        case .left:
            self.center.x -= parent.frame.width
        case .right:
            self.center.x += parent.frame.width
        }
        
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations:{
            self.repositionFromObject(anchorObject, parent: parent, xOffsetFactor: 0, yOffsetFactor: spacingFactor, mode: .graphical)
        }, completion: {finished in completionAction})
    }
    
    func slideOut(to direction: Direction = .bottom, delay: TimeInterval = 0, duration: TimeInterval = 1.0, parent: UIView, completionAction: ()){
        var yShift: CGFloat = 0
        var xShift: CGFloat = 0
        
        switch direction{
        case .top:
            yShift -= parent.frame.height
        case .bottom:
            yShift += parent.frame.height
        case .left:
            xShift -= parent.frame.width
        case .right:
            xShift += parent.frame.width
        }
        
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.4, options: [], animations: {
            self.transform = CGAffineTransform(translationX: xShift, y: yShift)
        }, completion: {finished in completionAction})
    }
}
