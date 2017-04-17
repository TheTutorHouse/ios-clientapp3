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
    
    init(activeImage: UIImage, highlightedImage: UIImage, parent: UIView, action: Selector,inactiveImage: UIImage? = nil){
        super.init(frame: CGRect.zero)
        super.setImage(activeImage, for: .normal)
        super.setImage(highlightedImage, for: .highlighted)
        if let inactiveImage = inactiveImage {
            super.setImage(inactiveImage, for: .disabled)
        }
        super.sizeToFit()
        self.clipsToBounds = true
        self.addTarget(parent, action: action, for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
}
