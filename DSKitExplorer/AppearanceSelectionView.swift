//
//  AppearanceSelectionView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 28.02.2023.
//

import SwiftUI
import DSKit

struct AppearanceSelectionView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var useDarkMode: Bool = false
    @Environment(\.appearance) var appearance: DSAppearance
    @State private var selectedAppearance: IdentifiableDesignable?
    
    var body: some View {
        DSVStack {
            DSVStack {
                DSVStack(spacing: .zero) {
                    DSHStack(spacing: .small) {
                        DSText("Welcome to").dsTextStyle(.largeHeadline)
                        DSText("DSKit").dsTextStyle(.largeHeadline, .view(.button(.accentColor)))
                    }
                    DSText("Please select an appearance to continue").dsTextStyle(.subheadline)
                }
                .dsPadding(.top)
                
                DSGrid(numberOfColumns: 2, data: appearances, id: \.title) { appearance in
                    AppearanceView(appearance: appearance).onTap {
                        self.selectedAppearance = IdentifiableDesignable(appearance: appearance)
                    }
                }
                
                Spacer()
            }
            .fullScreenCover(item: $selectedAppearance) { identifiableDesignable in
                ScreensView(appearance: identifiableDesignable.appearance)
            }
            PoweredByDSKitView()
        }.dsScreen()
    }
}

fileprivate struct AppearanceView: View {
    
    let appearance: DSAppearance
    
    var body: some View {
        DSVStack {
            DSText(appearance.title).dsTextStyle(.headline)
            DSHStack(spacing: .zero) {
                appearance.primaryView.text.headline.color
                appearance.primaryView.text.subheadline.color
                appearance.primaryView.button.accentColor.color
                appearance.primaryView.background.color
                appearance.secondaryView.text.headline.color
                appearance.secondaryView.text.subheadline.color
                appearance.secondaryView.background.color
                appearance.secondaryView.button.accentColor.color
            }
            .dsHeight(20)
            .dsCornerRadius()
        }
        .dsPadding()
        .dsSecondaryBackground()
        .dsCornerRadius()
    }
}

struct IdentifiableDesignable: Identifiable {
    let id: UUID
    let appearance: DSAppearance
    init(appearance: DSAppearance) {
        self.id = UUID()
        self.appearance = appearance
    }
}

fileprivate let appearances: [DSAppearance] = [
    DSKitAppearance(),
    DarkAppearance(),
    BlueAppearance(),
    RetroAppearance(),
    PeachAppearance()
]

#Preview {
    AppearanceSelectionView()
}
