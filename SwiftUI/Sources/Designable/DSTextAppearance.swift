//
//  DSTextColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public protocol DSTextAppearanceProtocol {
    var largeTitle: UIColor { get set }
    var title1: UIColor { get set }
    var title2: UIColor { get set }
    var title3: UIColor { get set }
    var headline: UIColor { get set }
    var subheadline: UIColor { get set }
    var body: UIColor { get set }
    var callout: UIColor { get set }
    var caption1: UIColor { get set }
    var caption2: UIColor { get set }
    var footnote: UIColor { get set }
}

public struct DSTextAppearance: DSTextAppearanceProtocol {
    
    public init(
        largeTitle: UIColor,
        title1: UIColor,
        title2: UIColor,
        title3: UIColor,
        headline: UIColor,
        subheadline: UIColor,
        body: UIColor,
        callout: UIColor,
        caption1: UIColor,
        caption2: UIColor,
        footnote: UIColor
    ) {
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
    
    public var largeTitle: UIColor
    public var title1: UIColor
    public var title2: UIColor
    public var title3: UIColor
    public var headline: UIColor
    public var subheadline: UIColor
    public var body: UIColor
    public var callout: UIColor
    public var caption1: UIColor
    public var caption2: UIColor
    public var footnote: UIColor
}

public extension DSTextAppearance {
    
    /// Get DSTextAppearance using only 2 colors to fill them all
    /// - Parameters:
    ///   - main: UIColor
    ///   - secondary: UIColor
    /// - Returns: DSTextAppearance
    static func textColors(
        main: UIColor, secondary: UIColor
    ) -> DSTextAppearance {
        DSTextAppearance(
            largeTitle: main,
            title1: main,
            title2: main,
            title3: main,
            headline: main,
            subheadline: secondary,
            body: main,
            callout: secondary,
            caption1: secondary,
            caption2: secondary,
            footnote: secondary
        )
    }
}
