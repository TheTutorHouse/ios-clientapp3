//
//  ControllerWithKeyboard.swift
//  clientapp3
//
//  Created by Steven Xie on 21-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class ControllerWithKeyboard: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate{
    var activeTextField: UITextField?
    var textFieldSequence: [UITextField]!
    @IBOutlet weak var contentView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(textFieldSequence: [UITextField], nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.textFieldSequence = textFieldSequence
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(uponTap(_:)))
        tapGestureRecognizer.delegate = self
        view.addGestureRecognizer(tapGestureRecognizer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.shiftContentView(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }

    func uponTap(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        self.activeTextField = nil
        sender.cancelsTouchesInView = true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.backgroundColor != RGBColor(r: 255, g: 255, b: 255){
            UIView.animate(withDuration: 0.45, animations: {
                textField.backgroundColor = RGBColor(r: 225, g: 225, b: 225)
            })
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if textField.backgroundColor != RGBColor(r: 255, g: 255, b: 255){
            UIView.animate(withDuration: 0.45, animations: {
                textField.backgroundColor = RGBColor(r: 225, g: 225, b: 225)
            })
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        self.activeTextField = nil
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .next{
            if let nextField = nextFieldInSequence(){
                nextField.becomeFirstResponder()
            }
        }
        else{
            view.endEditing(true)
        }
        return true
    }
    
    func nextFieldInSequence() -> UITextField?{
        for currentField in 1...(textFieldSequence.count - 1){
            if textFieldSequence[currentField - 1] == activeTextField{
                return textFieldSequence[currentField]
            }
        }
        return nil
    }
    
    func shiftContentView(notification: Notification){
        if let userInfo = notification.userInfo{
            if let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
                let duration: TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
                let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
                let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIViewAnimationOptions.curveEaseInOut.rawValue
                let animationCurve: UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
                
                if let textField = activeTextField{
                    let textFieldYPos = textField.center.y
                    let visibleScreenHeight = view.frame.height - endFrame.minY
                    let visibleScreenCenterYPos = visibleScreenHeight/2
                    let shiftAmount = visibleScreenCenterYPos - textFieldYPos
                    self.contentView.center = view.center
                    UIView.animate(withDuration: duration, delay: 0, options: animationCurve, animations: {
                        self.contentView.center.y += shiftAmount
                    }, completion: nil)
                }
                else{
                    UIView.animate(withDuration: duration, delay: 0, options: animationCurve, animations: {
                        self.contentView.center.y = self.view.center.y
                    }, completion: nil)
                }
            }
        }
    }
}
