//
//  DSKitTests.swift
//  DSKitTests
//
//  Created by Ivan Borinschi on 29.03.2024.
//

import SwiftUI
import XCTest
import SnapshotTesting
@testable import DSKit

final class DSKitTests: XCTestCase {

    func testDSCustomBackgroundModifier() throws {
        assertSnapshot(for: Testable_DSBackgroundModifier(), named: "DSBackgroundModifier")
    }
    
    func testDSCornerRadiusModifier() throws {
        assertSnapshot(for: Testable_DSCornerRadiusModifier(), named: "DSCornerRadiusModifier")
    }
}
