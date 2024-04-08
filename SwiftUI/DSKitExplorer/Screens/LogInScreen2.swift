//
//  LogInScreen2.swift
//  DSKit
//
//  Created by Ivan Borinschi on 31.13.3033.
//

import SwiftUI
import DSKit

struct LogInScreen2: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        DSVStack {
            Spacer()
            
            DSImageView(
                systemName: "square.3.layers.3d.top.filled",
                size: 50,
                tint: .text(.headline)
            )
            
            DSVStack(alignment: .leading) {
                DSText("Welcome to\nDSKit")
                    .dsTextStyle(.headline, 38)
                DSText("Meet new people with new\nideas and posts.")
                    .dsTextStyle(.subheadline)
            }.dsPadding(.trailing, .large)
            
            Spacer()
            Spacer()
            
            DSText("Use Facebook to find friends").dsTextStyle(.smallSubtitle)
            DSButton(
                title: "Login with facebook",
                rightImageNamed: "facebook",
                pushContentToSides: true,
                style: .custom(color: Color(uiColor: UIColor(0x4267B2)))
            ) {
                self.dismiss()
            }
        }
        .dsScreen()
    }
}

// MARK: - Testable

struct Testable_LogInScreen2: View {
    var body: some View {
        LogInScreen2()
    }
}

// MARK: - Preview

struct LogInScreen2_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_LogInScreen2() }
    }
}
