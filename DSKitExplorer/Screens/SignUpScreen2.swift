//
//  SignUpScreen2.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct SignUpScreen2: View {
    
    let viewModel = SignUpScreen2Model()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        DSVStack {
            
            DSImageView(url: profileImage, style: .circle, size: 100)
                .frame(maxWidth: .infinity, alignment: .center)
                .overlay {
                    DSImageView(systemName: "camera.fill", size: .smallIcon, tint: .viewStyle(.primary, .button(.accentColor)))
                        .dsPadding(.regular)
                        .dsBackground(.secondary)
                        .clipShape(Circle())
                        .onTap { dismiss() }
                        .offset(x: 35, y: 35)
                }
                .dsPadding(.top, .medium)
                .hideWhenKeyboardIsDisplayed()
            
            Spacer()
            
            DSVStack(spacing: .small) {
                DSTextField.name(value: viewModel.fullName)
                DSTextField.email(value: viewModel.email)
                DSTextField.password(value: viewModel.password)
            }
            
            DSButton(title: "Create an Account") {
                viewModel.submit()
            }
            
            DSTermsAndConditions(message: "By signing up, you agree to our")
            
            Spacer()
            
            Group {
                Spacer()
                Spacer()
                Spacer()
            }.hideWhenKeyboardIsDisplayed()
            
            DSButton(title: "I have an account", style: .borderedLight, action: {
                self.dismiss()
            })
        }
        .navigationTitle("Sign Up")
        .hideKeyboardWhenTappedOutside()
        .dsScreen()
    }
}

// MARK: - Model

final class SignUpScreen2Model: ObservableObject {
    
    var fullName = DSTextFieldValue()
    var email = DSTextFieldValue()
    var phone = DSTextFieldValue()
    var password = DSTextFieldValue()
    
    func submit() {
        for field in [fullName, email, phone, password] {
            let isValid = field.validate()
            if !isValid {
                break
            }
        }
    }
}

// MARK: - Testable

struct Testable_SignUpScreen2: View {
    var body: some View {
        NavigationView {
            SignUpScreen2()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview

struct SignUpScreen2_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_SignUpScreen2() }
    }
}

// MARK: - Image Links

fileprivate let profileImage = URL(string: "https://images.unsplash.com/photo-1553830591-d8632a99e6ff?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1511&q=80")
