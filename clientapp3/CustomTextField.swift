//
//  CustomTextField.swift
//  clientapp3
//
//  Created by Steven Xie on 18-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class CustomTextField: UITextField{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
    }
    
    enum FontStyle{
        case `default`
        case customBorders
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    init(parent: UIView, widthFactor: CGFloat, fontStyle: FontStyle = .default, delegate: UITextFieldDelegate, placeHolder: String? = nil, enableAutocorrect: Bool = false) {
        let textFieldWidth = parent.frame.width * widthFactor
        let centerX = (parent.frame.width/2)
        let centerY = (parent.frame.height/2)
        let textFieldFrame = CGRect.init(x: centerX - textFieldWidth/2, y: centerY - (CustomHeight.textField/2), width: textFieldWidth, height: CustomHeight.textField)
        super.init(frame: textFieldFrame)
        
        self.delegate = delegate
        if enableAutocorrect == true{
            self.autocorrectionType = .yes
        }
        else{
            self.autocorrectionType = .no
        }
        self.borderStyle = .roundedRect
        self.keyboardType = .default
        self.returnKeyType = .done
        self.clearButtonMode = .whileEditing
        self.contentVerticalAlignment = .center
        
        initializeContentValues(fontStyle: fontStyle, placeHolder: placeHolder)
    }
    
    func initializeContentValues(fontStyle: FontStyle, placeHolder: String?){
        self.placeholder = placeHolder
        switch fontStyle{
        case .customBorders:
            self.layer.borderWidth = 1
            fallthrough
            
        case .default:
            self.backgroundColor = CustomColor.textFieldGrey
            self.layer.borderColor = CustomColor.textFieldGrey2.cgColor
            self.font = UIFont(name: "AvenirNext-Regular", size: FontSize.textField)
        }
    }
}
