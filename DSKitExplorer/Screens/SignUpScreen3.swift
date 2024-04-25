//
//  SignUpScreen3.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct SignUpScreen3: View {
    
    @Environment(\.dismiss) var dismiss
    let viewModel = SignUpScreen3Model()
    
    var body: some View {
        DSVStack(spacing: .medium) {
            
            Spacer()
            
            DSVStack(spacing: .medium) {
                
                DSText("Start with \nphone number").dsTextStyle(.largeHeadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(alignment: .trailing) {
                        DSImageView(systemName: "phone.fill", size: 60, tint: .viewStyle(.secondary, .background))
                    }
                    
                DSText("Please enter your mobile number to get\nsms to activate your account")
                DSTextField.phone(value: viewModel.phone)
                DSText("You will receive an sms with code, which you should insert in the next step").dsTextStyle(.caption1)
            }
            
            DSButton(title: "Subbmit") { dismiss() }
            
            Spacer()
            Spacer()
        }
        .dsScreen()
        .navigationTitle("Sign Up")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                DSToolbarSFSymbolButton(name: "xmark")
                    .onTap { dismiss() }
            }
        }
    }
}

// MARK: - Model

final class SignUpScreen3Model: ObservableObject {
    
    var phone = DSTextFieldValue(value: "+41007933309")
    
    func submit() {
        for field in [phone] {
            let isValid = field.validate()
            if !isValid {
                break
            }
        }
    }
}

// MARK: - Testable

struct Testable_SignUpScreen3: View {
    var body: some View {
        NavigationView {
            SignUpScreen3()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview

struct SignUpScreen3_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_SignUpScreen3() }
    }
}
