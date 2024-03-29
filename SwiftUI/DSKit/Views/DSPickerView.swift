//
//  DSPickerView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 13.03.2023.
//

import SwiftUI
import DSKit

public struct DSPickerView<Data, ID, Content>: View where Data: RandomAccessCollection, Data.Element: Equatable, ID: Hashable, Content: View {
    
    let style: DSPickerView.Style
    let data: Data
    let content: (Data.Element) -> Content
    let id: KeyPath<Data.Element, ID>
    @Binding var selected: Data.Element
    
    public enum Style {
        case horizontalScroll
        case grid(columns: Int)
    }
    
    public init(
        style: DSPickerView.Style = .horizontalScroll,
        data: Data,
        id: KeyPath<Data.Element, ID>,
        selected: Binding<Data.Element>,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self.data = data
        self.id = id
        self.content = content
        self.style = style
        self._selected = selected
    }
    
    public var body: some View {
        DSVStack(spacing: .smaller) {
            switch style {
            case .horizontalScroll:
                horizontalScrollStyle
            case .grid(let columns):
                gridStyle(columns: columns)
            }
        }
    }
    
    var horizontalScrollStyle: some View {
        DSHScroll(spacing: .small, data: data, id: id) { element in
            styledContent(element)
        }
    }
    
    func gridStyle(columns: Int) -> some View {
        DSGrid(numberOfColumns: columns, spacing: .small, data: data, id: id) { element in
            styledContent(element)
        }
    }
    
    func styledContent(_ element: Data.Element) -> some View {
        self.content(element)
            .dsCornerRadius()
            .dsSelectedStyle(isSelected: selected == element)
            .onTap {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                selected = element
            }
    }
}

public struct PickerViewHorizontal: View {
    
    let data = ["A","B","C","D","E"]
    @State var selected = "A"
    
    public var body: some View {
        DSPickerView(data: data, id: \.self, selected: $selected, content: { element in
            DSText(element)
                .dsSize(20)
                .dsCardStyle()
        })
    }
}

public struct PickerViewGrid: View {
    
    let data = ["1","2","3","4","5","6","7","8","9"]
    @State var selected = "2"
    
    public var body: some View {
        DSPickerView(style: .grid(columns: 5), data: data, id: \.self, selected: $selected, content: { element in
            DSText(element)
                .frame(maxWidth: .infinity)
                .dsCardStyle()
        })
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach {
            DSPreview {
                DSVStack {
                    PickerViewHorizontal()
                        .dsSectionStyle(title: "Horizontal")
                    PickerViewGrid()
                        .dsSectionStyle(title: "Grid")
                }
            }
        }
    }
}
