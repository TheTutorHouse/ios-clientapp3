//
//  Card.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class Card: UIImageView {
    
    static var defaultXSizeFactor: CGFloat{
            switch Display.type{
            case .iphone5: return 0.925
            default: return 0.83
            }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(image: UIImage?, parent: UIView, xSizeFactor: CGFloat = defaultXSizeFactor){
        super.init(image: image)
        self.center = parent.center
        self.resizeProportionally(on: .horizontal, by: xSizeFactor, parent: parent, relative: true)
    }
    
    enum Direction {
        case top, bottom, left, right
    }
    
    func hide(){
        self.alpha = 0
    }
    
    func show(){
        self.alpha = 1
    }
    
    func prepareForAnimations(){
        self.isUserInteractionEnabled = false
        self.hide()
    }
    
    func animate(){
        self.isUserInteractionEnabled = true
    }
    
    func bounceIn(from origin: Direction = .bottom, to anchorObject: UIView, spacingFactor: CGFloat, delay: TimeInterval = 0, duration: TimeInterval = 0.5, parent: UIView, completionAction: (()->())?){
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
        
        self.show()
        
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations:{
            self.repositionFrom(anchorObject, by: spacingFactor, axis: .vertical, parent: parent, relative: true)
        }, completion: {finished in
            if let completionAction = completionAction{
                completionAction()
            }
        })
    }
    
    func bounceOut(to direction: Direction, delay: TimeInterval = 0.25, duration: TimeInterval = 1.0, parent: UIView, completionAction: (()->())?){
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
        
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.2, options: [], animations: {
            self.transform = CGAffineTransform(translationX: xShift, y: yShift)
        }, completion: {finished in
            if let completionAction = completionAction{
                completionAction()
            }
        })
    }
}
