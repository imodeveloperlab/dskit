//
//  DoubleExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

extension Double {
    
    /// Rounds the double to decimal places value
    /// - Parameter places: Place to round to, Example: Double(123.456789).rounded(toPlaces: 1) will equal to 123.5
    /// - Returns: Double
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
