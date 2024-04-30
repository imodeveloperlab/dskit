//
//  ProfileScreen3.swift
//  DSKit
//
//  Created by Ivan Borinschi on 31.13.3033.
//

import SwiftUI
import DSKit

struct ProfileScreen3: View {
    
    @StateObject var viewModel = ProfileScreen3Model()
    @Environment(\.appearance) var appearance: DSAppearance
    
    var body: some View {
        ScrollView {
            DSVStack(spacing: .medium) {
                DSHStack(spacing: .medium) {
                    DSImageView(
                        systemName: "exclamationmark.shield.fill",
                        size: 50,
                        tint: .color(.yellow)
                    )
                    
                    DSText("Changing your password regularly reduces your risk of exposure and avoids a number of dangers.")
                        .dsTextStyle(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .dsPadding()
                .dsSecondaryBackground()
                .dsCornerRadius()
                
                DSVStack(spacing: .small) {
                    DSTextField.password(value: viewModel.currentPassword)
                    DSTextField.newPassword(value: viewModel.newPassword)
                    DSTextField.password(value: viewModel.repeatPassword, placeholder: "Repeat Password")
                }
                
                DSButton(title: "Update") {
                    viewModel.submit()
                }
            }
        }
        .navigationTitle("Password")
        .dsScreen()
    }
}

// MARK: - Model

final class ProfileScreen3Model: ObservableObject {
    
    var currentPassword = DSTextFieldValue()
    var newPassword = DSTextFieldValue()
    var repeatPassword = DSTextFieldValue()
    
    func submit() {
        for field in [currentPassword, newPassword, repeatPassword] {
            let isValid = field.validate()
            if !isValid {
                break
            }
        }
    }
}

// MARK: - Testable

struct Testable_ProfileScreen3: View {
    var body: some View {
        NavigationView {
            ProfileScreen3()
        }
    }
}

// MARK: - Preview

struct ProfileScreen3_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_ProfileScreen3() }
    }
}
