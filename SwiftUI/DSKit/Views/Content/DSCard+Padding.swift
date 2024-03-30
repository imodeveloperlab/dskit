//
//  DSCard+Padding.swift
//  DSKit
//
//  Created by Ivan Borinschi on 01.03.2023.
//

import SwiftUI

public extension View {
    func dsCardHorizontalPadding(_ padding: DSSpacingDimension = .medium) -> some View {
        self.environment(\.cardHorizontalPadding, padding)
    }
}

public extension View {
    func dsCardVerticalPadding(_ padding: DSSpacingDimension = .medium) -> some View {
        self.environment(\.cardVerticalPadding, padding)
    }
}

public extension View {
    func dsCardPadding(_ padding: DSSpacingDimension = .medium) -> some View {
        self
            .environment(\.cardVerticalPadding, padding)
            .environment(\.cardHorizontalPadding, padding)
    }
}
