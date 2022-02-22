//
//  DSTextColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// Texts colors
public struct DSDesignableTextColor: Equatable, Hashable {
    
    /// Init text colors
    /// - Parameters:
    ///   - title1: UIColor
    ///   - title2: UIColor
    ///   - title3: UIColor
    ///   - headline: UIColor
    ///   - subheadline: UIColor
    ///   - body: UIColor
    ///   - callout: UIColor
    ///   - caption1: UIColor
    ///   - caption2: UIColor
    ///   - footnote: UIColor
    public init(largeTitle: UIColor,
                title1: UIColor,
                title2: UIColor,
                title3: UIColor,
                headline: UIColor,
                subheadline: UIColor,
                body: UIColor,
                callout: UIColor,
                caption1: UIColor,
                caption2: UIColor,
                footnote: UIColor) {
        
        self.largeTitle = largeTitle
        self.title1 = title1
        self.title2 = title2
        self.title3 = title3
        self.headline = headline
        self.subheadline = subheadline
        self.body = body
        self.callout = callout
        self.caption1 = caption1
        self.caption2 = caption2
        self.footnote = footnote
    }
    
    /// Title 1 color
    public var largeTitle: UIColor
    
    /// Title 1 color
    public var title1: UIColor
    
    /// Title 1 color
    public var title2: UIColor
    
    /// Title 1 color
    public var title3: UIColor
    
    /// Headline color
    public var headline: UIColor
    
    /// Subheadline color
    public var subheadline: UIColor
    
    /// Body color
    public var body: UIColor
    
    /// Callout color
    public var callout: UIColor
    
    /// Caption 1 color
    public var caption1: UIColor
    
    /// Caption 2 color
    public var caption2: UIColor
    
    /// Footnote color
    public var footnote: UIColor
}

public extension DSDesignableTextColor {
    
    /// Get DSDesignableTextColor using only 2 colors to fill them all
    /// - Parameters:
    ///   - main: UIColor
    ///   - secondary: UIColor
    /// - Returns: DSDesignableTextColor
    static func textColors(main: UIColor, secondary: UIColor) -> DSDesignableTextColor {
        
        return DSDesignableTextColor(largeTitle: main,
                                     title1: main,
                                     title2: main,
                                     title3: main,
                                     headline: main,
                                     subheadline: secondary,
                                     body: main,
                                     callout: secondary,
                                     caption1: secondary,
                                     caption2: secondary,
                                     footnote: secondary)
    }
}
