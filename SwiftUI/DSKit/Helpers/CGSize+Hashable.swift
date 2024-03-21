//
//  CGSize+Hashable.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 20.12.2022.
//

import Foundation
import CoreGraphics

extension CGSize: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(width)
        hasher.combine(height)
    }
}
