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
    func assertSnapshot(
        for testView: some View,
        named: String,
        record: Bool = false,
        timeout: TimeInterval = 5,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let view = UIHostingController(rootView: testView)
        SnapshotTesting.assertSnapshot(
            matching: view, as: .image(on: .iPhoneX),
            named: named,
            record: record,
            timeout: timeout,
            file: file,
            testName: named,
            line: line
        )
    }
}
