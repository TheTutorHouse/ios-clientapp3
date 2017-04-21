//
//  IntroCardTitleUnderline.swift
//  clientapp3
//
//  Created by Steven Xie on 20-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class IntroCardTitleUnderline: HorizontalLine{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
    }
    
    init(parent: UIView, cardTitleLabel: UIView){
        super.init(parent: parent, lengthFactor: 0.8)
        self.offsetFrom(cardTitleLabel, direction: .vertical, by: 5, relative: false, parent: parent)
        parent.layer.addSublayer(self)
    }
}
