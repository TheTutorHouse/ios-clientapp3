//
//  SurveyController.swift
//  clientapp3
//
//  Created by Steven Xie on 17-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyController: UIViewController, UITextFieldDelegate {
    
    var logoImage: LogoImage!
    var lastSenderTag: Int = 0
    var surveyCard1: SurveyCard1!
    @IBOutlet weak var contentView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeKeyboardHandler()
        view.backgroundColor = CustomColor.red
        contentView.backgroundColor = CustomColor.red
        contentView.addSubview(logoImage)
        contentView.frame.size = view.frame.size
        surveyCard1 = SurveyCard1(parent: contentView, nextButtonTarget: self, nextButtonAction: #selector(onNextButtonClick(_:)), textFieldDelegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        surveyCard1.animate(parent: view, anchorObject: logoImage)
    }
    
    func showCard(){
        switch lastSenderTag{
        case 0:
            surveyCard1.animate(parent: view, anchorObject: logoImage)
        case 1:
            break
        default:
            fatalError("SurveyController attempted to show an undefined card.")
        }
    }
    
    func onNextButtonClick(_ sender: CustomButton!){
        lastSenderTag = sender.tag
        switch sender.tag{
        case 1:
            surveyCard1.slideOut(parent: view, completionAction: showCard)
            logoImage.animate(version: .small, delay: 0.2, parent: contentView)
        default:
            fatalError("SurveyController attempted to initiate action from an undefined button tag.")
        }
    }
    
    func initializeKeyboardHandler(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.shiftContent(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @IBAction func tapReceived(_ sender: UITapGestureRecognizer) {
        self.contentView.endEditing(true)
        self.activeTextField = nil
        sender.cancelsTouchesInView = true
    }
    
    var activeTextField: UITextField?
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        self.activeTextField = nil
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .next{
            surveyCard1.emailField.becomeFirstResponder()
        }
        else{
            contentView.endEditing(true)
        }
        return true
    }
    
    func shiftContent(notification: Notification){
        if let userInfo = notification.userInfo{
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let duration: TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIViewAnimationOptions.curveEaseInOut.rawValue
            let animationCurve: UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
            
            if let textField = activeTextField{
                let textFieldYPos = textField.center.y
                let visibleScreenHeight = view.frame.height - endFrame!.minY
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
