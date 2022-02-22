//
//  DSActionViewModel.swift
//  DSKit
//
//  Created by Borinschi Ivan on 17.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public struct DSActionVM: DSViewModel, Equatable, Hashable {
    
    // View model height
    public var height: DSViewModelHeight?
    
    // View model width
    public var width: DSViewModelWidth = .fractional(1.0)
    
    // Left view model view position
    public var leftViewPosition: DSViewPosition = .center
    
    // Should top image expand over bounds for groups
    public var expandImageOverBoundsForGroups: Bool = true
    
    // View model text content
    var text: DSTextComposer
    
    // View model right view
    var rightView: DSView?
    
    // View model left view
    var leftView: DSView?
    
    // View model top image content
    var topImage: DSImageContent?
    
    // Top image height
    var topImageHeight: DSImageHeight = .zero
    
    // Zero space to top image
    public var zeroSpaceToTopImage: Bool = false
    
    // Top image content mode
    var topImageContentMode: DSImageContentMode = .scaleAspectFill
    
    /// Init action view model with title, subtitle and left sf symbol
    /// - Parameters:
    ///   - title: Title, with headline style
    ///   - subtitle: Subtitle with subheadline style `default is nil`
    ///   - leftSFSymbol: Left SF Symbol, `default is nil`
    ///   - arrow: Add or not to add right arrow `default is true`
    ///   - didTap: Handle did tap on action
    public init(title: String,
                subtitle: String? = nil,
                leftSFSymbol: String? = nil,
                arrow: Bool = true,
                didTap handleDidTap: ((DSActionVM) -> Void)? = nil) {
        
        let text = DSTextComposer()
        
        // Title
        text.add(type: .headline, text: title)
        
        // Subtitle if exists
        if let subtitle = subtitle {
            text.add(type: .subheadline, text: subtitle)
        }
        
        // Symbol if exists
        if let leftSFSymbol = leftSFSymbol {
            
            let image = DSImage(content: .sfSymbol(name: leftSFSymbol, style: .medium),
                                displayStyle: .default,
                                tintColor: .text(.headline),
                                contentMode: .scaleAspectFit)
            
            self.leftView = DSView(.image(image))
        }
        
        // Arrow if `true`
        if arrow {
            
            let arrow = DSImage(content: .sfSymbol(name: "chevron.right", style: .medium),
                                size: .size(CGSize(width: 12, height: 23)),
                                tintColor: .text(.subheadline))
            
            // Set right view
            self.rightView = DSView(.image(arrow))
        }
        
        self.text = text
        self.didTap = { tap in
            if let tap = tap as? DSActionVM {
                handleDidTap?(tap)
            }
        }
    }
    
    /// Init with text composer
    /// - Parameter text: DSTextComposer
    public init(composer: DSTextComposer) {
        self.text = composer
    }
    
    /// Unique identifier
    public var identifier = "Action"
    
    /// Accessibility identifier
    public var accessibilityIdentifier = "Action"
    
    /// Style
    public var style: DSViewModelStyle = DSViewModelStyle(displayStyle: .grouped(inSection: false))
    
    /// Handle did tap
    @NonEquatable public var didTap: ((DSViewModel) -> Void)?
    
    /// Companion object
    @NonEquatable public var object: AnyObject?
    
    /// Supplementary items
    public var supplementaryItems: [DSSupplementaryView]?
    
    public var bottomSideView: DSSideView?
    public var leftSideView: DSSideView?
    public var rightSideView: DSSideView?
    public var topSideView: DSSideView?
}

public extension DSActionVM {
    
    /// Return unique identifier
    func reuseIdentifier() -> String {
        
        var id = topImageHeight.rawValue
        id += topImage?.rawValue ?? "TopImageNone"
        id += rightView?.content.rawValue ?? "RightViewNone"
        id += leftView?.content.rawValue ?? "LeftViewNone"
        id += style.displayStyle.rawValue
        id += width.rawValue
        id += height?.rawValue ?? "Height"
        return String(describing: type(of: self)) + id
    }
    
    /// Calculate estimated height
    func estimatedHeight() -> CGFloat {
        
        var additionalHeight: CGFloat = 0
        
        switch self.topImageHeight {
        case .equalTo(let imageHeight):
            additionalHeight = imageHeight
        case .zero:
            additionalHeight = 0
        case .unknown:
            additionalHeight = 0
        }
        
        switch style.displayStyle {
        case .default:
            return 30 + additionalHeight
        case .grouped(inSection: _):
            return 55 + additionalHeight
        }
    }
    
    /// Width for NSCollectionLayoutEnvironment and DSSection
    /// - Parameters:
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    ///   - section: DSSection
    /// - Returns: DSViewModelWidth
    func width(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelWidth {
        return width
    }
    
    /// Height for NSCollectionLayoutEnvironment and DSSection
    /// - Parameters:
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    ///   - section: DSSection
    /// - Returns: DSViewModelWidth
    func height(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelHeight {
        return height != nil ? height! : .estimated(estimatedHeight())
    }
    
    /// Model view representation for this view model
    /// - Returns: DSReusableUIView
    func viewRepresentation() -> DSReusableUIView {
        return DSActionUIView.instanceFromNib()
    }
    
    /// Compare this view model to other view models
    /// - Parameter model: DSViewModel
    /// - Returns: Bool
    func isEqual(to model: DSViewModel) -> Bool {
        guard let model = model as? Self else { return false }
        return self == model
    }
    
    /// Get string hash value
    /// - Returns: String
    func hash() -> String {
        return hashValue.string()
    }
}
