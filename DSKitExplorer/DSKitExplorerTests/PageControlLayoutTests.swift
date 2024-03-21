//
//  CardViewController.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class PageControlLayoutTests: XCTestCase {
    
    override func setUp() async throws {
        SnapshotTesting.diffTool = "open"
    }
    
    func testPageControl() {
        assertSnapshot(matching: PageControlViewController(), as: .image(on: .iPhoneX))
    }
}
