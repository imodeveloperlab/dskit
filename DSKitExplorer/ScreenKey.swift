//
//  ScreenKey.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 14.04.2024.
//

import Foundation

enum ScreenKey: String, CaseIterable, Identifiable {
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
