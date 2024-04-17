//
//  DSSection+Insets.swift
//  DSKit
//
//  Created by Borinschi Ivan on 03.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation
import UIKit

public extension DSSection {
    
    /// title1 header with text
    /// - Parameter text: String
    /// - Returns: Self
    @discardableResult func title1Header(_ text: String) -> Self {
        self.header = header(type: .title1, text: text)
        return self
    }
    
    /// title2 header with text
    /// - Parameter text: String
    /// - Returns: Self
    @discardableResult func title2Header(_ text: String) -> Self {
        self.header = header(type: .title2, text: text)
        return self
    }
    
    /// title3 header with text
    /// - Parameter text: String
    /// - Returns: Self
    @discardableResult func title3Header(_ text: String) -> Self {
        self.header = header(type: .title3, text: text)
        return self
    }
    
    /// Headline header with text
    /// - Parameter text: String
    /// - Returns: Self
    @discardableResult func headlineHeader(_ text: String) -> Self {
        self.header = header(type: .headline, text: text)
        return self
    }
    
    /// Headline header with text
    /// - Parameter text: String
    /// - Returns: Self
    @discardableResult func headlineHeader(_ text: String, size: CGFloat) -> Self {
        self.header = header(type: .headlineWithSize(size), text: text)
        return self
    }
    
    /// Subheadline header with text
    /// - Parameter text: String
    /// - Returns: Self
    @discardableResult func subheadlineHeader(_ text: String) -> Self {
        self.header = header(type: .subheadline, text: text)
        return self
    }
    
    /// Caption 2 header with text
    /// - Parameter text: String
    /// - Returns: Self
    @discardableResult func caption2Header(_ text: String) -> Self {
        self.header = header(type: .caption2, text: text)
        return self
    }
    
    /// Header
    /// - Parameters:
    ///   - type: DSTextType
    ///   - text: String
    /// - Returns: DSViewModel
    fileprivate func header(type: DSTextType, text: String) -> DSViewModel {
        
        var model = DSLabelVM(type, text: text)
        let font = type.style.font
        let width = UIScreen.main.bounds.width - (DSAppearance.shared.main.margins * 2)
        model.height = .absolute(text.height(forFixedWidth: width, font: font.getFont()))
        return model
    }
}
