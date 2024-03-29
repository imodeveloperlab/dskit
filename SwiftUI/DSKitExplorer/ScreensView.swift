//
//  ScreensView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 29.02.2023.
//

import SwiftUI
import DSKit

enum Screen: CaseIterable, Identifiable {
    case filters1
    case filters2
    case filters3
    case payment1
    case payment2
    case shipping1
    case shipping2
    case order1
    case order2
    case order3
    case order4
    case categories1
    case categories2
    case categories3
    case categories4
    case categories5
    case items1
    case items2
    case items3
    case items4
    case items5
    case items6
    case items7
    case items8
    case itemDetails1
    case itemDetails2
    case itemDetails3
    case itemDetails4
    case itemDetails5
    case cartScreen1
    case cartScreen2
    case cartScreen3
    case cartScreen4
    case cartScreen5
    case signUpScreen1
    case signUpScreen2
    case signUpScreen3
    case signUpScreen4
    case profileScreen1
    case profileScreen2
    case profileScreen3
    case logInScreen1
    case logInScreen2
    case logInScreen3
    case logInScreen4
    case homeScreen1
    case homeScreen2
    case homeScreen3
    case homeScreen4
    case notificationsScreen1
    case aboutUsScreen1
    case aboutUsScreen2
    
    var id: Self { self }
    var displayName: String {
        switch self {
        case .filters1: return "Filters 1"
        case .filters2: return "Filters 2"
        case .filters3: return "Filters 3"
        case .shipping1: return "Shipping 1"
        case .shipping2: return "Shipping 2"
        case .payment1: return "Payment 1"
        case .payment2: return "Payment 2"
        case .order1: return "Order 1"
        case .order2: return "Order 2"
        case .order3: return "Order 3"
        case .order4: return "Order 4"
        case .categories1: return "Categories 1"
        case .categories2: return "Categories 2"
        case .categories3: return "Categories 3"
        case .categories4: return "Categories 4"
        case .categories5: return "Categories 5"
        case .items1: return "Items 1"
        case .items2: return "Items 2"
        case .items3: return "Items 3"
        case .items4: return "Items 4"
        case .items5: return "Items 5"
        case .items6: return "Items 6"
        case .items7: return "Items 7"
        case .items8: return "Items 8"
        case .itemDetails5: return "Item Details 5"
        case .itemDetails4: return "Item Details 4"
        case .itemDetails3: return "Item Details 3"
        case .itemDetails2: return "Item Details 2"
        case .itemDetails1: return "Item Details 1"
        case .cartScreen1: return "Cart 1"
        case .cartScreen2: return "Cart 2"
        case .cartScreen3: return "Cart 3"
        case .cartScreen4: return "Cart 4"
        case .cartScreen5: return "Cart 5"
        case .aboutUsScreen2: return "About us 2"
        case .homeScreen1: return "Home Screen 1"
        case .homeScreen2: return "Home Screen 2"
        case .homeScreen3: return "Home Screen 3"
        case .homeScreen4: return "Home Screen 4"
        case .profileScreen1: return "Profile Screen 1"
        case .profileScreen2: return "Profile Screen 2"
        case .profileScreen3: return "Profile Screen 3"
        case .signUpScreen1: return "Sign Up Screen 1"
        case .signUpScreen2: return "Sign Up Screen 2"
        case .signUpScreen3: return "Sign Up Screen 3"
        case .signUpScreen4: return "Sign Up Screen 4"
        case .logInScreen1: return "Log In Screen 1"
        case .logInScreen2: return "Log In Screen 2"
        case .logInScreen3: return "Log In Screen 3"
        case .logInScreen4: return "Log In Screen 4"
        case .notificationsScreen1: return "Notifications Screen 1"
        case .aboutUsScreen1: return "About us 1"
        
        }
    }
}

struct ScreensView: View {
    
    let appearance: DSAppearance
    @Environment(\.dismiss) var dismiss
    
    init(appearance: DSAppearance) {
        self.appearance = appearance
        self.appearance.overrideTheSystemAppearance()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                DSVStack(spacing: .smaller) {
                    ForEach(Screen.allCases) { screen in
                        NavigationLink {
                            switch screen {
                            case .cartScreen1:
                                CartScreen1()
                                    .navigationTitle("Cart")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .cartScreen2:
                                CartScreen2()
                                    .navigationTitle("Cart")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .cartScreen3:
                                CartScreen3()
                                    .navigationTitle("Cart")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .cartScreen4:
                                CartScreen4()
                                    .navigationTitle("Cart")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .cartScreen5:
                                CartScreen5()
                                    .navigationTitle("Cart")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .signUpScreen1:
                                SignUpScreen1()
                                    .environment(\.appearance, appearance)
                                    .navigationBarTitleDisplayMode(.inline)
                            case .signUpScreen2:
                                SignUpScreen2()
                                    .environment(\.appearance, appearance)
                                    .navigationBarTitleDisplayMode(.inline)
                            case .signUpScreen3:
                                SignUpScreen3()
                                    .environment(\.appearance, appearance)
                                    .navigationBarTitleDisplayMode(.inline)
                            case .signUpScreen4:
                                SignUpScreen4()
                                    .environment(\.appearance, appearance)
                                    .navigationBarTitleDisplayMode(.inline)
                            case .homeScreen1:
                                HomeScreen1()
                                    .navigationBarHidden(true)
                                    .environment(\.appearance, appearance)
                            case .homeScreen2:
                                HomeScreen2()
                                    .navigationBarHidden(true)
                                    .environment(\.appearance, appearance)
                            case .homeScreen3:
                                HomeScreen3()
                                    .navigationBarHidden(true)
                                    .environment(\.appearance, appearance)
                            case .homeScreen4:
                                HomeScreen4()
                                    .navigationBarHidden(true)
                                    .environment(\.appearance, appearance)
                            case .profileScreen1:
                                ProfileScreen1()
                                    .navigationBarHidden(true)
                                    .environment(\.appearance, appearance)
                            case .profileScreen2:
                                ProfileScreen2()
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .profileScreen3:
                                ProfileScreen3()
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .logInScreen1:
                                LogInScreen1()
                                    .navigationBarHidden(true)
                                    .environment(\.appearance, appearance)
                            case .logInScreen2:
                                LogInScreen2()
                                    .navigationBarHidden(true)
                                    .environment(\.appearance, appearance)
                            case .logInScreen3:
                                LogInScreen3()
                                    .navigationBarHidden(true)
                                    .environment(\.appearance, appearance)
                            case .logInScreen4:
                                LogInScreen4()
                                    .environment(\.appearance, appearance)
                            case .notificationsScreen1:
                                NotificationsScreen1()
                                    .navigationTitle("Settings")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .aboutUsScreen1:
                                AboutUsScreen1()
                                    .navigationTitle("About us")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .aboutUsScreen2:
                                AboutUsScreen2()
                                    .navigationTitle("About us")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .itemDetails1:
                                ItemDetails1()
                                    .navigationTitle("Details")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .itemDetails2:
                                ItemDetails2()
                                    .navigationTitle("Details")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .itemDetails3:
                                ItemDetails3()
                                    .navigationTitle("Details")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .itemDetails4:
                                ItemDetails4()
                                    .navigationTitle("Details")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .itemDetails5:
                                ItemDetails5()
                                    .navigationTitle("Details")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .items1:
                                Items1()
                                    .navigationTitle("Items")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .items2:
                                Items2()
                                    .navigationTitle("Items")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .items3:
                                Items3()
                                    .navigationTitle("Items")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .items4:
                                Items4()
                                    .navigationTitle("Items")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .items5:
                                Items5()
                                    .navigationTitle("Items")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .items6:
                                Items6()
                                    .navigationTitle("Items")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .items7:
                                Items7()
                                    .navigationTitle("Items")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .items8:
                                Items8()
                                    .navigationTitle("Items")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .categories1:
                                Categories1()
                                    .navigationTitle("Categories")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .environment(\.appearance, appearance)
                            case .categories2:
                                Categories2()
                                    .navigationTitle("Categories")
                                    .environment(\.appearance, appearance)
                            case .categories3:
                                Categories3()
                                    .navigationTitle("Categories")
                                    .environment(\.appearance, appearance)
                            case .categories4:
                                Categories4()
                                    .navigationTitle("Categories")
                                    .environment(\.appearance, appearance)
                            case .categories5:
                                Categories5()
                                    .navigationTitle("Categories")
                                    .environment(\.appearance, appearance)
                            case .order1:
                                Order1()
                                    .navigationTitle("Order Details")
                                    .environment(\.appearance, appearance)
                            case .order2:
                                Order2()
                                    .navigationTitle("Order Details")
                                    .environment(\.appearance, appearance)
                            case .order3:
                                Order3()
                                    .navigationBarHidden(true)
                                    .environment(\.appearance, appearance)
                            case .order4:
                                Order4()
                                    .navigationBarHidden(true)
                                    .environment(\.appearance, appearance)
                            case .shipping1:
                                Shipping1()
                                    .navigationTitle("Shipping")
                                    .environment(\.appearance, appearance)
                            case .shipping2:
                                Shipping2()
                                    .navigationTitle("Shipping")
                                    .environment(\.appearance, appearance)
                            case .payment1:
                                Payment1()
                                    .navigationTitle("Payment")
                                    .environment(\.appearance, appearance)
                            case .payment2:
                                Payment2()
                                    .navigationTitle("Payment")
                                    .environment(\.appearance, appearance)
                            case .filters1:
                                Filters1()
                                    .navigationTitle("Filters")
                                    .environment(\.appearance, appearance)
                            case .filters2:
                                Filters2()
                                    .navigationTitle("Filters")
                                    .environment(\.appearance, appearance)
                            case .filters3:
                                Filters3()
                                    .navigationTitle("Filters")
                                    .environment(\.appearance, appearance)
                            }
                        } label: {
                            CustomActionView(title: screen.displayName)
                        }
                    }
                }
            }
            .dsScreen()
            .navigationTitle(appearance.title)
            .toolbar {
                // Placement in a Navigation Bar
                ToolbarItem(placement: .navigationBarTrailing) { // Use `.navigationBarTrailing` for a right-side button
                    DSButton(title: "Change", style: .clear, action: { dismiss() })
                }
            }
        }
        .environment(\.appearance, appearance)
        .accentColor(appearance.navigationBar.buttons.color)
    }
}


fileprivate struct CustomActionView: View {
    
    let title: String
    
    var body: some View {
        DSHStack {
            DSText(title, .smallTitle)
            Spacer()
            DSChevronView()
        }.dsCardStyle()
    }
}

#Preview {
    ScreensView(appearance: DSKitAppearance())
}
