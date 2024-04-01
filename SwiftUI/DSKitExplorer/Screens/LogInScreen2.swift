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
                sfSymbol: "square.3.layers.3d.top.filled",
                size: 50,
                tint: .text(.font(.headline))
            )
            
            DSVStack(alignment: .leading) {
                DSText("Welcome to\nDSKit", .fontAndSize(.headline, 38))
                DSText("Meet new people with new\nideas and posts.", .font(.subheadline))
            }.dsPadding(.trailing, .large)
            
            Spacer()
            Spacer()
            
            DSText("Use Facebook to find friends", .smallSubtitle)
            DSButton(
                title: "Login with facebook",
                rightImage: DSImage(uiImageName: "facebook", size: .smallIcon),
                pushContentToSides: true,
                style: .custom(color: UIColor(0x4267B2))
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
        PreviewForEach { Testable_LogInScreen2() }
    }
}
