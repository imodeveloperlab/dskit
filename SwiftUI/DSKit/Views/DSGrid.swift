//
//  DSGrid.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI

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

struct DSGrid_Previews: PreviewProvider {
    static var previews: some View {
        let colors = [Color.red, Color.green, Color.yellow, Color.purple, Color.red]
        DSPreviewForEachAppearance { DSPreview {
                DSVStack {
                    DSGrid(viewHeight: 50, numberOfColumns: 3, spacing: .regular, data: 0...4, id: \.self) { element in
                        colors[element]
                    }
                }.dsContentMargins(margin: 100)
            }
        }
    }
}
