//
//  DSContentModeModifier.swift
//  DSKit
//
//  Created by Ivan Borinschi on 19.12.2022.
//

import SwiftUI

public enum DSContentMode: Equatable, Hashable {
    
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

struct DSContentModeModifier: ViewModifier {
    let mode: DSContentMode
    func body(content: Content) -> some View {
        switch mode {
        case .scaleAspectFit:
            return content.aspectRatio(contentMode: .fit)
        case .scaleAspectFill:
            return content.aspectRatio(contentMode: .fill)
        }
    }
}

extension View {
    func setContentMode(mode: DSContentMode) -> some View {
        self.modifier(DSContentModeModifier(mode: mode))
    }
}
