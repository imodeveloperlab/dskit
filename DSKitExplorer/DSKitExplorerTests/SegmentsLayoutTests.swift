//
//  CardViewController.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class SegmentsLayoutTests: XCTestCase {
    
    func testSegment() {
        assertSnapshot(matching: SegmentViewController(), as: .image)
    }
}
