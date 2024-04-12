//
//  HeaderView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 11.03.2023.
//

import SwiftUI

public struct DSSectionHeaderView: View {
    @Environment(\.dismiss) var dismiss
    let title: String
    let actionTitle: String
    let action: () -> Void
    
    public init(title: String, actionTitle: String, action: @escaping () -> Void) {
        self.title = title
        self.actionTitle = actionTitle
        self.action = action
    }
    
    public var body: some View {
        DSHStack {
            DSText(title).dsTextStyle(.headline)
            Spacer()
            DSButton.callToActionLink(title: actionTitle, action: action)
        }.dsHeight(20)
    }
}
