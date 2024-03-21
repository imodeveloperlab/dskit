//
//  ActionsLayoutTests.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class ActionsLayoutTests: XCTestCase {
    
    override func setUp() async throws {
        SnapshotTesting.diffTool = "open"
    }
    
    func testActionList() {
        assertSnapshot(matching: ActionListVC(), as: .image(on: .iPhoneX), timeout: 60)
    }
    
    func testActionGrid() {
        assertSnapshot(matching: ActionGridVC(), as: .image(on: .iPhoneX))
    }
    
    func testActionGallery() {
        assertSnapshot(matching: ActionGalleryVC(), as: .image(on: .iPhoneX))
    }
    
    func testActionLeftIcon() {
        assertSnapshot(matching: ActionLeftIconVC(), as: .image(on: .iPhoneX))
    }
    
    func testActionLeftRoundImage() {
        assertSnapshot(matching: ActionLeftRoundImageVC(), as: .image(on: .iPhoneX))
    }
    
    func testActionLeftRoundImageSize() {
        assertSnapshot(matching: ActionLeftRoundImageSizeVC(), as: .image(on: .iPhoneX))
    }
    
    func testActionLeftImage() {
        assertSnapshot(matching: ActionLeftImageVC(), as: .image(on: .iPhoneX))
    }
    
    func testActionRightIcon() {
        assertSnapshot(matching: ActionRightIconVC(), as: .image(on: .iPhoneX))
    }
    
    func testActionRightRoundImage() {
        assertSnapshot(matching: ActionRightRoundImageVC(), as: .image(on: .iPhoneX))
    }
    
    func testActionRightRoundImageSize() {
        assertSnapshot(matching: ActionRightRoundImageSizeVC(), as: .image(on: .iPhoneX))
    }
    
    func testActionRightImage() {
        assertSnapshot(matching: ActionRightImageVC(), as: .image(on: .iPhoneX))
    }
    
    func testActionRightButton() {
        assertSnapshot(matching: ActionRightButtonVC(), as: .image(on: .iPhoneX))
    }
    
    func testActionTopImage() {
        assertSnapshot(matching: ActionTopImageVC(), as: .image(on: .iPhoneX))
    }
    
    func testActionGroupedList() {
        assertSnapshot(matching: ActionGroupedListVC(), as: .image(on: .iPhoneX))
    }
}
