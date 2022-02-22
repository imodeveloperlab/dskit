//
//  DSSectionBackgroundType.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

/// Section background type
public enum DSSectionBackgroundType {
    case `default`
    case grouped
    case primaryBackground
    case secondaryBackground
}

/// Is section background grouped
extension DSSectionBackgroundType {
    var isGrouped: Bool {
        self == .grouped
    }
}
