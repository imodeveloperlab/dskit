//
//  ProfileScreen3.swift
//  DSKitCore
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
            DSVStack(spacing: .regular) {
                DSHStack(spacing: .regular) {
                    DSImageView(
                        sfSymbol: "exclamationmark.shield.fill",
                        size: 50,
                        tint: .custom(UIColor.systemYellow)
                    )
                        
                    DSText(
                        "Changing your password regularly reduces your risk of exposure and avoids a number of dangers.",
                            .subheadline
                    ).frame(maxWidth: .infinity, alignment: .leading)
                }
                .dsPadding()
                .dsSecondaryBackground()
                .dsCornerRadius()
                
                DSVStack(spacing: .smaller) {
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

// MARK: - Preview

struct ProfileScreen3_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                ProfileScreen3()
            }
        }
    }
}
