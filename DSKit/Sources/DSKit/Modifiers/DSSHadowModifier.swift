//
//  DSShadowModifier.swift
//  DSKit
//
//  Created by Ivan Borinschi on 28.12.2022.
//

import SwiftUI

public struct DSShadowModifier: ViewModifier {
    
    @Environment(\.appearance) var appearance: DSAppearance
    let padding: DSPadding
    
    var color: Color
    var radius: CGFloat
    var xOffset: CGFloat
    var yOffset: CGFloat
    
    
    init(padding: DSPadding, color: Color = .black, radius: CGFloat = 10, xOffset: CGFloat = 0, yOffset: CGFloat = -5) {
        self.padding = padding
        self.color = color
        self.radius = radius
        self.xOffset = xOffset
        self.yOffset = yOffset
    }
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .top) {
            content
                .dsPadding(.top, padding)
            Rectangle()
                .fill(Color.blue)
                .frame(maxWidth: .infinity)
                .frame(height: 20)
                .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 1)
                .clipShape(
                    Rectangle()
                        .offset(CGSize(width: 0, height: -20))
                )
        }
    }
}

public extension View {
    func topShadow(padding: DSPadding, radius: CGFloat = 10, yOffset: CGFloat = -5) -> some View {
        self.modifier(DSShadowModifier(padding: padding, radius: radius, yOffset: yOffset))
    }
}

struct DSShadowModifier_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { DSPreview {
            ScrollView {
                DSText("Card")
                    .dsPadding()
                    .dsSecondaryBackground()
                    .dsCornerRadius()
                    .dsPadding()
            }.safeAreaInset(edge: .bottom) {
                DSText("Bottom")
                    .dsPadding()
                    .dsSecondaryBackground()
                    .dsCornerRadius()
                    .dsPadding(.horizontal)
                    .dsPadding(.horizontal)
                    .topShadow(padding: .regular)
            }
        }
        }
    }
}
