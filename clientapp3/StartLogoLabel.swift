//
//  StartLogoLabel.swift
//  clientapp3
//
//  Created by Steven Xie on 20-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class StartLogoLabel: LogoLabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(parent: UIView){
        super.init(size: .regular)
        self.centerInParent(parent)
        self.translate(by: 0.037, axis: .vertical, parent: parent, relative: true)
        parent.addSubview(self)
    }
    
    func shiftUp(parent: UIView){
        var amount: CGFloat{
            switch Display.type{
            case .iphone5: return -0.235
            default: return -0.250
            }
        }
        UIView.animate(withDuration: 0.7, delay: 0.70, options: [.curveEaseInOut], animations: {
            self.translate(by: amount, axis: .vertical, parent: parent, relative: true, mode: .positional)
        }, completion: nil)
    }
    
    func fadeOut(uponCompletion completionAction: @escaping ()->()){
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.curveEaseInOut], animations: {
            self.alpha = 0
        }, completion: {finished in
            completionAction()
        })
    }
}
