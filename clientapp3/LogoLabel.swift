//
//  LogoLabel.swift
//  clientapp3
//
//  Created by Steven Xie on 20-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class LogoLabel: CustomLabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    enum LogoSize: CGFloat{
        case regular = 35.0
    }
    
    init(size: LogoSize){
        let font = UIFont(name: "AvenirNext-DemiBold", size: size.rawValue)
        let color = UIColor.white
        super.init(text: "The Tutor House", font: font, color: color)
    }
}
