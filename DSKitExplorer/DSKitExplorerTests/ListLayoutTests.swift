//
//  ListLayoutTests.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class ListLayoutTests: XCTestCase {
    
    func testListSimpleLayout() {
        assertSnapshot(matching: ListSimpleLayoutVC(), as: .image)
    }
    
    func testListSeparatorLayout() {
        assertSnapshot(matching: ListSeparatorLayoutVC(), as: .image)
    }
    
    func testListGroupedLayout() {
        assertSnapshot(matching: ListGroupedLayoutVC(), as: .image)
    }
    
    func testListGroupedAndSeparatorLayout() {
        assertSnapshot(matching: ListGroupedAndSeparatorLayoutVC(), as: .image)
    }
    
    func testListGroupedSeparatorHeaderFooterLayout() {
        assertSnapshot(matching: ListGroupedSeparatorHeaderFooterLayoutVC(), as: .image)
    }
}
