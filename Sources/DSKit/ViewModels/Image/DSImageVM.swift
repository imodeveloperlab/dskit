//
//  DSImageVM.swift
//  DSKit
//
//  Created by Borinschi Ivan on 15.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//
//

import UIKit

public struct DSImageVM: DSViewModel, Equatable, Hashable {
    
    // Image content
    public var imageContent: DSImageContent
    
    // Image display style
    public var imageDisplayStyle: DSImageDisplayStyle
    
    // Content mode
    public var contentMode: DSImageContentMode = .scaleAspectFill
    
    // Tint color
    public var tintColor: DSImageTintColor = .default
    
    /// Init image with Name
    /// - Parameters:
    ///   - image: Name
    ///   - height: DSViewModelHeight `default is .absolute(150)`
    ///   - imageDisplayStyle: DSImageDisplayStyle `default is themeCornerRadius`
    ///   - contentMode: DSImageContentMode `default is scaleAspectFill`
    public init(named: String,
                height: DSViewModelHeight = .fractional(1.0),
                displayStyle: DSImageDisplayStyle = .themeCornerRadius,
                contentMode: DSImageContentMode = .scaleAspectFill) {
        
        self.imageContent = .image(image: UIImage(named: named))
        self.height = height
        self.imageDisplayStyle = displayStyle
        self.contentMode = contentMode
    }
    
    /// Init image with UIImage
    /// - Parameters:
    ///   - image: UIImage
    ///   - height: DSViewModelHeight `default is .absolute(150)`
    ///   - imageDisplayStyle: DSImageDisplayStyle `default is themeCornerRadius`
    ///   - contentMode: DSImageContentMode `default is scaleAspectFill`
    public init(image: UIImage?,
                height: DSViewModelHeight = .fractional(1.0),
                displayStyle: DSImageDisplayStyle = .themeCornerRadius,
                contentMode: DSImageContentMode = .scaleAspectFill) {
        
        self.imageContent = .image(image: image)
        self.height = height
        self.imageDisplayStyle = displayStyle
        self.contentMode = contentMode
    }
    
    /// Init image with DSImageContent
    /// - Parameters:
    ///   - image: UIImage
    ///   - height: DSViewModelHeight `default is .absolute(150)`
    ///   - imageDisplayStyle: DSImageDisplayStyle `default is themeCornerRadius`
    ///   - contentMode: DSImageContentMode `default is scaleAspectFill`
    public init(imageValue: DSImageContent,
                height: DSViewModelHeight = .fractional(1.0),
                displayStyle: DSImageDisplayStyle = .themeCornerRadius ,
                contentMode: DSImageContentMode = .scaleAspectFill) {
        
        self.imageContent = imageValue
        self.height = height
        self.imageDisplayStyle = displayStyle
        self.contentMode = contentMode
    }
    
    /// Init image with URL?
    /// - Parameters:
    ///   - image: UIImage
    ///   - height: DSViewModelHeight `default is .absolute(150)`
    ///   - imageDisplayStyle: DSImageDisplayStyle `default is themeCornerRadius`
    ///   - contentMode: DSImageContentMode `default is scaleAspectFill`
    public init(imageUrl: URL?,
                height: DSViewModelHeight = .fractional(1.0),
                displayStyle: DSImageDisplayStyle = .themeCornerRadius,
                contentMode: DSImageContentMode = .scaleAspectFill) {
        
        self.imageContent = DSImageContent.imageURL(url: imageUrl)
        self.height = height
        self.imageDisplayStyle = displayStyle
        self.contentMode = contentMode
    }
    
    // View width
    public var height: DSViewModelHeight = .absolute(150)
    
    // View height
    public var width: DSViewModelWidth = .fractional(1.0)
    
    // View type
    public var type: ImageViewModelType = .default
    
    // Uniq identifier
    public var identifier = "Image"
    
    // View accessibility identifier
    public var accessibilityIdentifier = "Image"
    
    /// Style
    public var style: DSViewModelStyle = DSViewModelStyle()
    
    // Handle did tap action
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

public enum ImageViewModelType {
    case `default`
}

public extension DSImageVM {
    
    func reuseIdentifier() -> String {
        
        var id = imageContent.rawValue
        id += imageDisplayStyle.rawValue
        id += contentMode.rawValue
        id += tintColor.rawValue
        id += style.displayStyle.rawValue
        id += width.rawValue
        id += height.rawValue
        
        return "DSImageVM" + id
    }
    
    /// Width for NSCollectionLayoutEnvironment and DSSection
    /// - Parameters:
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    ///   - section: DSSection
    /// - Returns: DSViewModelWidth
    func height(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelHeight {
        
        if height.isEstimated {
            
            guard let image = imageContent.image,
                  let containerWidth = layoutEnvironment?.container.contentSize.width,
                  let containerHeight = layoutEnvironment?.container.contentSize.height else {
                        return height
                    }
            
                    guard image.size.width > 0 && image.size.height > 0 else {
                        return height
                    }

                    let scale: CGFloat
                    if image.size.width > image.size.height {
                        scale = containerWidth / image.size.width
                    } else {
                        scale = containerHeight / image.size.height
                    }

                    let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
            
                return .absolute(size.height)
        }
        
        return height
    }
    
    /// Height for NSCollectionLayoutEnvironment and DSSection
    /// - Parameters:
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    ///   - section: DSSection
    /// - Returns: DSViewModelWidth
    func width(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelWidth {
        return width
    }
    
    /// Model view representation for this view model
    /// - Returns: DSReusableUIView
    func viewRepresentation() -> DSReusableUIView {
        return DSImageUIView.instanceFromNib()
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
