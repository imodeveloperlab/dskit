//
//  ButtonsLayoutTests.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class ButtonsLayoutTests: XCTestCase {
    
    func testButtons() {
        assertSnapshot(matching: ButtonsVC(), as: .image)
    }
    
    func testButtonGrid() {
        assertSnapshot(matching: ButtonGridVC(), as: .image)
    }
    
    func testButtonList() {
        assertSnapshot(matching: ButtonListVC(), as: .image)
    }
    
    func testButtonGallery() {
        assertSnapshot(matching: ButtonGalleryVC(), as: .image)
    }
}
