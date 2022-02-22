//
//  DSGridSection.swift
//  DSKit
//
//  Created by Borinschi Ivan on 10.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public final class DSGridSection: DSSection {
    
    /// Grid section
    /// - Parameters:
    ///   - viewModels: View models to display
    ///   - columns: Number of columns
    public init(viewModels: [DSViewModel], columns: Int = 2) {
        
        super.init()
        self.viewModels = viewModels
        
        let appearance = DSAppearance.shared.main
        
        insets = UIEdgeInsets(top: appearance.margins,
                              left: appearance.margins,
                              bottom: 0,
                              right: appearance.margins)
        
        type = .grid(columns: columns)
        interItemSpacing = appearance.interItemSpacing
    }
}
