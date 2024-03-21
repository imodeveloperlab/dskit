//
//  DSFullScreen.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI

public struct DSFullScreen<Content: View>: View {

    let content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        DSVStack {
            Spacer()
            content()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .dsBackground()
    }
}

#Preview {
    DSFullScreen {
        DSText("Example")
    }
}
