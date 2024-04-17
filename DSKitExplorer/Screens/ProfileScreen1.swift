//
//  ProfileScreen1.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct ProfileScreen1: View {
    
    @StateObject var viewModel = ProfileScreen1Model()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            DSVStack() {
                
                ProfileView(
                    title: "Jane Doe",
                    subtitle: "14 May 1988",
                    profileImageUrl: personOnMarineBg
                )
                
                ForEach(viewModel.groups, id: \.self) { (group: ActionView.Group) in
                    DSVStack(spacing: .small) {
                        if let title = group.title {
                            DSText(title).dsTextStyle(.smallSubtitle)
                                .dsPadding(.top)
                        }
                        ForEach(group.items, id: \.title) { (action: ActionView.Action) in
                            ActionView(action: action)
                        }
                    }
                }
            }
            
        }.safeAreaInset(edge: .bottom) {
            DSBottomContainer {
                DSButton(
                    title: "Log out",
                    rightSystemName: "rectangle.portrait.and.arrow.forward"
                ) {
                    self.dismiss()
                }
            }
        }.dsScreen()
    }
}

extension ProfileScreen1 {
    
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
                    DSText(title).dsTextStyle(.headline)
                    DSText(subtitle).dsTextStyle(.smallSubtitle)
                }
            }
            .frame(maxWidth: .infinity)
            .dsPadding(.vertical, .large)
        }
    }
    
    // MARK: - Action View
    
    struct ActionView: View {
        
        @Environment(\.appearance) var appearance: DSAppearance
        let action: Action
        
        var body: some View {
            DSHStack {
                DSImageView(
                    systemName: action.icon,
                    size: .smallIcon,
                    tint: .text(.headline)
                )
                
                DSText(action.title).dsTextStyle(.smallHeadline)
                
                Spacer()
                
                if let badge = action.badge {
                    DSText(badge)
                        .dsTextStyle(.smallSubtitle, .viewStyle(.secondary, .button(.supportColor)))
                        .dsSize(18)
                        .dsBackground(.color(.red))
                        .clipShape(Circle())
                } else if let option = action.option {
                    DSText(option).dsTextStyle(.smallSubtitle)
                }
                
                DSChevronView()
            }
            .dsPadding(.horizontal)
            .dsHeight(.custom(appearance.actionElementHeight))
            .dsSecondaryBackground()
            .dsCornerRadius()
            .onTap {}
        }
        
        struct Action: Identifiable, Hashable {
            let id = UUID()
            let icon: String
            let title: String
            var badge: String? = nil
            var option: String? = nil
        }
        
        struct Group: Identifiable, Hashable {
            let id = UUID()
            var title: String? = nil
            let items: [Action]
        }
    }
}

// MARK: - Model

final class ProfileScreen1Model: ObservableObject {

    var groups: [ProfileScreen1.ActionView.Group] = [
        .init(items: [
            .init(icon: "bell.fill", title: "Notifications", badge: "3"),
            .init(icon: "lock.fill", title: "Password Update")
        ]),
        .init(title: "Geography", items: [
            .init(icon: "location.fill", title: "Country", option: "United Kingdom"),
            .init(icon: "textformat.alt", title: "Language", option: "English")
        ]),
        .init(title: "Membership", items: [
            .init(icon: "giftcard.fill", title: "Loyalty Cards"),
            .init(icon: "person.2.fill", title: "Membership"),
            .init(icon: "rectangle.fill", title: "Certificates", option: "5 Certificates")
        ])
    ]
}

// MARK: - Testable

struct Testable_ProfileScreen1: View {
    var body: some View {
        ProfileScreen1()
    }
}

// MARK: - Preview

struct ProfileScreen1_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_ProfileScreen1() }
    }
}

// MARK: - Image Links

fileprivate let personOnMarineBg = URL(string: "https://images.pexels.com/photos/3760852/pexels-photo-3760852.jpeg?cs=srgb&dl=pexels-sound-on-3760852.jpg&fm=jpg")
