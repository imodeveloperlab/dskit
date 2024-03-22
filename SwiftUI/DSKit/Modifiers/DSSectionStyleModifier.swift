//
//  DSSectionStyleModifier.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 14.12.2022.
//

import SwiftUI

public struct DSSectionStyleModifier: ViewModifier {    
    
    let title: String
    
    public init(title: String) {
        self.title = title
    }
    
    public func body(content: Content) -> some View {
        DSVStack(spacing: .smaller) {
            DSText(title, .smallTitle)
            content
        }.dsPadding(.top)
    }
}

public extension View {
    func dsSectionStyle(title: String) -> some View {
        let modifier = DSSectionStyleModifier(
            title: title
        )
        return self.modifier(modifier)
    }
}
