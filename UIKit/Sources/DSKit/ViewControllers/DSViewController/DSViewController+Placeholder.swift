//
//  DSViewController+Placeholder.swift
//  DSKit
//
//  Created by Borinschi Ivan on 02.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension DSViewController {
    
    /// Get placeholder section
    /// - Parameters:
    ///   - image: UIImage
    ///   - text: String
    /// - Returns: DSSection
    public func getPlaceholderSection(image: UIImage?, text: String) -> DSSection {
        
        var viewModels = [DSViewModel]()
        
        let space = DSSpaceVM(type: .custom(UIScreen.main.bounds.height / 7))
        viewModels.append(space)
        
        if let image = image {
            var imageView = DSImageVM(imageValue: .image(image: image), height: .absolute(70))
            imageView.contentMode = .scaleAspectFit
            imageView.imageDisplayStyle = .default
            viewModels.append(imageView)
        }
        
        let text = DSLabelVM(.subheadline, text: text, alignment: .center)
        viewModels.append(text)
        
        return viewModels.list()
    }
    
    /// Show placeholder
    /// - Parameters:
    ///   - image: UIImage?
    ///   - text: String
    public func showPlaceholder(image: UIImage? = nil, text: String) {
        self.show(content: getPlaceholderSection(image: image, text: text))
    }
}
