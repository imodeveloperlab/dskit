//
//  DSHScroll.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI

/*
## DSHScroll

`DSHScroll` is a SwiftUI component designed to display a horizontally scrollable view within the DSKit framework. It is ideal for presenting a collection of elements, such as images or cards, in a seamless, scrollable format that extends horizontally.

#### Initialization:
Initializes a `DSHScroll` with parameters that control layout and behavior.
- Parameters:
- `spacing`: Specifies the space between each item within the scroll view.
- `data`: The collection of data items.
- `id`: KeyPath to the unique identifier for each data item.
- `content`: Closure returning a `Content` view for each item in the collection.

#### Usage:
`DSHScroll` is particularly useful in scenarios where users need to browse through a series of items without navigating away from the current view context, such as in a media gallery or a horizontal list of options.
*/

public struct DSHScroll<Data, ID, Content>: View where Data: RandomAccessCollection, ID: Hashable, Content: View{
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.dsScrollableContentMarginKey) var scrollableContentMargin: CGFloat
    @Environment(\.dsContentMarginKey) var contentMargin: CGFloat
    
    let spacing: DSSpace
    
    let data: Data
    let content: (Data.Element) -> Content
    let id: KeyPath<Data.Element, ID>
    
    public init(
        spacing: DSSpace = .regular,
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
            }
            .padding(.horizontal, scrollableContentMargin)
        }
        .padding(.horizontal, -scrollableContentMargin)
        .padding(.horizontal, contentMargin)
    }
}

struct Testable_DSHScroll: View {
    let colors = [
        Color.red,
        Color.green,
        Color.yellow,
        Color.red,
        Color.green,
        Color.yellow
    ]
    var body: some View {
        DSHScroll(spacing: .medium, data: colors, id: \.self) { color in
            color.dsSize(60)
        }
    }
}

struct DSHScroll_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance {
            DSPreview {
                Testable_DSHScroll()
            }
        }
    }
}
