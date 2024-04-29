//
//  DSPickerView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 13.03.2023.
//

import SwiftUI

/*
## DSPickerView

`DSPickerView` is a versatile SwiftUI component within the DSKit framework, designed to present selectable content in various styles such as a horizontal scroll or a grid. It offers a dynamic way to select items from a collection, adapting to different content layouts based on user preferences or UI requirements.

#### Styles:
The `Style` enum defines how the items are presented:
- `horizontalScroll`: Items are displayed in a horizontally scrolling list.
- `grid(columns: Int)`: Items are arranged in a grid with a specified number of columns.

#### Initialization:
Initializes a `DSPickerView` with customization options for layout and interaction.
- Parameters:
- `style`: The visual layout style of the picker.
- `data`: The collection of data items.
- `id`: KeyPath to the unique identifier for each data item.
- `selected`: A `Binding` to the currently selected data element.
- `content`: Closure that generates a view for each item.

#### Usage:
`DSPickerView` is ideal for applications requiring user selection from a set of options displayed either in a line or a matrix.
*/

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
        DSVStack(spacing: .small) {
            switch style {
            case .horizontalScroll:
                horizontalScrollStyle
            case .grid(let columns):
                gridStyle(columns: columns)
            }
        }
    }
    
    var horizontalScrollStyle: some View {
        DSHScroll(spacing: .regular, data: data, id: id) { element in
            styledContent(element)
        }
    }
    
    func gridStyle(columns: Int) -> some View {
        DSGrid(numberOfColumns: columns, spacing: .regular, data: data, id: id) { element in
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

struct Testable_DSPickerView: View {
    
    let letters = ["A","B","C","D","E"]
    @State var selectedLetter = "A"
    
    let numbers = ["1","2","3","4","5","6","7","8","9"]
    @State var selectedNumber = "2"
    
    var body: some View {
        DSVStack {
            DSPickerView(
                data: letters,
                id: \.self,
                selected: $selectedLetter,
                content: { element in
                    DSText(element)
                        .dsSize(20)
                        .dsCardStyle()
                }
            ).dsSectionStyle(title: "Letters")
            
            DSPickerView(
                style: .grid(columns: 5),
                data: numbers, id: \.self,
                selected: $selectedNumber,
                content: { element in
                    DSText(element)
                        .frame(maxWidth: .infinity)
                        .dsCardStyle()
                }
            ).dsSectionStyle(title: "Numbers")
        }
    }
}

struct DSPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance {
            DSPreview {
                Testable_DSPickerView()
            }
        }
    }
}
