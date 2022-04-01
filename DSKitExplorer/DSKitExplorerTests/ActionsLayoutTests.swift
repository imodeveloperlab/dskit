//
//  ActionsLayoutTests.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class ActionsLayoutTests: XCTestCase {
    
    func testActionList() {
        assertSnapshot(matching: ActionListVC(), as: .image, timeout: 60)
    }
    
    func testActionGrid() {
        assertSnapshot(matching: ActionGridVC(), as: .image)
    }
    
    func testActionGallery() {
        assertSnapshot(matching: ActionGalleryVC(), as: .image)
    }
    
    func testActionLeftIcon() {
        assertSnapshot(matching: ActionLeftIconVC(), as: .image)
    }
    
    func testActionLeftRoundImage() {
        assertSnapshot(matching: ActionLeftRoundImageVC(), as: .image)
    }
    
    func testActionLeftRoundImageSize() {
        assertSnapshot(matching: ActionLeftRoundImageSizeVC(), as: .image)
    }
    
    func testActionLeftImage() {
        assertSnapshot(matching: ActionLeftImageVC(), as: .image)
    }
    
    func testActionRightIcon() {
        assertSnapshot(matching: ActionRightIconVC(), as: .image)
    }
    
    func testActionRightRoundImage() {
        assertSnapshot(matching: ActionRightRoundImageVC(), as: .image)
    }
    
    func testActionRightRoundImageSize() {
        assertSnapshot(matching: ActionRightRoundImageSizeVC(), as: .image)
    }
    
    func testActionRightImage() {
        assertSnapshot(matching: ActionRightImageVC(), as: .image)
    }
    
    func testActionRightButton() {
        assertSnapshot(matching: ActionRightButtonVC(), as: .image)
    }
    
    func testActionTopImage() {
        assertSnapshot(matching: ActionTopImageVC(), as: .image)
    }
    
    func testActionGroupedList() {
        assertSnapshot(matching: ActionGroupedListVC(), as: .image)
    }
}
