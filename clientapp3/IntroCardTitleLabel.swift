//
//  IntroCardTitleLabel.swift
//  clientapp3
//
//  Created by Steven Xie on 20-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class IntroCardTitleLabel: HeaderLabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(parent: UIView){
        super.init(text: "Welcome!", size: .regular, color: .grey)
        self.centerInParent(parent)
        self.translate(by: -0.35, axis: .vertical, parent: parent, relative: true)
        parent.addSubview(self)
    }
}

