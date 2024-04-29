//
//  DSGrid.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI

/*
 ## DSGrid

`DSGrid` is a flexible and customizable grid component within the DSKit framework, designed to display collections of data in a grid layout. It is adaptable to various content types and layouts, making it an essential tool for creating responsive and aesthetically pleasing UIs.

#### Initialization:
Initializes `DSGrid` with customizable settings for layout and data handling.
- Parameters:
- `viewHeight`: Optional height for each item, allowing for uniform or dynamic row heights.
- `numberOfColumns`: The number of columns in the grid, defaulting to 2.
- `spacing`: Spacing between grid items, with a default setting.
- `data`: The collection of data items to display.
- `id`: KeyPath to the unique identifier for each data item.
- `content`: Closure that returns a `Content` view for each data item.

#### Usage:
`DSGrid` can be used in various applications, from displaying photos in a gallery to creating a product list in an e-commerce app.
*/

public struct DSGrid<Data, ID, Content>: View where Data: RandomAccessCollection, ID: Hashable, Content: View {
    
    @Environment(\.appearance) var appearance: DSAppearance

    let viewHeight: DSDimension?
    let spacing: DSSpace
    let numberOfColumns: Int
    
    let data: Data
    let content: (Data.Element) -> Content
    let id: KeyPath<Data.Element, ID>
    
    public init(
        viewHeight: DSDimension? = nil,
        numberOfColumns: Int = 2,
        spacing: DSSpace = .regular,
        data: Data,
        id: KeyPath<Data.Element, ID>,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self.viewHeight = viewHeight
        self.numberOfColumns = numberOfColumns
        self.data = data
        self.spacing = spacing
        self.id = id
        self.content = content
    }
        
    var layout: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: appearance.spacing.value(for: self.spacing)), count: numberOfColumns)
    }
    
    public var body: some View {
        gridView.dsDebuggable(debugColor: Color.pink)
    }
    
    var gridView: some View {
        LazyVGrid(columns: layout, spacing: appearance.spacing.value(for: spacing)) {
            ForEach(data, id: id) { element in
                if let viewHeight = self.viewHeight {
                    self.content(element).dsHeight(viewHeight)
                } else {
                    self.content(element)
                }
            }.dsResetContentMargins()
        }.dsContentMargins()
    }
}

struct Testable_DSGrid: View {
    let colors = [Color.red, Color.green, Color.yellow, Color.purple, Color.red]
    var body: some View {
        DSGrid(
            viewHeight: 50,
            numberOfColumns: 3,
            data: colors,
            id: \.self,
            content: { color in
                color
            }
        )
    }
}

struct DSGrid_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance {
            DSPreview {
                Testable_DSGrid()
            }
        }
    }
}
