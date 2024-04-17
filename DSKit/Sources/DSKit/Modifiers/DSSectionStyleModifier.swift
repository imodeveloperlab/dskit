//
//  DSSectionStyleModifier.swift
//  DSKit
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
        DSVStack(spacing: .small) {
            DSText(title).dsTextStyle(.smallHeadline)
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
