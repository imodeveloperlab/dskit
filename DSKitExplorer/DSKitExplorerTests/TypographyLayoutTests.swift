//
//  TypographyLayoutTests.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class TypographyLayoutTests: XCTestCase {
    
    override func setUp() async throws {
        SnapshotTesting.diffTool = "open"
    }
    
    func testTypographyTextTypes() {
        assertSnapshot(matching: TypographyTextTypesVC(), as: .image(on: .iPhoneX))
    }
    
    func testTypographyTextList() {
        assertSnapshot(matching: TypographyTextListVC(), as: .image(on: .iPhoneX))
    }
    
    func testTypographyTextGrid() {
        assertSnapshot(matching: TypographyTextGridVC(), as: .image(on: .iPhoneX))
    }
    
    func testTypographyTextGallery() {
        assertSnapshot(matching: TypographyTextGalleryVC(), as: .image(on: .iPhoneX))
    }
    
    func testTypographyTextComposerText() {
        assertSnapshot(matching: TypographyTextComposerTextVC(), as: .image(on: .iPhoneX))
    }
    
    func testTypographyTextComposerAction() {
        assertSnapshot(matching: TypographyTextComposerActionVC(), as: .image(on: .iPhoneX))
    }
    
    func testTypographyActiveText() {
        assertSnapshot(matching: TypographyActiveTextVC(), as: .image(on: .iPhoneX))
    }
}
