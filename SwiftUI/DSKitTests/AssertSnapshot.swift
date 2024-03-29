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
        let view: UIView = UIHostingController(rootView: testView.fixedSize(horizontal: true, vertical: true)).view
        SnapshotTesting.assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize), named: named)
    }
}
