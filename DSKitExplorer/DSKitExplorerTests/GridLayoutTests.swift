//
//  GridLayoutTests.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class GridLayoutTests: XCTestCase {
    
    override func setUp() async throws {
        SnapshotTesting.diffTool = "open"
    }
    
    func testGridSimpleLayout() {
        assertSnapshot(matching: GridSimpleLayoutVC(), as: .image(on: .iPhoneX))
    }
    
    func testGridSimpleHeaderFooterLayout() {
        assertSnapshot(matching: GridSimpleHeaderFooterLayoutVC(), as: .image(on: .iPhoneX))
    }
    
    func testGridGrouped3RowsLayoutVC() {
        assertSnapshot(matching: GridGrouped3RowsLayoutVC(), as: .image(on: .iPhoneX))
    }
    
    func testGridGrouped5RowsHeaderFooterLayout() {
        assertSnapshot(matching: GridGrouped5RowsHeaderFooterLayoutVC(), as: .image(on: .iPhoneX))
    }
}
