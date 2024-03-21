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
        assertSnapshot(matching: ActionListVC(), as: .image(on: .iPhoneSe), timeout: 60)
    }
    
    func testActionGrid() {
        assertSnapshot(matching: ActionGridVC(), as: .image(on: .iPhoneSe))
    }
    
    func testActionGallery() {
        assertSnapshot(matching: ActionGalleryVC(), as: .image(on: .iPhoneSe))
    }
    
    func testActionLeftIcon() {
        assertSnapshot(matching: ActionLeftIconVC(), as: .image(on: .iPhoneSe))
    }
    
    func testActionLeftRoundImage() {
        assertSnapshot(matching: ActionLeftRoundImageVC(), as: .image(on: .iPhoneSe))
    }
    
    func testActionLeftRoundImageSize() {
        assertSnapshot(matching: ActionLeftRoundImageSizeVC(), as: .image(on: .iPhoneSe))
    }
    
    func testActionLeftImage() {
        assertSnapshot(matching: ActionLeftImageVC(), as: .image(on: .iPhoneSe))
    }
    
    func testActionRightIcon() {
        assertSnapshot(matching: ActionRightIconVC(), as: .image(on: .iPhoneSe))
    }
    
    func testActionRightRoundImage() {
        assertSnapshot(matching: ActionRightRoundImageVC(), as: .image(on: .iPhoneSe))
    }
    
    func testActionRightRoundImageSize() {
        assertSnapshot(matching: ActionRightRoundImageSizeVC(), as: .image(on: .iPhoneSe))
    }
    
    func testActionRightImage() {
        assertSnapshot(matching: ActionRightImageVC(), as: .image(on: .iPhoneSe))
    }
    
    func testActionRightButton() {
        assertSnapshot(matching: ActionRightButtonVC(), as: .image(on: .iPhoneSe))
    }
    
    func testActionTopImage() {
        assertSnapshot(matching: ActionTopImageVC(), as: .image(on: .iPhoneSe))
    }
    
    func testActionGroupedList() {
        assertSnapshot(matching: ActionGroupedListVC(), as: .image(on: .iPhoneSe))
    }
}
