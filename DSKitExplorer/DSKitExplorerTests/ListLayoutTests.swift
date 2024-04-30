//
//  ListLayoutTests.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class ListLayoutTests: XCTestCase {
    
    override func setUp() async throws {
        SnapshotTesting.diffTool = "open"
    }
    
    func testListSimpleLayout() {
        assertSnapshot(matching: ListSimpleLayoutVC(), as: .image(on: .iPhoneSe))
    }
    
    func testListSeparatorLayout() {
        assertSnapshot(matching: ListSeparatorLayoutVC(), as: .image(on: .iPhoneSe))
    }
    
    func testListGroupedLayout() {
        assertSnapshot(matching: ListGroupedLayoutVC(), as: .image(on: .iPhoneSe))
    }
    
    func testListGroupedAndSeparatorLayout() {
        assertSnapshot(matching: ListGroupedAndSeparatorLayoutVC(), as: .image(on: .iPhoneSe))
    }
    
    func testListGroupedSeparatorHeaderFooterLayout() {
        assertSnapshot(matching: ListGroupedSeparatorHeaderFooterLayoutVC(), as: .image(on: .iPhoneSe))
    }
}
