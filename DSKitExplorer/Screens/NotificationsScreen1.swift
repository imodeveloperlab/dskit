//
//  NotificationsScreen1.swift
//  DSKit
//
//  Created by Ivan Borinschi on 31.13.3033.
//

import SwiftUI
import DSKit

struct NotificationsScreen1: View {
    
    @State private var isSwitchOn = true
    @Environment(\.appearance) var appearance: DSAppearance
    
    var body: some View {
        DSVStack(spacing: .medium) {
            
            Spacer()
            
            DSHStack {
                DSText("Turn on\nnotifications")
                    .dsTextStyle(.headline, 36)
                Spacer()
                DSImageView(systemName: "bell.fill", size: 60, tint: .viewStyle(.secondary, .background))
            }
            
            DSText("Meet new people, create posts, find friends and more.")
            
            DSHStack {
                DSText("Notifications").dsTextStyle(.headline)
                Spacer()
                Toggle("Show welcome message", isOn: $isSwitchOn)
                    .tint(Color.green)
                    .labelsHidden()
            }
            .dsPadding()
            .dsSecondaryBackground()
            .dsCornerRadius()
            
            DSText("Enable notifications to make sure you don't miss out the post from your friends").dsTextStyle(.caption1)
            Spacer()
            
            DSButton(title: "Dismiss") { }
        }.dsScreen()
    }
}

// MARK: - Testable

struct Testable_NotificationsScreen1: View {
    var body: some View {
        NotificationsScreen1()
    }
}

// MARK: - Preview

struct NotificationsScreen1_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_NotificationsScreen1() }
    }
}

