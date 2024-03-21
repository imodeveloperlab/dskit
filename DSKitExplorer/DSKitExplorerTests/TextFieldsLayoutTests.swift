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
        assertSnapshot(matching: TextFieldsVC(), as: .image(on: .iPhoneX))
    }
    
    func testTextFieldsGrouped() {
        assertSnapshot(matching: TextFieldsGroupedVC(), as: .image(on: .iPhoneX))
    }
    
    func testTextFieldIcons() {
        assertSnapshot(matching: TextFieldIconsVC(), as: .image(on: .iPhoneX))
    }
    
    func testTextFieldValidData() {
        assertSnapshot(matching: TextFieldValidDataVC(), as: .image(on: .iPhoneX))
    }
    
    func testTextFieldInvalidData() {
        assertSnapshot(matching: TextFieldInvalidDataVC(), as: .image(on: .iPhoneX))
    }
    
    func testTextFieldsGrid() {
        assertSnapshot(matching: TextFieldsGridVC(), as: .image(on: .iPhoneX))
    }
    
    func testTextFieldsGroupedGrid() {
        assertSnapshot(matching: TextFieldsGroupedGridVC(), as: .image(on: .iPhoneX))
    }
}
