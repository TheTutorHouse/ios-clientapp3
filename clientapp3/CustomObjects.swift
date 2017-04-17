//
//  CustomObjects.swift
//  clientapp3
//
//  Created by Steven Xie on 16-04-2017.
//  Copyright © 2017 The Tutor House. All rights reserved.
//

import Foundation
import UIKit

public func stylizedLabel(text: String, fontSize: Double = 20, fontStyle: String? = nil, fontColor: UIColor? = nil, lineWidthLimiter: CGFloat? = nil) -> UILabel{
    //Data logging:
    if verbosityLevel == 5 {
        print(">> Function stylizedLabel now creating a new stylized label.")
    }
    
    //Create label, initial setup.
    let label = UILabel(frame: CGRect.zero)
    
    //Setup optional font names and colors.
    var fontName = "Avenir Next"
    if let fontStyle = fontStyle {
        fontName = "AvenirNext-" + fontStyle
    }
    if let fontColor = fontColor{
        label.textColor = fontColor
    }
    
    //Setup font and text
    label.text = text
    label.font = UIFont(name: fontName, size: CGFloat(fontSize))
    
    //Setup sizing
    if let maxWidth = lineWidthLimiter{
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame.size.width = maxWidth
    }
    label.sizeToFit()
    
    if verbosityLevel >= 4{
        print(">> ...new Label created with a font designation of \(label.font).\n")
    }
    return label
}

public func centeredCardLabel(forCard card: UIView, labelVerticalOffsetFactor offset: CGFloat, labelText: String, labelFontSize: Double = 20, labelFontStyle: String? = nil, labelFontColor: UIColor? = nil, lineWidthLimiter: CGFloat? = nil) -> UILabel{
    //Data logging:
    if verbosityLevel == 5 {
        print(">> Function centeredCardLabel now creating a new centered card label.")
    }
    
    let cardLabel = stylizedLabel(text: labelText, fontSize: labelFontSize, fontStyle: labelFontStyle, fontColor: labelFontColor, lineWidthLimiter: lineWidthLimiter)
    centerInParentView(object: cardLabel, parentView: card)
    cardLabel.center.y += card.frame.height * offset
    
    if verbosityLevel >= 4{
        print(">> ...new centered card label created at\(cardLabel.center).\n")
    }
    return cardLabel
}

public func cardTitleUnderLine(forCard card: UIView, forTitle title: UILabel, horizontalOffset: CGFloat, verticalOffset: CGFloat, thickness: CGFloat = 1.0, color: UIColor = FillColor.red) -> CAShapeLayer{
    //Data logging:
    if verbosityLevel == 5 {
        print(">> Function cardTitleUnderLine now creating a new stylized label.")
    }
    
    //Initialize line start and end points
    let lineHalfLength: CGFloat = card.frame.width/2 - (horizontalOffset * card.frame.width)
    let lineStartX = relativeCenterPoint(card).x - lineHalfLength
    let lineFinalX = relativeCenterPoint(card).x + lineHalfLength
    let lineY = title.center.y + title.frame.height/2 + (verticalOffset * card.frame.height)
    let startPoint = CGPoint(x: lineStartX, y: lineY)
    let endPoint = CGPoint(x: lineFinalX, y: lineY)
    
    //Draw Line with UIBezierPath
    let pathDrawer = UIBezierPath()
    pathDrawer.move(to: startPoint)
    pathDrawer.addLine(to: endPoint)
    pathDrawer.close()
    
    //Add path to shapelayer.
    let lineLayer = CAShapeLayer()
    lineLayer.path = pathDrawer.cgPath
    lineLayer.strokeColor = color.cgColor
    lineLayer.lineWidth = thickness
    
    if verbosityLevel >= 4{
        print(">> ...new Line created with a length of \(lineHalfLength * 2).\n")
    }
    return lineLayer
}

public func fixedSizeImageButton(activeImage: UIImage, highlightedImage: UIImage, inactiveImage: UIImage? = nil) -> UIButton{
    //Init
    let button = UIButton()
    
    //Set images for different control states
    button.setImage(activeImage, for: .normal)
    button.setImage(highlightedImage, for: .highlighted)
    if let inactiveImage = inactiveImage{
        button.setImage(inactiveImage, for: .disabled)
    }
    
    //Resize according to image size
    button.sizeToFit()
    button.clipsToBounds = true
    
    return button
}

