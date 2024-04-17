//
//  SignUpScreen1.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct SignUpScreen1: View {
    
    let viewModel = SignUpScreen1Model()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            DSVStack {
                Group {
                    DSButton(
                        title: "Login with Facebook",
                        rightImageNamed: "facebook",
                        pushContentToSides: true,
                        style: .custom(color: Color(uiColor: UIColor(0x4267B2)))  
                    ) { self.dismiss() }
                    
                    DSText("or sign up with Email").dsTextStyle(.smallSubtitle).frame(maxWidth: .infinity, alignment: .center)
                    
                }.hideWhenKeyboardIsDisplayed()
                
                DSVStack(spacing: .small) {
                    DSTextField.name(value: viewModel.fullName)
                    DSTextField.email(value: viewModel.email)
                    DSTextField.phone(value: viewModel.phone)
                    DSTextField.password(value: viewModel.password)
                    DSTextField.password(value: viewModel.password)
                }
                
                DSButton(title: "Continue") {
                    self.dismiss()
                }
                
                DSTermsAndConditions(message: "By signing up, you agree to our")
            }
            .hideKeyboardWhenTappedOutside()
        }
        .safeAreaInset(edge: .bottom) {
            Group {
                Spacer()
                PoweredByDSKitView()
            }.hideWhenKeyboardIsDisplayed()
        }
        .navigationTitle("Sign Up")
        .dsScreen()
    }
}

// MARK: - Model

final class SignUpScreen1Model: ObservableObject {
    
    var fullName = DSTextFieldValue()
    var email = DSTextFieldValue()
    var phone = DSTextFieldValue()
    var password = DSTextFieldValue()
    var repeatPassword = DSTextFieldValue()
    
    func submit() {
        for field in [fullName, email, phone, password, repeatPassword] {
            let isValid = field.validate()
            if !isValid {
                break
            }
        }
    }
}

// MARK: - Testable

struct Testable_SignUpScreen1: View {
    var body: some View {
        NavigationView {
            SignUpScreen1()
        }
    }
}

// MARK: - Preview

struct SignUpScreen1_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_SignUpScreen1() }
    }
}
