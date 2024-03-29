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
    
}
