//
//  DSListSection.swift
//  DSKit
//
//  Created by Borinschi Ivan on 10.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public final class DSListSection: DSSection {
    
    /// List section
    /// - Parameters:
    ///   - viewModels: View models to display
    ///   - separator: Should view models be divided by separator
    public init(viewModels: [DSViewModel], separator: Bool = false) {
        
        super.init()
        
        if separator {
            self.viewModels = addSeparators(for: viewModels)
        } else {
            self.viewModels = viewModels
        }
        
        setUp()
    }
    
    /// List section with array of arrays of view models
    /// - Parameters:
    ///   - viewModels: Array of arrays of view models
    ///   - separator: Should view models be divided by separator
    public init(viewModels: [[DSViewModel]], separator: Bool = false) {
        
        super.init()
        
        if separator {
            self.viewModels = addSeparators(for: viewModels).flatMap({ $0 })
        } else {
            self.viewModels = viewModels.flatMap({ $0 })
        }
        
        setUp()
    }
    
    /// Prepare section
    fileprivate func setUp() {
        let appearance = DSAppearance.shared.main
        insets = UIEdgeInsets(top: appearance.margins,
                              left: appearance.margins,
                              bottom: 0,
                              right: appearance.margins)
        type = .list
        interItemSpacing = appearance.interItemSpacing
    }
    
    /// Add separators between view models array
    /// - Parameter viewModels: [DSViewModel]
    /// - Returns: [DSViewModel]
    fileprivate func addSeparators(for viewModels: [DSViewModel]) -> [DSViewModel] {
        
        var models = viewModels.map { (model) -> [DSViewModel] in
            return [model, separator(displayStyle: model.style.displayStyle)]
        }.flatMap({ $0 })
        
        if models.count > 0 {
            models.removeLast()
        }
        
        return models
    }
    
    /// Add separators between view models array of view models :)
    /// - Parameter viewModels: [[DSViewModel]]
    /// - Returns: [[DSViewModel]]
    fileprivate func addSeparators(for viewModels: [[DSViewModel]]) -> [[DSViewModel]] {
        
        var models = viewModels.map { (models) -> [DSViewModel] in
            var models = models
            models.append(separator(displayStyle: models.last?.style.displayStyle ?? .default))
            return models
        }
        
        models.removeLast()
        
        return models
    }
    
    /// Separator view model
    /// - Parameter displayStyle: DSViewModelDisplayStyle
    /// - Returns: DSViewModel
    fileprivate func separator(displayStyle: DSViewModelDisplayStyle) -> DSViewModel {
        var separator = DSSeparatorVM()
        separator.style.displayStyle = displayStyle
        separator.accessibilityIdentifier = "\(Int.random(in: 0...9999999))\(Int.random(in: 0...9999999))"
        return separator
    }
}
