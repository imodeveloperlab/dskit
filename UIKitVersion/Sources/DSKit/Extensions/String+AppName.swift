//
//  String+AppName.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

public extension String {
    
    static func appName() -> String {
        return Bundle.main.infoDictionary!["CFBundleDisplayName"] as? String ?? "App"
    }
    
    func style(_ appearance: DSDesignable) -> String {
        return self
    }
    
    func toAccessibilityIdentifierStyle() -> String {
        return self.replace(target: " ", withString: "_").replace(target: "-", withString: "_").uppercased()
    }
    
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
}
