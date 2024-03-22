//
//  DSGallery.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI

public struct DSGallery<Data, ID, Content>: View where Data: RandomAccessCollection, ID: Hashable, Content: View {
    
    @Environment(\.appearance) var appearance: DSAppearance
    let height: DSDimension
    let spacing: DSDimension
    let showPaginationView: Bool
    
    let data: Data
    let content: (Data.Element) -> Content
    let id: KeyPath<Data.Element, ID>
    
    @State private var currentElementID: ID?
    
    public init(
        height: DSDimension,
        spacing: DSDimension = .small,
        showPaginationView: Bool = true,
        data: Data,
        id: KeyPath<Data.Element, ID>,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self.height = height
        self.spacing = spacing
        self.showPaginationView = showPaginationView
        self.data = data
        self.id = id
        self.content = content
        _currentElementID = State(initialValue: data.first![keyPath: id])
    }
    
    public var body: some View {
        DSVStack(alignment: .center, spacing: .zero) {
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: appearance.size.number(for: spacing)) {
                    ForEach(data, id: id) { element in
                        self.content(element)
                            .containerRelativeFrame(.horizontal)
                            .tag(element[keyPath: id])
                            .scrollTransition(.animated, axis: .horizontal) { content, phase in
                                content.opacity(phase.isIdentity ? 1.0 : 0.8)
                            }
                    }
                }.scrollTargetLayout()
            }
            .scrollPosition(id: $currentElementID)
            .scrollClipDisabled(true)
            .scrollTargetBehavior(.viewAligned)
            
            if showPaginationView {
                defaultPaginationIndicator()
                    .dsPadding(.top)
            }
        }
        .dsHeight(height)
    }
    
    private func defaultPaginationIndicator() -> some View {
        DSHStack {
            ForEach(data, id: id) { element in
                Circle()
                    .fill(Color(uiColor: appearance.primaryView.text.headline))
                    .dsSize(.small)
                    .opacity(currentElementID == element[keyPath: id] ? 1 : 0.1)
            }
        }
        .dsHeight(.small)
    }
}

struct DSGallery_Previews: PreviewProvider {
    static var previews: some View {
        let colors = [Color.red, Color.green, Color.yellow]
        PreviewForEach {
            DSFullScreen {
                DSGallery(height: 200, spacing: .regular, data: colors, id: \.self) { color in
                    color
                }
                .dsPadding(.horizontal)
                .dsLayoutGuideLines(divider: 1)
            }
        }
    }
}
