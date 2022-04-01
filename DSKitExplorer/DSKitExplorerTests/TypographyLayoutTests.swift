//
//  TypographyLayoutTests.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class TypographyLayoutTests: XCTestCase {
    
    func testTypographyTextTypes() {
        assertSnapshot(matching: TypographyTextTypesVC(), as: .image)
    }
    
    func testTypographyTextList() {
        assertSnapshot(matching: TypographyTextListVC(), as: .image)
    }
    
    func testTypographyTextGrid() {
        assertSnapshot(matching: TypographyTextGridVC(), as: .image)
    }
    
    func testTypographyTextGallery() {
        assertSnapshot(matching: TypographyTextGalleryVC(), as: .image)
    }
    
    func testTypographyTextComposerText() {
        assertSnapshot(matching: TypographyTextComposerTextVC(), as: .image)
    }
    
    func testTypographyTextComposerAction() {
        assertSnapshot(matching: TypographyTextComposerActionVC(), as: .image)
    }
    
    func testTypographyActiveText() {
        assertSnapshot(matching: TypographyActiveTextVC(), as: .image)
    }
}
