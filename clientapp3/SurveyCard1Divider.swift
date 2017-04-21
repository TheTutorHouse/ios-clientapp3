//
//  SurveyCard1Divider.swift
//  clientapp3
//
//  Created by Steven Xie on 20-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyCard1Divider: UIImageView{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(parent: UIView, nextButton: UIView){
        super.init(image: #imageLiteral(resourceName: "SurveyCard1Divider - Medium"))
        self.resizeProportionally(on: .horizontal, by: 0.8, parent: parent, relative: true)
        self.centerInParent(parent)
        self.repositionFrom(nextButton, by: -0.04, axis: .vertical, parent: parent, relative: true)
        parent.addSubview(self)
    }
    
    func animate(delay: TimeInterval){
        UIView.animate(withDuration: 0.5, delay: delay, options: .curveEaseInOut, animations: {
            self.show()
        }, completion: nil)
    }
    
    func hide(){
        self.alpha = 0
    }
    
    private func show(){
        self.alpha = 1
    }
}




