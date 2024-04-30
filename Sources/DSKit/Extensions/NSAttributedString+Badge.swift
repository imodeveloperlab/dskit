//
//  DSBadgeAttributedString.swift
//  DSKit
//
//  Created by Borinschi Ivan on 14.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

public extension NSAttributedString {
    
    static func badge(text: String, font: UIFont, textColor: UIColor, backgroundColor: UIColor, cornerRadius: CGFloat) -> NSAttributedString {
        
        var attributes: [NSAttributedString.Key: Any] = [:]
    
        let leftRightMargin: CGFloat = 5
        let topBottomMargin: CGFloat = 2
        let textHeight: CGFloat = font.lineHeight
        let textWidth = text.width(forFixedHeight: textHeight, font: font) + 2
        let imageWidth = textWidth + (leftRightMargin * 2)
        let imageHeight = textHeight + (topBottomMargin * 2)
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: imageWidth, height: imageHeight))

        let badge = renderer.image { ctx in

            let rectangle = CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)
            
            let path = UIBezierPath(roundedRect: rectangle, cornerRadius: cornerRadius)

            ctx.cgContext.setFillColor(backgroundColor.cgColor)
            ctx.cgContext.addPath(path.cgPath)
            ctx.cgContext.drawPath(using: .fill)

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            attributes = [
                .foregroundColor: textColor,
                .font: font,
                .paragraphStyle: paragraphStyle,
            ]

            let attributedString = NSAttributedString(string: text, attributes: attributes)
            attributedString.draw(with: CGRect(x: leftRightMargin, y: topBottomMargin, width: textWidth, height: textHeight), options: .usesLineFragmentOrigin, context: nil)
        }
        
        let attachment = NSTextAttachment()
        attachment.image = badge
        attachment.bounds = CGRect(x: 0, y: -topBottomMargin - 2, width: imageWidth, height: imageHeight)
        let badgeString = NSAttributedString(attachment: attachment)
        
        return badgeString
    }
    
    static func textBadge(text: String,
                          font: UIFont,
                          textColor: UIColor,
                          backgroundColor: UIColor,
                          cornerRadius: CGFloat,
                          alignment: NSTextAlignment,
                          spacing: CGFloat) -> NSAttributedString {
        
        var attributes: [NSAttributedString.Key: Any] = [:]
    
        let leftRightMargin: CGFloat = 5
        let topBottomMargin: CGFloat = 2
        let textHeight: CGFloat = font.lineHeight
        let textWidth = text.width(forFixedHeight: textHeight, font: font) + 3
        let imageWidth = textWidth + (leftRightMargin * 2)
        let imageHeight = textHeight + (topBottomMargin * 2)
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: imageWidth, height: imageHeight))

        let badge = renderer.image { ctx in

            let rectangle = CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)
            
            let path = UIBezierPath(roundedRect: rectangle, cornerRadius: cornerRadius)

            ctx.cgContext.setFillColor(backgroundColor.cgColor)
            ctx.cgContext.addPath(path.cgPath)
            ctx.cgContext.drawPath(using: .fill)

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = alignment
            paragraphStyle.paragraphSpacingBefore = spacing
            
            attributes = [
                .foregroundColor: textColor,
                .font: font,
                .paragraphStyle: paragraphStyle,
            ]

            let attributedString = NSAttributedString(string: text, attributes: attributes)
            attributedString.draw(with: CGRect(x: leftRightMargin, y: topBottomMargin, width: textWidth, height: textHeight), options: .usesLineFragmentOrigin, context: nil)
        }
        
        let attachment = NSTextAttachment()
        attachment.image = badge
        attachment.bounds = CGRect(x: 0, y: -(topBottomMargin + 3), width: imageWidth, height: imageHeight)
        let badgeString = NSAttributedString(attachment: attachment)
        
        return badgeString
    }
}
