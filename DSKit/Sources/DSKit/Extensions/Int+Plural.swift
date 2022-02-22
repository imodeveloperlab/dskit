//
//  Int+Plural.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

public extension Int {
    
    /// Return correct form of the string, singular or plural.
    ///
    /// - Parameters:
    ///   - singular: Singular form of the string
    ///   - plural: Plural form of the string
    /// - Returns: String with correct form.
    func getCorrectForm(singular: String, plural: String) -> String {
        if self == 1 {
            return singular
        } else if self > 1 {
            return plural
        } else {
            return plural
        }
    }
}
