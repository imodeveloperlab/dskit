//
//  DSBackgroundModifier.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import SwiftUI

public struct DSBackgroundModifier: ViewModifier {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.viewStyle) var viewStyle: DSViewStyle
    
    let group: DSViewStyle
    
    public init(group: DSViewStyle) {
        self.group = group
    }
    
    public func body(content: Content) -> some View {
        content.background(Color(uiColor: group.colors(from: appearance).background))
            .environment(\.viewStyle, viewStyle)
    }
}

public extension View {
    func dsBackground(_ group: DSViewStyle) -> some View {
        let modifier = DSBackgroundModifier(group: group)
        return self.modifier(modifier)
    }
}

struct Testable_DSBackgroundModifier: View {
    var body: some View {
        DSVStack {
            DSText("Primary Background")
            DSVStack {
                DSText("Secondary Background")
                DSVStack {
                    DSText("Primary Background")
                    DSVStack {
                        DSText("Decondary Background")
                    }
                    .dsPadding()
                    .dsBackground(.secondary)
                }
                .dsPadding()
                .dsBackground(.primary)
            }
            .dsPadding()
            .dsBackground(.secondary)
        }
        .dsPadding()
        .dsBackground(.primary)
    }
}

#Preview {
    Testable_DSBackgroundModifier()
}
