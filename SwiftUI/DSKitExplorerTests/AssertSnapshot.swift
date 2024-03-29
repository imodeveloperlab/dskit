//
//  AssertSnapshot.swift
//  DSKitTests
//
//  Created by Ivan Borinschi on 29.03.2024.
//

import SwiftUI
import XCTest
import SnapshotTesting

extension XCTestCase {
    func assertSnapshot(for testView: some View, named: String) {
        let view = UIHostingController(rootView: testView)
        SnapshotTesting.assertSnapshot(matching: view, as: .image(on: .iPhoneX), named: named)
    }
}
