//
//  StartLogoImage.swift
//  clientapp3
//
//  Created by Steven Xie on 20-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class StartLogoImage: LogoImage{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(parent: UIView, logoLabel: UIView){
        super.init(parent: parent, version: .large)
        self.centerInParent(parent)
        
        //Reposition upwards from the logo label.
        var amount: CGFloat{
            switch Display.type{
            case .iphone5: return -0.02
            default: return -0.025
            }
        }
        self.repositionFrom(logoLabel, by: amount, axis: .vertical, parent: parent, relative: true)
        parent.addSubview(self)
    }
    
    func shiftUp(parent: UIView, logoLabel: UIView, uponCompletion completionAction: (() -> ())?){
        UIView.animate(withDuration: 0.7, delay: 0.7, options: [.curveEaseInOut], animations: {
            
            //Shift along with label
            self.repositionFrom(logoLabel, by: -0.0175, axis: .vertical, parent: parent, relative: true, mode: .positional)
            
        }, completion: { finished in
            if let completionAction = completionAction{
                completionAction()
            }
        })
    }
}

