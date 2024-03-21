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
        assertSnapshot(matching: TypographyTextTypesVC(), as: .image(on: .iPhoneSe))
    }
    
    func testTypographyTextList() {
        assertSnapshot(matching: TypographyTextListVC(), as: .image(on: .iPhoneSe))
    }
    
    func testTypographyTextGrid() {
        assertSnapshot(matching: TypographyTextGridVC(), as: .image(on: .iPhoneSe))
    }
    
    func testTypographyTextGallery() {
        assertSnapshot(matching: TypographyTextGalleryVC(), as: .image(on: .iPhoneSe))
    }
    
    func testTypographyTextComposerText() {
        assertSnapshot(matching: TypographyTextComposerTextVC(), as: .image(on: .iPhoneSe))
    }
    
    func testTypographyTextComposerAction() {
        assertSnapshot(matching: TypographyTextComposerActionVC(), as: .image(on: .iPhoneSe))
    }
    
    func testTypographyActiveText() {
        assertSnapshot(matching: TypographyActiveTextVC(), as: .image(on: .iPhoneSe))
    }
}
