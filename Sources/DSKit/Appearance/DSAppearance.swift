//
//  DSAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 02.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import Combine

/// Used to config UI/UX colors, spaces, and sizes
public class DSAppearance {
    
    // Handle and update all UI/UX elements when appearance changes
    internal var appearancePublisher = PassthroughSubject<DSDesignable, Never>()
    
    // Shared instance for DSAppearance
    public static let shared = DSAppearance()
    
    // Main appearance
    public var main: DSDesignable = SystemAppearance() {
        didSet {
            appearancePublisher.send(main)
        }
    }
    
    // User interface style, default is `unspecified`
    public var userInterfaceStyle: UIUserInterfaceStyle = .unspecified {
        didSet {
            appearancePublisher.send(main)
        }
    }
}

public extension DSAppearance {
    
    /// Get list of available appearance
    /// - Returns: Array of appearances [DSDesignable]
    static func allAppearances() -> [DSDesignable] {
        
        return [SystemAppearance(),
                DSKitAppearance(),
                DSNewsAppearance(),
                MintAppearance(),
        ]
    }
    
    /// Get appearance with title
    /// - Parameter title: String
    /// - Returns: DSDesignable
    static func appearanceWith(title: String) -> DSDesignable? {
        
        let appearances = DSAppearance.allAppearances().filter { (app: DSDesignable) -> Bool in
            app.title == title
        }
        
        return appearances.first
    }
}
