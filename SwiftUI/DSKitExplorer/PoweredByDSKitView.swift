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
                DSText("Powered by", .smallSubtitle)
                DSImageView(sfSymbol: "square.stack.3d.down.right.fill", size: .smallIcon, tint: .customColor(.blue))
                DSText("DSKit", .smallSubtitle)
            }.frame(maxWidth: .infinity, alignment: .center)
            DSHStack(spacing: .small) {
                DSText("Made with", .smallSubtitle)
                DSImageView(sfSymbol: "heart.fill", size: .smallIcon, tint: .customColor(.red))
                DSText("by imodeveloper", .smallSubtitle)
            }.frame(maxWidth: .infinity, alignment: .center)
        }
    }
}
