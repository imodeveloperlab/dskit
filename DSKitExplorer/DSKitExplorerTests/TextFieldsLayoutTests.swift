//
//  TextFieldsLayoutTests.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class TextFieldsLayoutTests: XCTestCase {
    
    override func setUp() async throws {
        SnapshotTesting.diffTool = "open"
    }
    
    func testTextFields() {
        assertSnapshot(matching: TextFieldsVC(), as: .image(on: .iPhoneSe))
    }
    
    func testTextFieldsGrouped() {
        assertSnapshot(matching: TextFieldsGroupedVC(), as: .image(on: .iPhoneSe))
    }
    
    func testTextFieldIcons() {
        assertSnapshot(matching: TextFieldIconsVC(), as: .image(on: .iPhoneSe))
    }
    
    func testTextFieldValidData() {
        assertSnapshot(matching: TextFieldValidDataVC(), as: .image(on: .iPhoneSe))
    }
    
    func testTextFieldInvalidData() {
        assertSnapshot(matching: TextFieldInvalidDataVC(), as: .image(on: .iPhoneSe))
    }
    
    func testTextFieldsGrid() {
        assertSnapshot(matching: TextFieldsGridVC(), as: .image(on: .iPhoneSe))
    }
    
    func testTextFieldsGroupedGrid() {
        assertSnapshot(matching: TextFieldsGroupedGridVC(), as: .image(on: .iPhoneSe))
    }
}
