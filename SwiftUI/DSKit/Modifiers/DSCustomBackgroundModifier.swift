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
    @Environment(\.colorGroup) var colorGroup: DSViewStyle
    
    let color: DSColor
    
    public init(color: DSColor) {
        self.color = color
    }
    
    public func body(content: Content) -> some View {
        content.background(Color(uiColor: color.styledColorDemo(from: appearance, and: colorGroup)))
    }
}

public extension View {
    func dsBackground(_ color: DSColor) -> some View {
        let modifier = DSCustomBackgroundModifier(color: color)
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
