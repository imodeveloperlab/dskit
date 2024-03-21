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
    @Environment(\.colorGroup) var colorGroup: DSColorGroup
    
    let color: DSColor?
    
    public init(color: DSColor?) {
        self.color = color
    }
    
    public func body(content: Content) -> some View {
        if let color {
            content.background(Color(uiColor: color.color(from: appearance)))
        } else {
            content.background(Color(uiColor: colorGroup.colors(from: appearance).background))
        }
    }
}

public extension View {
    func dsBackground(_ color: DSColor? = nil) -> some View {
        let modifier = DSBackgroundModifier(color: color)
        return self.modifier(modifier)
    }
}

#Preview {
    DSVStack {
        
        Spacer()
        
        DSVStack {
            DSText("Secondary background")
        }
        .dsPadding()
        .dsBackground(.secondaryViewBackground)
        
        DSVStack {
            DSText("Primary background")
        }
        .dsPadding()
        .dsBackground(.primaryViewBackground)
        
        Spacer()
    }
    .dsPadding()
    .dsBackground()
}
