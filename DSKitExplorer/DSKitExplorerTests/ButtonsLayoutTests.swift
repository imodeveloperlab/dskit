//
//  ButtonsLayoutTests.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class ButtonsLayoutTests: XCTestCase {
    
    override func setUp() async throws {
        SnapshotTesting.diffTool = "open"
    }
    
    func testButtons() {
        assertSnapshot(matching: ButtonsVC(), as: .image(on: .iPhoneX))
    }
    
    func testButtonGrid() {
        assertSnapshot(matching: ButtonGridVC(), as: .image(on: .iPhoneX))
    }
    
    func testButtonList() {
        assertSnapshot(matching: ButtonListVC(), as: .image(on: .iPhoneX))
    }
    
    func testButtonGallery() {
        assertSnapshot(matching: ButtonGalleryVC(), as: .image(on: .iPhoneX))
    }
}
