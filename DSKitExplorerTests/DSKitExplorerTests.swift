//
//  DSKitExplorerTests.swift
//  DSKitExplorerTests
//
//  Created by Ivan Borinschi on 29.03.2024.
//

import SwiftUI
import XCTest
import SnapshotTesting
@testable import DSKitExplorer

final class DSKitExplorerTests: XCTestCase {
    
    func testHomeScreen1() throws {
        assertSnapshot(for: Testable_HomeScreen1(), named: "HomeScreen1")
    }
    
    func testHomeScreen2() throws {
        assertSnapshot(for: Testable_HomeScreen2(), named: "HomeScreen2")
    }
    
    func testHomeScreen3() throws {
        assertSnapshot(for: Testable_HomeScreen3(), named: "HomeScreen3")
    }
    
    func testHomeScreen4() throws {
        assertSnapshot(for: Testable_HomeScreen4(), named: "HomeScreen4")
    }
    
    func testLogInScreen1() throws {
        assertSnapshot(for: Testable_LogInScreen1(), named: "LogInScreen1")
    }
    
    func testLogInScreen2() throws {
        assertSnapshot(for: Testable_LogInScreen2(), named: "LogInScreen2")
    }
    
    func testLogInScreen3() throws {
        assertSnapshot(for: Testable_LogInScreen3(), named: "LogInScreen3")
    }
    
    func testLogInScreen4() throws {
        assertSnapshot(for: Testable_LogInScreen4(), named: "LogInScreen4")
    }
    
    func testProfileScreen1() throws {
        assertSnapshot(for: Testable_ProfileScreen1(), named: "ProfileScreen1")
    }
    
    func testProfileScreen2() throws {
        assertSnapshot(for: Testable_ProfileScreen2(), named: "ProfileScreen2")
    }
    
    func testProfileScreen3() throws {
        assertSnapshot(for: Testable_ProfileScreen3(), named: "ProfileScreen3")
    }
    
    func testSignUpScreen1() throws {
        assertSnapshot(for: Testable_SignUpScreen1(), named: "SignUpScreen1")
    }
    
    func testSignUpScreen2() throws {
        assertSnapshot(for: Testable_SignUpScreen2(), named: "SignUpScreen2")
    }
    
    func testSignUpScreen3() throws {
        assertSnapshot(for: Testable_SignUpScreen3(), named: "SignUpScreen3")
    }
    
    func testSignUpScreen4() throws {
        assertSnapshot(for: Testable_SignUpScreen4(), named: "SignUpScreen4")
    }
   
    func testCartScreen1() throws {
        assertSnapshot(for: Testable_CartScreen1(), named: "CartScreen1")
    }
    
    func testCartScreen2() throws {
        assertSnapshot(for: Testable_CartScreen2(), named: "CartScreen2")
    }
    
    func testCartScreen3() throws {
        assertSnapshot(for: Testable_CartScreen3(), named: "CartScreen3")
    }
    
    func testCartScreen4() throws {
        assertSnapshot(for: Testable_CartScreen4(), named: "CartScreen4")
    }
    
    func testCartScreen5() throws {
        assertSnapshot(for: Testable_CartScreen5(), named: "CartScreen5")
    }
    
    func testItemDetails1() throws {
        assertSnapshot(for: Testable_ItemDetails1(), named: "ItemDetails1")
    }
    
    func testItemDetails2() throws {
        assertSnapshot(for: Testable_ItemDetails2(), named: "ItemDetails2")
    }
    
    func testItemDetails3() throws {
        assertSnapshot(for: Testable_ItemDetails3(), named: "ItemDetails3")
    }
    
    func testItemDetails4() throws {
        assertSnapshot(for: Testable_ItemDetails4(), named: "ItemDetails4")
    }
    
    func testItemDetails5() throws {
        assertSnapshot(for: Testable_ItemDetails5(), named: "ItemDetails5")
    }
    
    func testOrder1() throws {
        assertSnapshot(for: Testable_Order1(), named: "Order1")
    }
    
    func testOrder2() throws {
        assertSnapshot(for: Testable_Order2(), named: "Order2")
    }
    
    func testOrder3() throws {
        assertSnapshot(for: Testable_Order3(), named: "Order3")
    }
    
    func testOrder4() throws {
        assertSnapshot(for: Testable_Order4(), named: "Order4")
    }
    
    func testShipping1() throws {
        assertSnapshot(for: Testable_Shipping1(), named: "Shipping1")
    }
    
    func testShipping2() throws {
        assertSnapshot(for: Testable_Shipping2(), named: "Shipping2")
    }
    
    func testPayment1() throws {
        assertSnapshot(for: Testable_Payment1(), named: "Payment1")
    }
    
    func testFilters1() throws {
        assertSnapshot(for: Testable_Filters1(), named: "Filters1")
    }
    
    func testFilters2() throws {
        assertSnapshot(for: Testable_Filters1(), named: "Filters2")
    }
    
    func testFilters3() throws {
        assertSnapshot(for: Testable_Filters3(), named: "Filters3")
    }
    
    func testItems1() throws {
        assertSnapshot(for: Testable_Items1(), named: "Items1")
    }
    
    func testItems2() throws {
        assertSnapshot(for: Testable_Items2(), named: "Items2")
    }
    
    func testItems3() throws {
        assertSnapshot(for: Testable_Items3(), named: "Items3")
    }
    
    func testItems4() throws {
        assertSnapshot(for: Testable_Items4(), named: "Items4")
    }
    
    func testItems5() throws {
        assertSnapshot(for: Testable_Items5(), named: "Items5")
    }
    
    func testItems6() throws {
        assertSnapshot(for: Testable_Items6(), named: "Items6")
    }
    
    func testItems7() throws {
        assertSnapshot(for: Testable_Items7(), named: "Items7")
    }
    
    func testItems8() throws {
        assertSnapshot(for: Testable_Items8(), named: "Items8")
    }
    
    func testCategories1() throws {
        assertSnapshot(for: Testable_Categories1(), named: "Categories1")
    }
    
    func testCategories2() throws {
        assertSnapshot(for: Testable_Categories2(), named: "Categories2")
    }
    
    func testCategories3() throws {
        assertSnapshot(for: Testable_Categories3(), named: "Categories3")
    }
    
    func testCategories4() throws {
        assertSnapshot(for: Testable_Categories4(), named: "Categories4")
    }
    
    func testCategories5() throws {
        assertSnapshot(for: Testable_Categories5(), named: "Categories5")
    }
    
    func testNotificationsScreen1() throws {
        assertSnapshot(for: Testable_NotificationsScreen1(), named: "NotificationsScreen1")
    }
    
//    func testAboutUsScreen1() throws {
//        assertSnapshot(for: Testable_AboutUsScreen1(), named: "AboutUsScreen1")
//    }
    
//    func testAboutUsScreen2() throws {
//        assertSnapshot(for: Testable_AboutUsScreen2(), named: "AboutUsScreen2")
//    }
    
}
