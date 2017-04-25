//
//  IntroCardHeaderLabel.swift
//  clientapp3
//
//  Created by Steven Xie on 20-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class IntroCardHeaderLabel: HeaderLabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(parent: UIView){
        super.init(text: "Need a tutor?", size: .small, color: .lightGrey)
        self.centerInParent(parent)
        
        var amount: CGFloat{
            switch Display.type{
            case .iphone5: return -0.215
            default: return -0.175
            }
        }
        self.translate(by: amount, axis: .vertical, parent: parent, relative: true)
        
        self.translateOrigin(by: -0.39, axis: .horizontal, parent: parent, relative: true)
        parent.addSubview(self)
    }
}
