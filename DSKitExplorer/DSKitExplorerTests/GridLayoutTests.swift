//
//  GridLayoutTests.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class GridLayoutTests: XCTestCase {
    
    func testGridSimpleLayout() {
        assertSnapshot(matching: GridSimpleLayoutVC(), as: .image)
    }
    
    func testGridSimpleHeaderFooterLayout() {
        assertSnapshot(matching: GridSimpleHeaderFooterLayoutVC(), as: .image)
    }
    
    func testGridGrouped3RowsLayoutVC() {
        assertSnapshot(matching: GridGrouped3RowsLayoutVC(), as: .image)
    }
    
    func testGridGrouped5RowsHeaderFooterLayout() {
        assertSnapshot(matching: GridGrouped5RowsHeaderFooterLayoutVC(), as: .image)
    }
}
