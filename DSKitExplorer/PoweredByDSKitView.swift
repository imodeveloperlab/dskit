//
//  PoweredByDSKitView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 29.02.2023.
//

import SwiftUI
import DSKit

struct PoweredByDSKitView: View {
    var body: some View {
        DSVStack(spacing: .small) {
            DSHStack(spacing: .small) {
                DSText("Powered by").dsTextStyle(.smallSubtitle)
                DSImageView(systemName: "square.stack.3d.down.right.fill", size: .smallIcon, tint: .view(.button(.accentColor)))
                DSText("DSKit").dsTextStyle(.smallSubtitle)
            }.frame(maxWidth: .infinity, alignment: .center)
            DSHStack(spacing: .small) {
                DSText("Made with").dsTextStyle(.smallSubtitle)
                DSImageView(systemName: "heart.fill", size: .smallIcon, tint: .color(.red))
                DSText("by imodeveloper").dsTextStyle(.smallSubtitle)
            }.frame(maxWidth: .infinity, alignment: .center)
        }
    }
}
