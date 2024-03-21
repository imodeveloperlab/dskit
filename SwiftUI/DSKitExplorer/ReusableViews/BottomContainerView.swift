//
//  BottomContainerView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 13.03.2023.
//

import SwiftUI
import DSKit

public struct BottomContainerView<Content: View>: View {
    
    let horizontalPadding: Bool
    let content: () -> Content
    
    public init(
        horizontalPadding: Bool = true,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
        self.horizontalPadding = horizontalPadding
    }
    
    public var body: some View {
        DSVStack{
            content()
        }
        .dsPadding(.horizontal, horizontalPadding ? .regular : .zero)
        .topShadow(padding: .regular)
        .dsBackground()
    }
}
