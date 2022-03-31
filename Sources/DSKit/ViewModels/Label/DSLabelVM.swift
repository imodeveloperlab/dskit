//
//  DSLabelVM.swift
//  DSKit
//
//  Created by Borinschi Ivan on 15.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// Text view model
public struct DSLabelVM: DSViewModel, Equatable, Hashable {
    
    /// Text composer
    public var textComposer: DSTextComposer
    
    /// Init with text type and string
    /// - Parameters:
    ///   - type: DSTextType
    ///   - text: String
    ///   - alignment: NSTextAlignment
    public init(_ type: DSTextType = .body, text: String, alignment: NSTextAlignment = .natural) {
        self.textComposer = DSTextComposer(alignment: alignment)
        self.textComposer.add(type: type, text: text)
    }
    
    /// Init with text composer
    /// - Parameter composer: DSTextComposer
    public init(composer: DSTextComposer) {
        self.textComposer = composer
    }
    
    // Unique identifier, if identifier will not be uniq DSKit will generate one for you
    // but this may affect content diff animations
    public var identifier = "TextView"
    
    // Accessibility identifier
    public var accessibilityIdentifier: String = "TextView"
    
    /// Style
    public var style: DSViewModelStyle = DSViewModelStyle()
    
    /// Text type
    public var type: DSTextVMType = .default
    
    /// Height
    public var height: DSViewModelHeight?
    
    /// Width
    public var width: DSViewModelWidth?
    
    @NonEquatable public var didTap: ((DSViewModel) -> Void)?
    @NonEquatable public var didTapOnMention: ((String) -> Void)?
    @NonEquatable public var didTapOnHashTag: ((String) -> Void)?
    @NonEquatable public var didTapOnUrl: ((URL) -> Void)?
    @NonEquatable public var didTapOnEmail: ((String) -> Void)?
    @NonEquatable public var object: AnyObject?
    
    /// Supplementary items
    public var supplementaryItems: [DSSupplementaryView]?
    
    public var bottomSideView: DSSideView?
    public var leftSideView: DSSideView?
    public var rightSideView: DSSideView?
    public var topSideView: DSSideView?
}

public enum DSTextVMType {
    case `default`
}

public extension DSLabelVM {
    
    /// Get width
    /// - Parameters:
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    ///   - section: DSSection
    /// - Returns: DSViewModelWidth
    func width(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelWidth {
        return width ?? .fractional(1.0)
    }
    
    /// Get view model height
    /// - Parameters:
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    ///   - section: DSSection
    /// - Returns: DSViewModelHeight
    func height(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelHeight {
        return height != nil ? height! : textComposer.estimatedHeight(section: section, layoutEnvironment)
    }
    
    func viewRepresentation() -> DSReusableUIView {
        return DSLabelUIView.instanceFromNib()
    }
    
    func isEqual(to model: DSViewModel) -> Bool {
        
        guard let model = model as? Self else {
            return false
        }
        
        return self == model
    }
    
    func hash() -> String {
        return hashValue.string()
    }
}
