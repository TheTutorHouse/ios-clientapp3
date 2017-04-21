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
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    enum BorderType{
        case rounded, custom
    }
    
    enum ColorScheme{
        case variation1, variation2
    }
    
    init(parent: UIView, widthFactor: CGFloat, heightMultiplier: CGFloat = 1, borderType: BorderType = .rounded, colorScheme: ColorScheme, delegate: UITextFieldDelegate, placeHolder: String? = nil) {
        
        let textFieldWidth = parent.frame.width * widthFactor
        let textFieldHeight = (37.5 * heightMultiplier)
        let centerX = (parent.frame.width/2)
        let centerY = (parent.frame.height/2)
        let textFieldFrame = CGRect.init(x: centerX - textFieldWidth/2, y: centerY - (textFieldHeight/2), width: textFieldWidth, height: 37.5)
        super.init(frame: textFieldFrame)
        
        self.delegate = delegate
        self.borderStyle = .roundedRect
        self.keyboardType = .default
        self.returnKeyType = .done
        self.clearButtonMode = .whileEditing
        self.contentVerticalAlignment = .center
        self.placeholder = placeHolder
        
        initializeBorder(borderType: borderType)
        initializeColorScheme(colorScheme: colorScheme)
    }
    
    func initializeBorder(borderType: BorderType){
        switch borderType{
        case .custom:
            self.layer.borderWidth = 1
        case .rounded:
            break
        }
    }
    
    func initializeColorScheme(colorScheme: ColorScheme){
        switch colorScheme{
        case .variation1:
            self.layer.borderColor = RGBColor(r: 151, g: 151, b: 151).cgColor
            self.backgroundColor = RGBColor(r: 228, g: 228, b: 228)
        case .variation2:
            break
        }
    }
}
