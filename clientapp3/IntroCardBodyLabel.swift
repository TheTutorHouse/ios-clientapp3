//
//  IntroCardBodyLabel.swift
//  clientapp3
//
//  Created by Steven Xie on 20-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class IntroCardBodyLabel: BodyLabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(parent: UIView, cardHeaderLabel: UIView){
        let text = "Complete this one-minute match so we can find the tutor that’s right for you!"
        let lineWidthLimit: CGFloat = (0.78) * parent.frame.width
        super.init(text: text, size: .regular, color: .grey, lineWidthLimit: lineWidthLimit)
        self.centerInParent(parent)
        self.repositionFrom(cardHeaderLabel, by: 10, axis: .vertical, parent: parent, relative: false)
        self.translateOrigin(by: -0.39, axis: .horizontal, parent: parent, relative: true)
        parent.addSubview(self)
    }
}
