//
//  CustomButton.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class CustomButton: UIButton{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(activeImage: UIImage, highlightedImage: UIImage?, parent: UIView, target ambiguousTarget: Any, action: Selector,inactiveImage: UIImage? = nil){
        super.init(frame: CGRect.zero)
        super.setImage(activeImage, for: .normal)
        super.setImage(highlightedImage, for: .highlighted)
        
        if let inactiveImage = inactiveImage {
            super.setImage(inactiveImage, for: .disabled)
        }
        
        super.sizeToFit()
        self.clipsToBounds = false
        
        if let target = ambiguousTarget as? UIView{
            self.addTarget(target, action: action, for: .touchUpInside)
        }
        else if let target = ambiguousTarget as? UIViewController{
            self.addTarget(target, action: action, for: .touchUpInside)
        }
    }
    
    func hide(){
        self.isHidden = true
        self.alpha = 0
    }
    
    func disable(){
        self.isEnabled = false
    }
    
    func enable(){
        self.isEnabled = true
    }
    
    func show(){
        self.isHidden = false
        self.alpha = 1
    }
    
    func animate(duration: TimeInterval, delay: TimeInterval, uponComplete completionAction: ()?){
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseInOut, animations: {
            self.show()
        }, completion: {finished in completionAction})
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
}
