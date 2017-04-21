//
//  LogoImage.swift
//  clientapp3
//
//  Created by Steven Xie on 20-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class LogoImage: UIImageView{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
    }
    
    enum Version: CGFloat{
        case large = 0.23
        case small = 0.22
    }
    
    init(parent: UIView, version: Version) {
        super.init(image: #imageLiteral(resourceName: "MainLogo"))
        resize(to: version, parent: parent)
    }
    
    func resize(to version: Version, parent: UIView){
        self.resizeProportionally(on: .horizontal, by: version.rawValue, parent: parent, relative: true)
    }
}
