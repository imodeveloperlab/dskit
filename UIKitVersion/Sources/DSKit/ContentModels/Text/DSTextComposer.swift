//
//  DSText.swift
//  DSKit
//
//  Created by Borinschi Ivan on 14.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// Compose rich texts and prepare to show on the screen
public class DSTextComposer: Equatable, Hashable {
    
    /// All texts in this composer will be aligned to this alignment
    var alignment: NSTextAlignment
    
    /// Init text composer with alignment
    /// - Parameter alignment: NSTextAlignment
    public init(alignment: NSTextAlignment = .natural) {
        self.alignment = alignment
    }
    
    /// All paragraphs in this text composer
    var paragraphs: [DSTextParagraph] = []
    
    public static func == (lhs: DSTextComposer, rhs: DSTextComposer) -> Bool {
        return lhs.paragraphs == rhs.paragraphs
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(paragraphs)
    }
}

public extension DSTextComposer {
    
    /// Estimated height for text in section
    /// - Parameters:
    ///   - section: DSSection
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    /// - Returns: DSViewModelHeight
    func estimatedHeight(section: DSSection, _ layoutEnvironment: NSCollectionLayoutEnvironment?) -> DSViewModelHeight {
        
        let appearance = DSAppearance.shared.main.primaryView
        let text = self.attributedString(designableTextColor: appearance.text)
        
        // Some default font
        var font = UIFont.systemFont(ofSize: 10)
        
        // Get first paragraph font
        if let paragraph = paragraphs.first {
            switch paragraph.type {
            case .text(icon: _, text: _, font: let paragraphFont, color: _):
                font = paragraphFont
            default:
                break
            }
        }
        
        let width = section.sectionWidth(layoutEnvironment)
        
        // Calculate estimated height
        let height = text.height(forFixedWidth: width, font: font)
        return .estimated(height)
    }
    
    /// Estimated width for text in section
    /// - Parameters:
    ///   - section: DSSection
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    /// - Returns: DSViewModelHeight
    func calculatedWidth(section: DSSection, _ layoutEnvironment: NSCollectionLayoutEnvironment?) -> CGFloat {
        
        let appearance = DSAppearance.shared.main.primaryView
        let text = self.attributedString(designableTextColor: appearance.text)
        
        // Some default font
        var font = UIFont.systemFont(ofSize: 10)
        
        // Get first paragraph font
        if let paragraph = paragraphs.first {
            switch paragraph.type {
            case .text(icon: _, text: _, font: let paragraphFont, color: _):
                font = paragraphFont
            default:
                break
            }
        }
        
        let height = section.sectionHeight(layoutEnvironment)
        
        let width = text.width(forFixedHeight: height, font: font)
        
        
        return width + section.insets.width
    }
}
