//
//  DSButtonVM.swift
//  DSKit
//
//  Created by Borinschi Ivan on 11.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public struct DSButtonVM: DSViewModel, Equatable, Hashable {
    
    public enum DSButtonVMImagePosition {
        case left
        case right
        case rightMargin
        case leftMargin
    }
    
    /// Button text
    public var text: String?
    public var icon: UIImage?
    public var imagePosition: DSButtonVMImagePosition = .left
    public var isEnabled: Bool = true
    
    /// Init button view model
    /// - Parameters:
    ///   - title: Button text
    ///   - type: DSButtonVMType
    ///   - handleDidTap: Handle did tap
    public init(title: String? = nil,
                icon: UIImage? = nil,
                type: DSButtonVMType = .default,
                textAlignment: NSTextAlignment = .center,
                didTap handleDidTap: ((DSButtonVM) -> Void)? = nil) {
        
        self.text = title
        self.type = type
        self.icon = icon
        self.textAlignment = textAlignment
        
        self.didTap = { tap in
            if let tap = tap as? DSButtonVM {
                handleDidTap?(tap)
            }
        }
    }
    
    /// Init button view model
    /// - Parameters:
    ///   - title: Button text
    ///   - type: DSButtonVMType
    ///   - handleDidTap: Handle did tap
    public init(title: String? = nil,
                sfSymbol: String,
                style: DSSFSymbolConfigStyle = .medium,
                type: DSButtonVMType = .default,
                textAlignment: NSTextAlignment = .center,
                didTap handleDidTap: ((DSButtonVM) -> Void)? = nil) {
        
        self.text = title
        self.type = type
        
        let config = DSSFSymbolConfig.symbolConfig(style: style)
        self.icon = UIImage.symbolImage(with: sfSymbol, configuration: config)
        self.textAlignment = textAlignment
        
        self.didTap = { tap in
            if let tap = tap as? DSButtonVM {
                handleDidTap?(tap)
            }
        }
    }
    
    /// Button height
    public var height: DSViewModelHeight?
    
    /// Button width
    public var width: DSViewModelWidth = .fractional(1.0)
    
    /// Button text alignment
    public var textAlignment: NSTextAlignment = .center
    
    /// Button type
    public var type: DSButtonVMType = .default
    
    /// Button identifier
    public var identifier = "Button"
    
    /// Button accessibility identifier
    public var accessibilityIdentifier: String = "Button"
    
    /// Style
    public var style: DSViewModelStyle = DSViewModelStyle()
    
    /// Handle did tap on button
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

/// Button styles
public enum DSButtonVMType: Equatable, Hashable {
    
    case `default`
    case link
    case linkWhite
    case linkBlack
    case light
    case secondaryView
    case primaryViewWithBorder
    case cleanWithBorder
    case facebook
    case twitter
    case blur(effect: DSButtonVMBlurEffect, color: DSTextColor)
}

public enum DSButtonVMBlurEffect: Hashable {
    
    case light
    case dark
    
    func style() -> UIBlurEffect.Style {
        switch self {
        case .dark:
            return UIBlurEffect.Style.dark
        case .light:
            return UIBlurEffect.Style.light
        }
    }
}

public extension DSButtonVM {
    
    /// Get view model height
    /// - Parameters:
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    ///   - section: DSSection
    /// - Returns: DSViewModelHeight
    func height(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelHeight {
        return height != nil ? height! : .absolute(DSAppearance.shared.main.buttonsHeight)
    }
    
    /// Get view model height
    /// - Parameters:
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    ///   - section: DSSection
    /// - Returns: DSViewModelWidth
    func width(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelWidth {
        return width
    }
    
    /// View model view representation
    /// - Returns: DSReusableUIView
    func viewRepresentation() -> DSReusableUIView {
        return DSButtonUIView.instanceFromNib()
    }
    
    /// Is view model equal to other view model
    /// - Parameter object: DSViewModel
    /// - Returns: Bool
    func isEqual(to object: DSViewModel) -> Bool {
        guard let object = object as? Self else { return false }
        return self == object
    }
    
    /// View model hash value
    /// - Returns: String
    func hash() -> String {
        return hashValue.string()
    }
}

public extension DSButtonVM {
    
    static func light(text: String, icon: UIImage? = nil) -> DSButtonVM {
        var button = DSButtonVM(title: text, icon: icon)
        button.type = .light
        return button
    }
    
    static func link(text: String, icon: UIImage? = nil) -> DSButtonVM {
        var button = DSButtonVM(title: text, icon: icon)
        button.type = .link
        return button
    }
}
