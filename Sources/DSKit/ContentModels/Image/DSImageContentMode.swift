//
//  DSImageTintColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public enum DSImageContentMode: Equatable, Hashable {
    
    case scaleAspectFit // contents scaled to fit with fixed aspect. remainder is transparent
    case scaleAspectFill // contents scaled to fill with fixed aspect. some portion of content may be clipped.
    
    public var rawValue: String {
        switch self {
        case .scaleAspectFit:
            return "ScaleAspectFit"
        case .scaleAspectFill:
            return "ScaleAspectFill"
        }
    }
}

extension UIImageView {
    
    /// Image Content mode
    /// - Parameters:
    ///   - contentMode: DSImageContentMode
    func setImageContentMode(_ contentMode: DSImageContentMode) {

        switch contentMode {
        case .scaleAspectFill:
            self.contentMode = .scaleAspectFill
        case .scaleAspectFit:
            self.contentMode = .scaleAspectFit
        }
    }
}
