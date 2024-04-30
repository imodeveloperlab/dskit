//
//  DSRadioPickerView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 13.03.2023.
//

import SwiftUI

/*
## DSRadioPickerView

`DSRadioPickerView` is a SwiftUI component designed to offer a customizable radio button selection interface within the DSKit framework. It allows users to select a single option from a list of available options, making it ideal for forms, surveys, and settings.

#### Initialization:
Initializes a `DSRadioPickerView` with data and custom content rendering options.
- Parameters:
- `data`: The collection of data items.
- `id`: KeyPath to the unique identifier for each data item.
- `selected`: A `Binding` to the currently selected data element.
- `content`: Closure that generates a view for each item, provided with selection status.

#### Interaction:
- Tapping an item updates the selection state, accompanied by haptic feedback to enhance user interaction.

#### Usage:
`DSRadioPickerView` is suitable for scenarios where users need to make a single selection from multiple options, such as choosing a color, selecting a configuration option, or setting preferences.
*/

public struct DSRadioPickerView<Data, ID, Content>: View where Data: RandomAccessCollection, Data.Element: Equatable, ID: Hashable, Content: View {
    
    let data: Data
    let content: (Data.Element, Bool) -> Content
    let id: KeyPath<Data.Element, ID>
    @Binding var selected: Data.Element
    
    public init(
        data: Data,
        id: KeyPath<Data.Element, ID>,
        selected: Binding<Data.Element>,
        @ViewBuilder content: @escaping (Data.Element, Bool) -> Content
    ) {
        self.data = data
        self.id = id
        self.content = content
        self._selected = selected
    }
    
    public var body: some View {
        DSVStack(spacing: .small) {
            ForEach(data, id: id) { element in
                DSVStack(alignment: .leading) {
                    self.content(element, selected == element)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(alignment: .trailing) {
                    if selected == element  {
                        DSImageView(systemName: "checkmark.circle.fill", size: 17, tint: .color(.green))
                    } else {
                        DSImageView(systemName: "circle", size: 17, tint: .text(.subheadline))
                            .opacity(0.3)
                    }
                }
                .onTap {
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    selected = element
                }
                .dsCardStyle()
            }
        }
    }
}

struct Testable_DSRadioPickerView: View {
    let data = ["Red","Orange","Purple","Green","Blue"]
    @State var selected = "Purple"
    var body: some View {
        DSRadioPickerView(data: data, id: \.self, selected: $selected, content: { element, _ in
            DSText(element).dsTextStyle(.smallHeadline)
        })
    }
}

struct DSRadioPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance {
            DSPreview {
                Testable_DSRadioPickerView()
            }
        }
    }
}
