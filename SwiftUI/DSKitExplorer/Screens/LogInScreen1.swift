//
//  LogInScreen1.swift
//  DSKit
//
//  Created by Ivan Borinschi on 31.13.3033.
//

import SwiftUI
import DSKit

public struct LogInScreen1: View {
    
    @StateObject var model = LogInScreen1Model()
    @Environment(\.dismiss) var dismiss
    
    public init() {}
    
    public var body: some View {
        DSVStack(spacing: .zero) {
            Spacer()
            
            DSVStack(spacing: .medium) {
                DSVStack(alignment: .leading, spacing: .small) {
                    DSText("DSKit")
                        .dsTextStyle(.headline, 38)
                        .showWhenKeyboardIsDisplayed()
                    DSText("Welcome to\nDSKit shop")
                        .dsTextStyle(.headline, 35)
                        .hideWhenKeyboardIsDisplayed()
                    DSText("An exciting place for the whole\nfamily to shop").dsTextStyle(.subheadline)
                }.fixedSize(horizontal: false, vertical: true)
                
                DSVStack {
                    DSTextField.email(value: model.form.email)
                    DSTextField.password(value: model.form.password)
                    DSButton(title: "Log In") {
                        model.form.submit()
                    }
                    DSButton(title: "Forgot password?", style: .clear, action: {
                        self.dismiss()
                    })
                }
            }
            
            Spacer()
            Spacer()
            
            DSButton(
                title: "Sign Up",
                rightSystemName: "chevron.right",
                pushContentToSides: true,
                style: .light
            ) { self.dismiss() }
        }
        .hideKeyboardWhenTappedOutside()
        .dsScreen()
    }
}

// MARK: - Model

final class LogInScreen1Model: ObservableObject {
    let form = Form()
    struct Form {
        var email = DSTextFieldValue()
        var password = DSTextFieldValue()
        var allFields: [DSTextFieldValue] { [email, password] }
        func submit() { allFields.validate() }
    }
}

// MARK: - Testable

struct Testable_LogInScreen1: View {
    var body: some View {
        LogInScreen1()
    }
}

// MARK: - Preview

struct LogInScreen1_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_LogInScreen1() }
    }
}
