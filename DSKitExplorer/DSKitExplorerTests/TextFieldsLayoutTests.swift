//
//  TextFieldsLayoutTests.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class TextFieldsLayoutTests: XCTestCase {
    
    func testTextFields() {
        assertSnapshot(matching: TextFieldsVC(), as: .image)
    }
    
    func testTextFieldsGrouped() {
        assertSnapshot(matching: TextFieldsGroupedVC(), as: .image)
    }
    
    func testTextFieldIcons() {
        assertSnapshot(matching: TextFieldIconsVC(), as: .image)
    }
    
    func testTextFieldValidData() {
        assertSnapshot(matching: TextFieldValidDataVC(), as: .image)
    }
    
    func testTextFieldInvalidData() {
        assertSnapshot(matching: TextFieldInvalidDataVC(), as: .image)
    }
    
    func testTextFieldsGrid() {
        assertSnapshot(matching: TextFieldsGridVC(), as: .image)
    }
    
    func testTextFieldsGroupedGrid() {
        assertSnapshot(matching: TextFieldsGroupedGridVC(), as: .image)
    }
}
