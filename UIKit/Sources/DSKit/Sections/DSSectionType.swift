//
//  DSSectionType.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

/// Section type
public enum DSSectionType: Equatable, Hashable {
    case list
    case gallery(type: DSSectionGalleryType)
    case grid(columns: Int = 2)
}
