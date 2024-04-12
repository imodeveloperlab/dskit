//
//  DSBlurBackgroundModifier.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import SwiftUI

public struct BlurredBackgroundView: UIViewRepresentable {
    var style: UIBlurEffect.Style

    public func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }

    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

public struct DSBlurBackgroundModifier: ViewModifier {
    
    let style: UIBlurEffect.Style
    
    public func body(content: Content) -> some View {
        content
            .background(BlurredBackgroundView(style: style)
                .edgesIgnoringSafeArea(.all))
    }
}

public extension View {
    func dsBlurBackground(style: UIBlurEffect.Style = .systemThinMaterialDark) -> some View {
        let modifier = DSBlurBackgroundModifier(style: style)
        return self.modifier(modifier)
    }
}

#Preview {
    VStack {
        DSVStack {
            DSText("Default")
            DSText("Grouped")
            DSText("Grouped in section")
        }.dsBlurBackground()
    }.dsPadding()
}
