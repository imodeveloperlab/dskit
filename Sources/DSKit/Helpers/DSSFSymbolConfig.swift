//
//  DSSymbolConfig.swift
//  DSKit
//
//  Created by Borinschi Ivan on 28.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// Symbol configuration
public enum DSSFSymbolConfigStyle: Hashable, Equatable {
    case extraSmall
    case small
    case medium
    case large
    case extraLarge
    case custom(size: Float, weight: UIImage.SymbolWeight)
}

public class DSSFSymbolConfig {
    
    /// Get font size for configuration
    /// - Parameter style: DSSFSymbolConfigStyle
    /// - Returns: CGFloat
    public static func fontSize(style: DSSFSymbolConfigStyle) -> CGFloat {
        
        var size: CGFloat = 10
        
        switch style {
        case .extraSmall:
            size = 9
        case .small:
            size = 14
        case .medium:
            size = 15
        case .large:
            size = 20
        case .extraLarge:
            size = 25
        case .custom(size: let symbolSize, weight: _):
            size = CGFloat(symbolSize)
        }
        
        return size
    }
    
    /// Get symbol configuration for DSSFSymbolConfigStyle
    /// - Parameter style: DSSFSymbolConfigStyle
    /// - Returns: SymbolConfiguration
    public static func symbolConfig(style: DSSFSymbolConfigStyle) -> UIImage.SymbolConfiguration {
        
        let size = DSSFSymbolConfig.fontSize(style: style)
        
        switch style {
        case .small, .extraSmall:
            return UIImage.SymbolConfiguration(pointSize: size, weight: .light, scale: .small)
        case .medium:
            return UIImage.SymbolConfiguration(pointSize: size, weight: .medium, scale: .medium)
        case .large, .extraLarge:
            return UIImage.SymbolConfiguration(pointSize: size, weight: .medium, scale: .large)
        case .custom(size: _, weight: let weight):
            return UIImage.SymbolConfiguration(pointSize: size, weight: weight, scale: .medium)
        }
    }
    
    /// Get button icon UIImage with proper DSSFSymbolConfigStyle for buttons
    /// - Parameter name: String
    /// - Returns: UIImage?
    public static func buttonIcon(_ name: String) -> UIImage? {
        let config = DSSFSymbolConfig.symbolConfig(style: .custom(size: 16, weight: .bold))
        
        return UIImage.symbolImage(with: name, configuration: config)
    }
    
    /// Get icon with configuration
    /// - Parameter name: String
    /// - Returns: UIImage?
    public static func icon(_ name: String, config: UIImage.SymbolConfiguration) -> UIImage? {
        return UIImage.symbolImage(with: name, configuration: config)
    }
}
