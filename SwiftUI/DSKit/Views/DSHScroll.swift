//
//  DSHScroll.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI

public struct DSHScroll<Data, ID, Content>: View where Data: RandomAccessCollection, ID: Hashable, Content: View{
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.dsScrollableContentMarginKey) var scrollableContentMargin: DSDimension
    @Environment(\.dsContentMarginKey) var contentMargin: DSDimension
    
    let spacing: DSDimension
    
    let data: Data
    let content: (Data.Element) -> Content
    let id: KeyPath<Data.Element, ID>
    
    public init(
        spacing: DSDimension = .small,
        data: Data,
        id: KeyPath<Data.Element, ID>,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self.spacing = spacing
        self.data = data
        self.content = content
        self.id = id
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            DSHStack(spacing: spacing) {
                ForEach(data, id: id) { element in
                    self.content(element)
                }
            }.dsPadding(.horizontal, .custom(appearance.size.number(for: scrollableContentMargin)))
        }
        .dsPadding(.horizontal, .custom(-appearance.size.number(for: scrollableContentMargin)))
        .dsPadding(.horizontal, .custom(appearance.size.number(for: contentMargin)))
    }
}

struct DSHScroll_Previews: PreviewProvider {
    static var previews: some View {
        let colors = [Color.red, Color.green, Color.yellow, Color.red, Color.green, Color.yellow]
        PreviewForEach {
            DSPreview {
                DSHScroll(spacing: .regular, data: colors, id: \.self) { color in
                    color.dsSize(60)
                }
            }.dsContentMargins(margin: 100)
        }
    }
}

