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
    
    /// Headline header with text
    /// - Parameter text: String
    /// - Returns: Self
    @discardableResult func headlineFooter(_ text: String) -> Self {
        self.footer = DSLabelVM(.headline, text: text)
        return self
    }
    
    /// Subheadline header with text
    /// - Parameter text: String
    /// - Returns: Self
    @discardableResult func subheadlineFooter(_ text: String) -> Self {
        self.footer = DSLabelVM(.subheadline, text: text)
        return self
    }
}
