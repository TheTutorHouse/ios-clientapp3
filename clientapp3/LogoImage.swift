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
        case small = 0.1575
    }
    
    init(parent: UIView, version: Version) {
        super.init(image: #imageLiteral(resourceName: "MainLogo"))
        resize(to: version, parent: parent)
    }
    
    func resize(to version: Version, parent: UIView){
        self.resizeProportionally(on: .horizontal, by: version.rawValue, parent: parent, relative: true)
    }
    
    func reposition(version: Version, parent: UIView){
        switch version{
        case .large:
            self.translate(by: 0.023, axis: .vertical, parent: parent, relative: true)
        case .small:
            self.translate(by: -0.023, axis: .vertical, parent: parent, relative: true)
        }
    }
    
    func animate(version: Version, delay: TimeInterval, parent: UIView){
        UIView.animate(withDuration: 0.75, delay: delay, options: .curveEaseInOut, animations: {
            self.resize(to: version, parent: parent)
            self.reposition(version: version, parent: parent)
        }, completion: nil)
    }
}
