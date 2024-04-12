//
//  DSBackgroundModifier.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import SwiftUI

public struct DSCustomBackgroundModifier: ViewModifier {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.viewStyle) var viewStyle: DSViewStyle
    
    let dsColor: DSColorKey
    
    public init(dsColor: DSColorKey) {
        self.dsColor = dsColor
    }
    
    public func body(content: Content) -> some View {
        content.background(dsColor.color(for: appearance, and: viewStyle))
    }
}

public extension View {
    func dsBackground(_ dsColor: DSColorKey) -> some View {
        let modifier = DSCustomBackgroundModifier(dsColor: dsColor)
        return self.modifier(modifier)
    }
}

struct Testable_DSCustomBackgroundModifier: View {
    var body: some View {
        DSPreview {
            DSVStack {
                DSText("Secondary background")
                DSVStack {
                    DSText("Primary Background")
                    DSVStack {
                        DSText("Secondary Background")
                        DSVStack {
                            DSText("Primary Background")
                        }
                        .dsPadding()
                        dsBackground(.primary)
                    }
                    .dsPadding()
                    .dsBackground(.secondary)
                }
                .dsPadding()
                .dsBackground(.primary)
            }
            .dsPadding()
            .dsBackground(.secondary)
        }.dsScreen()
    }
}

#Preview {
    Testable_DSCustomBackgroundModifier()
}
