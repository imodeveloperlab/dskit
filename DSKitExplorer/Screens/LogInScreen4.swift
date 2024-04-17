//
//  LogInScreen4.swift
//  DSKit
//
//  Created by Ivan Borinschi on 31.13.3033.
//

import SwiftUI
import DSKit

struct LogInScreen4: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        DSVStack(spacing: .medium) {
            
            Spacer()
            
            DSVStack(alignment: .center) {
                DSImageView(
                    url: profileUrl,
                    style: .circle,
                    size: 90,
                    contentMode: .scaleAspectFill
                )
               
                DSVStack(alignment: .center) {
                    DSText("John Doe").dsTextStyle(.largeHeadline)
                    DSText("john.doe@gmail.com").dsTextStyle(.subheadline)
                }
            }.frame(maxWidth: .infinity)
            
            Spacer()
            Spacer()
            Spacer()
            
            DSVStack(alignment: .center, spacing: .zero) {
                DSButton(title: "Continue as John") {
                    self.dismiss()
                }
                DSButton(title: "Choose another account", style: .clear, action: {
                    self.dismiss()
                })
            }
        }.dsScreen()
    }
}

// MARK: - Testable

struct Testable_LogInScreen4: View {
    var body: some View {
        LogInScreen4()
    }
}

// MARK: - Preview

struct LogInScreen4_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_LogInScreen4() }
    }
}

// MARK: - Image Links

fileprivate let profileUrl = URL(string: "https://images.unsplash.com/photo-1563237023-b1e970526dcb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1001&q=80")
