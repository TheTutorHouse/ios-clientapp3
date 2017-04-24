//
//  SurveyCard1EmailField.swift
//  clientapp3
//
//  Created by Steven Xie on 20-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyCard1EmailField: CustomTextField{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(parent: UIView, emailLabel: UIView, delegate: UITextFieldDelegate){
        super.init(parent: parent, widthFactor: 0.8, heightMultiplier: 1, borderType: .rounded, colorScheme: .variation1, delegate: delegate, placeHolder: "jane@apple.ca")
        self.repositionFrom(emailLabel, by: 5, axis: .vertical, parent: parent, relative: false)
        self.autocapitalizationType = .none
        self.keyboardType = .emailAddress
        self.autocorrectionType = .no
        self.returnKeyType = .done
        parent.addSubview(self)
        loadData()
    }
    
    func loadData(){
        if let text = UserDefaults.standard.string(forKey: "surveyCard1EmailFieldText"){
            self.text = text
        }
    }
}
