//
//  LogInScreen3.swift
//  DSKit
//
//  Created by Ivan Borinschi on 31.13.3033.
//

import SwiftUI
import DSKit

struct LogInScreen3: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        DSVStack {
            
            Spacer()
            
            DSVStack(alignment: .center, spacing: .medium) {
                DSImageView(
                    sfSymbol: "square.3.layers.3d.top.filled",
                    size: 50,
                    tint: .text(.font(.headline))
                )
                DSText(
                    "Meet new people from over millions of users. Create posts, find friends and more.", .subheadline,
                    multilineTextAlignment: .center
                ).dsPadding(.horizontal, .large)
            }
            
           Spacer()
           Spacer()
           Spacer()
            
            DSVStack(alignment: .center) {
                
                DSText("Log in with social networks", .subheadline)
                
                DSHStack {
                    DSButton(
                        title: "Facebook",
                        rightImage: DSImage(uiImageName: "facebook", size: .smallIcon),
                        pushContentToSides: true,
                        style: .custom(color: UIColor(0x4267B2))
                    ) {
                        self.dismiss()
                    }
                    
                    DSButton(
                        title: "Google",
                        rightImage: DSImage(uiImageName: "google", size: .smallIcon),
                        pushContentToSides: true,
                        style: .custom(color: UIColor(0x4285F4))
                    ) {
                        self.dismiss()
                    }
                }
                
                DSText("or sign up with Email", .subheadline)
                DSButton(
                    title: "Sign Up",
                    rightImage: DSImage(sfSymbolName: "envelope.fill", size: .smallIcon),
                    pushContentToSides: true,
                    style: .light
                ) {
                    self.dismiss()
                }
            
                DSButton(title: "Log in with Email", style: .clear, action: {
                    self.dismiss()
                })
            }
        }.dsScreen()
    }
}

// MARK: - Testable

struct Testable_LogInScreen3: View {
    var body: some View {
        LogInScreen3()
    }
}

// MARK: - Preview

struct LogInScreen3_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_LogInScreen3() }
    }
}
