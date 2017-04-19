//
//  ImageButton.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class ImageButton: UIButton{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(activeImage: UIImage, highlightedImage: UIImage?, parent: UIView, target undefinedTarget: Any, action: Selector,inactiveImage: UIImage? = nil){
        super.init(frame: CGRect.zero)
        super.setImage(activeImage, for: .normal)
        super.setImage(highlightedImage, for: .highlighted)
        
        if let inactiveImage = inactiveImage {
            super.setImage(inactiveImage, for: .disabled)
        }
        
        super.sizeToFit()
        self.clipsToBounds = false
        
        if let target = undefinedTarget as? UIView{
            self.addTarget(target, action: action, for: .touchUpInside)
        }
        else if let target = undefinedTarget as? UIViewController{
            self.addTarget(target, action: action, for: .touchUpInside)
        }
    }
    
    func hide(){
        self.isHidden = true
        self.alpha = 0
    }
    
    func show(delay: TimeInterval){
        self.isHidden = false
        UIView.animate(withDuration: 0.4, delay: delay, options: .curveEaseInOut, animations: {
            self.alpha = 1
        }, completion: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
}
