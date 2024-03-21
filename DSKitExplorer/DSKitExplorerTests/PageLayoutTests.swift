//
//  MapsLayoutTests.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class PageSimplePageLayoutTests: XCTestCase {
    
    override func setUp() async throws {
        SnapshotTesting.diffTool = "open"
    }
    
    func testSimplePage() {
        assertSnapshot(matching: PageSimplePageVC(), as: .image(on: .iPhoneX))
    }
    
    func testSimplePageWithInsets() {
        assertSnapshot(matching: PageSimplePageWithInsetsVC(), as: .image(on: .iPhoneX))
    }
}
