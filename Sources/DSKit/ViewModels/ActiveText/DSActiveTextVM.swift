//
//  DSActiveTextVM.swift
//  DSKit
//
//  Created by Borinschi Ivan on 15.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// Text with links and mentions
public struct DSActiveTextVM: DSViewModel, Equatable, Hashable {
    
    // Text
    public var text: String
    
    // Text type
    public var textType: DSTextType
    
    // Alignment
    public var alignment: NSTextAlignment
    
    // Links to be displayed in text
    public var links = [String: String]()
    
    // Font of the links
    // Changes only the font of the links
    public var linksFont: DSTextFont?
    
    // Text height, default is nil and will be dynamically calculated
    public var height: DSViewModelHeight?
    
    /// Active text can display simple text with links and mentions
    /// - Parameters:
    ///   - type: DSTextType
    ///   - text: String
    ///   - alignment: NSTextAlignment
    public init(_ type: DSTextType = .body, text: String, alignment: NSTextAlignment = .natural) {
        self.text = text
        self.alignment = alignment
        self.textType = type
    }
    
    // Unique identifier, if identifier will not be uniq DSKit will generate one for you
    // but this may affect content diff animations
    public var identifier = "ActiveTextView"
    
    // Accessibility identifier
    public var accessibilityIdentifier: String = "ActiveTextView"
    
    /// Style
    public var style: DSViewModelStyle = DSViewModelStyle()
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(text)
    }
    
    // Handle did tap on view model
    @NonEquatable public var didTap: ((DSViewModel) -> Void)?
    
    // Handle did tap on mention
    @NonEquatable public var didTapOnMention: ((String) -> Void)?
    
    // Handle did tap on hash tag
    @NonEquatable public var didTapOnHashTag: ((String) -> Void)?
    
    // Handle did tap on url
    @NonEquatable public var didTapOnUrl: ((URL) -> Void)?
    
    // Handle did tap on email
    @NonEquatable public var didTapOnEmail: ((String) -> Void)?
    
    // Handle did tap on phone
    @NonEquatable public var didTapOnPhone: ((String) -> Void)?
    
    // Companion object
    @NonEquatable public var object: AnyObject?
    
    /// Supplementary items
    public var supplementaryItems: [DSSupplementaryView]?
    
    public var bottomSideView: DSSideView?
    public var leftSideView: DSSideView?
    public var rightSideView: DSSideView?
    public var topSideView: DSSideView?
}

public extension DSActiveTextVM {
    
    /// Get view model height
    /// - Parameters:
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    ///   - section: DSSection
    /// - Returns: DSViewModelHeight
    func height(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelHeight {
        return height != nil ? height! : text.estimatedHeight(textType: textType, section: section, layoutEnvironment)
    }
    
    // View representation
    func viewRepresentation() -> DSReusableUIView {
        return DSActiveTextUIView.instanceFromNib()
    }
    
    /// Is this view model equal to another one
    /// - Parameter model: DSViewModel
    /// - Returns: Bool
    func isEqual(to model: DSViewModel) -> Bool {
        guard let model = model as? Self else { return false }
        return self == model
    }
    
    /// View model hash
    func hash() -> String {
        return hashValue.string()
    }
}
