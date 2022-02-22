//
//  DynamicColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 16.12.2020.
//

import UIKit

public class DSColor {
        
    /// Generate light and dark color for dynamic interfaces
    /// - Parameters:
    ///   - light: UIColor for light interface
    ///   - dark: UIColor for dark interface
    /// - Returns: UIColor
    public static func color(light: UIColor, dark: UIColor) -> UIColor {
        return UIColor { (traitCollection: UITraitCollection) -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return dark
            } else {
                return light
            }
        }
    }
    
    /// Generate light and dark color for dynamic interfaces
    /// - Parameters:
    ///   - light: UIColor fo light interface
    ///   - dark: UIColor for dark interface
    /// - Returns: UIColor
    public static func color(light: Int, dark: Int) -> UIColor {
        return color(light: UIColor(light), dark: UIColor(dark))
    }
}
