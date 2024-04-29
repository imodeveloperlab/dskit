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
        SnapshotTesting.diffTool = "open"
        isRecording = false
        let testView = testView
                        .frame(width: 400)
                        .padding(20)
        
        let view: UIView = UIHostingController(rootView: testView.fixedSize(horizontal: true, vertical: true)).view
        SnapshotTesting.assertSnapshot(
            matching: view,
            as: .image(size: view.intrinsicContentSize),
            record: record,
            timeout: timeout,
            file: file,
            testName: named,
            line: line
        )
    }
}
