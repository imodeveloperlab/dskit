//
//  LogInScreen2.swift
//  DSKitCore
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
                tint: .text(.headline)
            )
            
            DSVStack(alignment: .leading) {
                DSText("Welcome to\nDSKit", .headlineWithSize(38))
                DSText("Meet new people with new\nideas and posts.", .subheadline)
            }.dsPadding(.trailing, .extraLarge)
            
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

// MARK: - Preview

struct LogInScreen2_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach { LogInScreen2() }
    }
}
