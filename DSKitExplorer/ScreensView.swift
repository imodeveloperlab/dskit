//
//  ScreensView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 29.02.2023.
//

import SwiftUI
import DSKit

struct ScreensView: View {
    let appearance: DSAppearance
    @Environment(\.dismiss) var dismiss
    
    init(appearance: DSAppearance) {
        self.appearance = appearance
        self.appearance.overrideTheSystemAppearance()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                DSVStack(spacing: .small) {
                    ForEach(ScreenKey.allCases) { screen in
                        NavigationLink {
                            ScreenView(screen: screen)                            
                        } label: {
                            CustomActionView(title: screen.displayName)
                        }
                    }
                }
            }
            .navigationTitle(appearance.title)
            .safeAreaInset(edge: .bottom) {
                DSBottomContainer {
                    DSButton(title: "Change Appearance", action: { dismiss() })
                }
            }
            .dsScreen()
        }
        .environment(\.appearance, appearance)
        .accentColor(appearance.navigationBar.buttons.color)
    }
}

fileprivate struct CustomActionView: View {
    
    let title: String
    
    var body: some View {
        DSHStack {
            DSText(title).dsTextStyle(.smallHeadline)
            Spacer()
            DSChevronView()
        }.dsCardStyle()
    }
}

#Preview {
    ScreensView(appearance: DSKitAppearance())
}
