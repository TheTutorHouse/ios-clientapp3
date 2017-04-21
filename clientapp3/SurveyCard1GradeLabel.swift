//
//  SurveyCard1GradeLabel.swift
//  clientapp3
//
//  Created by Steven Xie on 20-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyCard1GradeLabel: HeaderLabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(parent: UIView){
        super.init(text: "Grade:", size: .small, color: .darkGrey)
        self.centerInParent(parent)
        self.translate(by: 0.11, axis: .vertical, parent: parent, relative: true)
        self.translateOrigin(by: -0.4, axis: .horizontal, parent: parent, relative: true)
        parent.addSubview(self)
    }
}
