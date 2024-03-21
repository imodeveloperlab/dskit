//
//  DSHScroll.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI

public struct DSHScroll<Data, ID, Content>: View where Data: RandomAccessCollection, ID: Hashable, Content: View{
    
    @Environment(\.appearance) var appearance: DSAppearance
    let spacing: DSDimension
    let padding: DSDimension
    
    let data: Data
    let content: (Data.Element) -> Content
    let id: KeyPath<Data.Element, ID>
    
    public init(
        spacing: DSDimension = .small,
        padding: DSDimension = .regular,
        data: Data,
        id: KeyPath<Data.Element, ID>,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self.spacing = spacing
        self.padding = padding
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
            }.dsPadding(.horizontal, padding)
        }
    }
}
