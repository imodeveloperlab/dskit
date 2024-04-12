//
//  DSBottomContainer.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 13.03.2023.
//

import SwiftUI

public struct DSBottomContainer<Content: View>: View {
    
    let content: () -> Content
    
    public init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }
    
    public var body: some View {
        DSVStack{
            content()
        }
        .topShadow(padding: .medium)
        .dsBackground(.primary)
    }
}
