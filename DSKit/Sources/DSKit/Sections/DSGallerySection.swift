//
//  DSGallerySection.swift
//  DSKit
//
//  Created by Borinschi Ivan on 10.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// Extension from DSSection
public final class DSGallerySection: DSSection {
    
    /// Gallery type
    public var galleryType: DSSectionGalleryType
    
    /// Init Gallery section
    /// - Parameters:
    ///   - viewModels: View models to display in section
    ///   - type: DSSectionGalleryType
    public init(viewModels: [DSViewModel], type: DSSectionGalleryType = .default) {
        
        self.galleryType = type
        super.init()        
        let appearance = DSAppearance.shared.main
        self.viewModels = viewModels
        self.type = .gallery(type: type)
        
        self.insets = UIEdgeInsets(top: appearance.margins,
                                   left: appearance.margins,
                                   bottom: 0,
                                   right: appearance.margins)
        
        self.interItemSpacing = appearance.interItemSpacing
    }
}
