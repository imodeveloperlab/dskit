//
//  String+Currency.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

extension String {
    var currencySymbol: String {
        switch self {
        case "EUR": return "€"
        case "USD": return "$"
        case "GBP": return "£"
        default: return self
        }
    }
}
