//
//  MapsLayoutTests.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class PageSimplePageLayoutTests: XCTestCase {
    
    func testSimplePage() {
        assertSnapshot(matching: PageSimplePageVC(), as: .image)
    }
    
    func testSimplePageWithInsets() {
        assertSnapshot(matching: PageSimplePageWithInsetsVC(), as: .image)
    }
}
