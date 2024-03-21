//
//  Fonts.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// Designable fonts
public class DSDesignableFonts {
    
    var fontName: String
    
    public init(fontName: String = "Default") {
        self.fontName = fontName
    }
    
    private lazy var scaledFont: DSScaledFont = {
        DSScaledFont(fontName: fontName)
    }()
    
    lazy public var body: UIFont = {
        return scaledFont.font(forTextStyle: .body)
    }()
    
    lazy public var callout: UIFont = {
        return scaledFont.font(forTextStyle: .callout)
    }()
    
    lazy public var caption1: UIFont = {
        return scaledFont.font(forTextStyle: .caption1)
    }()
    
    lazy public var caption2: UIFont = {
        return scaledFont.font(forTextStyle: .caption2)
    }()
    
    lazy public var footnote: UIFont  = {
        return scaledFont.font(forTextStyle: .footnote)
    }()
    
    lazy public var headline: UIFont = {
        return scaledFont.font(forTextStyle: .headline)
    }()
    
    lazy public var subheadline: UIFont = {
        return scaledFont.font(forTextStyle: .subheadline)
    }()
    
    lazy public var largeTitle: UIFont = {
        return scaledFont.font(forTextStyle: .largeTitle)
    }()
    
    lazy public var title1: UIFont = {
        return scaledFont.font(forTextStyle: .title1)
    }()
    
    lazy public var title2: UIFont = {
        return scaledFont.font(forTextStyle: .title2)
    }()
    
    lazy public var title3: UIFont = {
        return scaledFont.font(forTextStyle: .title3)
    }()
}
