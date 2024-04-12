//
//  DSImageHeight.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public enum DSImageHeight: Equatable, Hashable {
    
    case equalTo(CGFloat)
    case zero
    case unknown
    
    var rawValue: String {
        switch self {
        case .equalTo(let height):
            return "ImageHeight\(height)"
        case .zero:
            return "ImageHeightZero"
        case .unknown:
            return "ImageHeightUnknown"
        }
    }
}
