//
//  DSViewModel+Sections.swift
//  DSKit
//
//  Created by Borinschi Ivan on 27.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

public extension DSViewModel {
    
    /// Wrap `any` DSViewModel in to DSSection
    /// - Parameters:
    ///   - separator: Should section divide items with separator, `default is false`
    ///   - grouped: Should section be grouped `default is false`
    /// - Returns: DSSection
    func list(separator: Bool = false, grouped: Bool = false, identifier: String? = nil) -> DSSection {
        let models: [DSViewModel] = [self]
        let section = models.list(separator: separator, grouped: grouped)
        section.identifier = identifier
        return section
    }
    
    /// Wrap `any` DSViewModel in to `DSGallerySection`
    /// - Parameters:
    ///   - type: DSSectionGalleryType `default is .default`
    ///   - pageControl: Should section show page control
    ///   - grouped: Should section be grouped `default is false`
    /// - Returns: DSSection
    func gallery(type: DSSectionGalleryType = .default, grouped: Bool = false, identifier: String? = nil) -> DSSection {
        
        let models: [DSViewModel] = [self]
        let section = models.gallery(type: type, grouped: grouped, identifier: identifier)
        section.identifier = identifier
        return section
    }
}

public extension Array where Element == DSViewModel {
    
    /// Wrap `any` array of DSViewModel in to `DSListSection`
    /// `DSListSection` is a extension for `DSSection`
    /// - Parameters:
    ///   - separator: Should section divide items with separator, `default is false`
    /// - Returns: DSSection
    func list(separator: Bool, identifier: String? = nil) -> DSSection {
        
        let section = DSListSection(viewModels: self, separator: separator)
        section.identifier = identifier
        section.background = .`default`
        return section
    }
    
    /// Wrap `any` array of DSViewModel in to `DSListSection`
    /// `DSListSection` is a extension for `DSSection`
    /// - Parameters:
    ///   - grouped: Should section be grouped `default is false`
    /// - Returns: DSSection
    func list(grouped: Bool, identifier: String? = nil) -> DSSection {
        
        let section = DSListSection(viewModels: self, separator: false)
        section.identifier = identifier
        section.background = (grouped ? .grouped : .`default`)
        return section
    }
    
    /// Wrap `any` array of DSViewModel in to `DSListSection`
    /// `DSListSection` is a extension for `DSSection`
    /// - Parameters:
    ///   - separator: Should section divide items with separator, `default is false`
    ///   - grouped: Should section be grouped `default is false`
    /// - Returns: DSSection
    func list(separator: Bool = false, grouped: Bool = false, identifier: String? = nil) -> DSSection {
        
        let section = DSListSection(viewModels: self, separator: separator)
        section.identifier = identifier
        section.background = (grouped ? .grouped : .`default`)
        return section
    }
    
    /// Wrap `any` array of DSViewModel in to `DSGridSection`
    /// `DSGridSection` is a extension for `DSSection`
    /// - Parameters:
    ///   - columns: Number of columns, `default are 2`
    ///   - grouped: Should section be grouped `default is false`
    /// - Returns: DSSection
    func grid(columns: Int = 2, grouped: Bool = false, identifier: String? = nil) -> DSSection {
        
        let section = DSGridSection(viewModels: self, columns: columns)
        section.background = (grouped ? .grouped : .`default`)
        section.identifier = identifier
        return section
    }
    
    /// Wrap `any` array of DSViewModel in to `DSGallerySection`
    /// - Parameters:
    ///   - type: DSSectionGalleryType `default is .default`
    ///   - grouped: Should section be grouped `default is false`
    /// - Returns: DSSection
    func gallery(type: DSSectionGalleryType = .default, grouped: Bool = false, identifier: String? = nil) -> DSSection {
        
        let section = DSGallerySection(viewModels: self, type: type)
        section.identifier = identifier
        section.background = (grouped ? .grouped : .`default`)
        
        return section
    }
}
