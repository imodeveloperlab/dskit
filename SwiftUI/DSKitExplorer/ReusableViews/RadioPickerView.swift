//
//  RadioPickerView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 13.03.2023.
//

import SwiftUI
import DSKit

public struct RadioPickerView<Data, ID, Content>: View where Data: RandomAccessCollection, Data.Element: Equatable, ID: Hashable, Content: View {
    
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
        DSVStack(spacing: .smaller) {
            ForEach(data, id: id) { element in
                DSVStack(alignment: .leading) {
                    self.content(element, selected == element)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .overlay(alignment: .trailing) {
                    if selected == element  {
                        DSImageView(sfSymbol: "checkmark.circle.fill", size: 17, tint: .customColor(.green))
                    } else {
                        DSImageView(sfSymbol: "circle", size: 17, tint: .text(.subheadline))
                            .opacity(0.3)
                    }
                }
                .dsCardStyle()
                .onTap {
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    selected = element
                }
            }
        }
    }
}

public struct RadioPickerViewDemo: View {
    
    let data = ["Red","Orange","Purple","Green","Blue"]
    @State var selected = "Purple"
    
    public var body: some View {
        RadioPickerView(data: data, id: \.self, selected: $selected, content: { element, _ in
            DSText(element, .smallTitle)
        })
    }
}

struct RadioPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach {
            DSFullScreen {
                DSVStack {
                    RadioPickerViewDemo()
                }.dsPadding()
            }
        }
    }
}


