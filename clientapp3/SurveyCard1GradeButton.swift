//
//  SurveyCard1GradeButton.swift
//  clientapp3
//
//  Created by Steven Xie on 20-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import UIKit

class SurveyCard1GradeButton: CustomButton{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    enum State{
        case active, inactive
    }
    
    init(parent: UIView, grade: Int, gradeLabel: UIView, target: Any, action: Selector){
        var normalImage: UIImage
        var highlightedImage: UIImage
        
        switch grade{
        case 9:
            normalImage = #imageLiteral(resourceName: "G9ButtonInactive-medium")
            highlightedImage = #imageLiteral(resourceName: "G9ButtonHighlighted-medium")
        case 10:
            normalImage = #imageLiteral(resourceName: "G10ButtonInactive-medium")
            highlightedImage = #imageLiteral(resourceName: "G10ButtonHighlighted-medium")
        case 11:
            normalImage = #imageLiteral(resourceName: "G11ButtonInactive-medium")
            highlightedImage = #imageLiteral(resourceName: "G11ButtonHighlighted-medium")
        case 12:
            normalImage = #imageLiteral(resourceName: "G12ButtonInactive-medium")
            highlightedImage = #imageLiteral(resourceName: "G12ButtonHighlighted-medium")
        default: fatalError("Tried to assign button image for invalid grade.")
        }
        
        super.init(activeImage: normalImage, highlightedImage: highlightedImage, parent: parent, target: target, action: action)
        setPosition(parent: parent, grade: grade, gradeLabel: gradeLabel)
        self.tag = grade
        parent.addSubview(self)
    }
    
    func assignState(state: State, for grade: Int){
        let normalImage: UIImage = retrieveImage(state: state, for: grade)
        self.setImage(normalImage, for: .normal)
    }
    
    private func retrieveImage(state: State, for grade: Int) -> UIImage{
        var normalImage: UIImage
        switch state{
        case .active:
            switch grade{
            case 9: normalImage = #imageLiteral(resourceName: "G9ButtonActive-medium")
            case 10: normalImage = #imageLiteral(resourceName: "G10ButtonActive-medium")
            case 11: normalImage = #imageLiteral(resourceName: "G11ButtonActive-medium")
            case 12: normalImage = #imageLiteral(resourceName: "G12ButtonActive-medium")
            default: fatalError("Tried to return button image for invalid grade.")
            }
        case .inactive:
            switch grade{
            case 9: normalImage = #imageLiteral(resourceName: "G9ButtonInactive-medium")
            case 10: normalImage = #imageLiteral(resourceName: "G10ButtonInactive-medium")
            case 11: normalImage = #imageLiteral(resourceName: "G11ButtonInactive-medium")
            case 12: normalImage = #imageLiteral(resourceName: "G12ButtonInactive-medium")
            default: fatalError("Tried to return button image for invalid grade.")
            }
        }
        return normalImage
    }
    
    func setPosition(parent: UIView, grade: Int, gradeLabel: UIView){
        //Vertical position
        self.resizeProportionally(on: .horizontal, by: 0.1225, parent: parent, relative: true)
        self.centerInParent(parent)
        self.repositionFrom(gradeLabel, by: 7, axis: .vertical, parent: parent, relative: false)
        
        //Horizontal position
        let xPosFactor = (CGFloat(grade) - 10.5) * 0.163
        self.translate(by: xPosFactor, axis: .horizontal, parent: parent, relative: true)
    }
}
