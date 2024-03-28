//
//  ProfileScreen2.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct ProfileScreen2: View {
    
    @StateObject var viewModel = ProfileScreen2Model()
    @Environment(\.appearance) var appearance: DSAppearance
    
    var body: some View {
        ScrollView {
            DSVStack {
                ProfileView(title: "Jane Doe", subtitle: "12 April 200", profileImageUrl: personOnOrangeBg)
                DSVStack() {
                    DSVStack(spacing: .smaller) {
                        DSTextField.name(value: viewModel.fullName)
                        DSTextField.email(value: viewModel.email)
                        DSTextField.phone(value: viewModel.phone)
                        DSTextField.addressCity(value: viewModel.city)
                        DSTextField.addressState(value: viewModel.state)
                        DSTextField.address(value: viewModel.address)
                    }
                    
                    DSButton(title: "Update") {
                        viewModel.submit()
                    }
                }
            }
        }.onAppear {
            viewModel.onApear()
        }.dsScreen()
    }
}

extension ProfileScreen2 {
    
    // MARK: - Profile View
    
    struct ProfileView: View {
        let title: String
        let subtitle: String
        let profileImageUrl: URL?
        var body: some View {
            DSVStack(alignment: .center) {
                DSImageView(
                    url: profileImageUrl,
                    style: .circle,
                    size: 80
                )
                DSVStack(alignment: .center) {
                    DSText(title, .headline)
                    DSText(subtitle, .smallSubtitle)
                }
            }
            .frame(maxWidth: .infinity)
            .dsPadding(.vertical, .mediumLarge)
        }
    }
}

// MARK: - Model

final class ProfileScreen2Model: ObservableObject {
    
    var fullName = DSTextFieldValue()
    var email = DSTextFieldValue()
    var phone = DSTextFieldValue()
    var city = DSTextFieldValue()
    var state = DSTextFieldValue()
    var address = DSTextFieldValue()
    
    func onApear() {
        fullName.text = "Jane Doe"
    }
   
    func submit() {
        for field in [fullName, email, phone, city, state, address] {
            let isValid = field.validate()
            if !isValid {
                break
            }
        }
    }
}

// MARK: - Preview

struct ProfileScreen2_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach { ProfileScreen2() }
    }
}

// MARK: - Image Links

fileprivate let personOnOrangeBg = URL(string: "https://images.pexels.com/photos/3641363/pexels-photo-3641363.jpeg?cs=srgb&dl=pexels-mikotoraw-3641363.jpg&fm=jpg")
