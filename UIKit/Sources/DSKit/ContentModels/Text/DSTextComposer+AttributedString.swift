//
//  DSTextComposer+AttributedString.swift
//  DSKit
//
//  Created by Borinschi Ivan on 13.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension DSTextComposer {
    
    fileprivate func makeImageAttributedString(image: UIImage,
                                               tint: DSTextColor? = nil,
                                               size: CGSize? = nil,
                                               designableTextColor: DSDesignableTextColor,
                                               alignment: NSTextAlignment,
                                               spacing: CGFloat) -> NSMutableAttributedString {
        
        var image = image
        var attributes: [NSAttributedString.Key: Any] = [:]
        
        let finalString = NSMutableAttributedString()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        paragraphStyle.alignment = alignment
        attributes = [.paragraphStyle: paragraphStyle]
        
        if let tint = tint {
            let color = tint.getColor(designableTextColor: designableTextColor)
            image = image.withTintColor(color)
        }
        
        image = image.withRenderingMode(.alwaysOriginal)
        
        let attachment = NSTextAttachment()
        attachment.image = image
        
        if let size = size {
            attachment.bounds = CGRect(origin: CGPoint(x: 0, y: -2), size: size)
        } else {
            attachment.bounds = CGRect(origin: CGPoint(x: 0, y: -2), size: CGSize(width: image.size.width, height: image.size.height))
        }
        
        let iconString = NSMutableAttributedString(attachment: attachment)
        iconString.addAttributes(attributes, range: NSRange(location: 0, length: iconString.length))
        
        let space = NSAttributedString(string: "")
        finalString.append(iconString)
        finalString.append(space)
        
        return finalString
    }
    
    func attributedString(designableTextColor: DSDesignableTextColor) -> NSAttributedString {
        
        var attributes: [NSAttributedString.Key: Any] = [:]
        let finalString = NSMutableAttributedString()
        
        for (index, paragraph) in paragraphs.enumerated() {
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = paragraph.lineSpacing
            paragraphStyle.alignment = alignment
            attributes = [.paragraphStyle: paragraphStyle]
            
            // New line
            if paragraph.newLine && index != 0 {
                let newLine = NSAttributedString(string:"\n")
                finalString.append(newLine)
            }
            
            switch paragraph.type {
            
            // Text
            case .text(icon: let icon, text: let text, font: let font, color: let color):
                
                makeText(paragraph, &attributes, color, designableTextColor, font, icon, finalString, text)
                
            // Price
            case .price(price: let price, size: let size, let color):
                
                let string = price.asAttributedString(size: size, color: color, alignment: alignment, spacing: paragraph.spacing)
                finalString.append(string)
                
            // Attributed
            case .attributed(let text):
                finalString.append(text)
            case .symbol(sfSymbol: let name, let style, let tint):
                
                let config = DSSFSymbolConfig.symbolConfig(style: style)
                
                guard let image = UIImage.symbolImage(with: name, configuration: config) else {
                    continue
                }
                
                let imageString = makeImageAttributedString(image: image,
                                                            tint: tint,
                                                            designableTextColor: designableTextColor,
                                                            alignment: alignment,
                                                            spacing: paragraph.spacing)
                finalString.append(imageString)
                
            case .symbols(sfSymbols: let names, let style, let tint):
                
                let config = DSSFSymbolConfig.symbolConfig(style: style)
                
                for name in names {
                    
                    guard let image = UIImage.symbolImage(with: name, configuration: config) else {
                        continue
                    }
                    
                    let imageString = makeImageAttributedString(image: image,
                                                                tint: tint,
                                                                designableTextColor: designableTextColor,
                                                                alignment: alignment,
                                                                spacing: paragraph.spacing)
                    
                    finalString.append(imageString)
                }
                
            case .image(image: let image, size: let size):
                
                let imageString = makeImageAttributedString(image: image,
                                                            size: size,
                                                            designableTextColor: designableTextColor,
                                                            alignment: alignment,
                                                            spacing: paragraph.spacing)
                finalString.append(imageString)
                
            case .badge(text: let badge, type: let type, backgroundColor: let backgroundColor, cornerRadius: let cornerRadius):
                
                let badgeString = NSAttributedString.textBadge(text: badge,
                                                               font: type.style.font.getFont(),
                                                               textColor: type.style.color.getColor(designableTextColor: designableTextColor),
                                                               backgroundColor: backgroundColor,
                                                               cornerRadius: cornerRadius,
                                                               alignment: alignment,
                                                               spacing: paragraph.spacing)
                finalString.append(badgeString)
            }
        }
        
        return finalString
    }
}

extension DSTextComposer {
    
    fileprivate func makeText(_ paragraph: DSTextParagraph,
                              _ attributes: inout [NSAttributedString.Key : Any],
                              _ color: DSTextColor,
                              _ designableTextColor: DSDesignableTextColor,
                              _ font: UIFont, _ icon: UIImage?,
                              _ finalString: NSMutableAttributedString,
                              _ text: String) {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        paragraphStyle.paragraphSpacing = paragraph.spacing
        paragraphStyle.lineBreakMode = .byWordWrapping
        paragraphStyle.lineSpacing = paragraph.lineSpacing
        paragraphStyle.maximumLineHeight = paragraph.maximumLineHeight
        
        attributes = [
            .foregroundColor: color.getColor(designableTextColor: designableTextColor),
            .font: font,
            .paragraphStyle: paragraphStyle
        ]
        
        if let image = icon {
            
            let oldHeight = image.size.height
            let scaleFactor = font.pointSize / oldHeight
            
            let newWidth = image.size.height * scaleFactor
            let newHeight = oldHeight * scaleFactor
            
            let attachment = NSTextAttachment(image: image)
            attachment.bounds = CGRect(origin: CGPoint(x: 0, y: -2), size: CGSize(width: newWidth, height: newHeight - 1))
            let iconString = NSMutableAttributedString(attachment: attachment)
            iconString.addAttributes(attributes, range: NSRange(location: 0, length: iconString.length))
            
            let space = NSAttributedString(string: "  ")
            finalString.append(iconString)
            finalString.append(space)
        }
        
        let string = NSAttributedString(string: text, attributes: attributes)
        finalString.append(string)
    }
}
