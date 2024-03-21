//
//  HeaderView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 11.03.2023.
//

import SwiftUI
import DSKit

struct SectionHeaderView: View {
    @Environment(\.dismiss) var dismiss
    let title: String
    let actionTitle: String
    let action: () -> Void
    
    var body: some View {
        DSHStack {
            DSText(title, .headline)
            Spacer()
            DSButton.callToActionLink(title: actionTitle, action: action)
        }.dsHeight(20)
    }
}
