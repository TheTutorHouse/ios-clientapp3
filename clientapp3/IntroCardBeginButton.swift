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
        super.init(activeImage: #imageLiteral(resourceName: "BeginButton-Regular"), highlightedImage: #imageLiteral(resourceName: "BeginButtonHighlighted-Regular"), parent: parent, target: target, action: action)
        self.centerInParent(parent)
        self.shiftFrom(position: parent.frame.height, by: -0.14, axis: .vertical, parent: parent, relative: true)
        parent.addSubview(self)
    }
    
    func fadeIn(delay: TimeInterval) {
        super.fadeIn(duration: 0.4, delay: delay, uponComplete: nil)
    }
}
