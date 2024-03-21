//
//  GalleryLayoutTests.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class GalleryLayoutTests: XCTestCase {
    
    override func setUp() async throws {
        SnapshotTesting.diffTool = "open"
    }
    
    func testGalleryAbsoluteWidthLayout() {
        assertSnapshot(matching: GalleryAbsoluteWidthLayoutVC(), as: .image(on: .iPhoneX))
    }
    
    func testGalleryFractionalWidthLayout() {
        assertSnapshot(matching: GalleryFractionalWidthLayoutVC(), as: .image(on: .iPhoneX))
    }
    
    func testGalleryFractional1GroupedLayout() {
        assertSnapshot(matching: GalleryFractional1GroupedLayoutVC(), as: .image(on: .iPhoneX))
    }
    
    func testGalleryFractional1Layout() {
        assertSnapshot(matching: GalleryFractional1LayoutVC(), as: .image(on: .iPhoneX))
    }
    
    func testGalleryFullWidthLayout() {
        assertSnapshot(matching: GalleryFullWidthLayoutVC(), as: .image(on: .iPhoneX))
    }
    
    func testGalleryPageControlFractional1Layout() {
        assertSnapshot(matching: GalleryPageControlFractional1LayoutVC(), as: .image(on: .iPhoneX))
    }
    
    func testGalleryPageControlLayout() {
        assertSnapshot(matching: GalleryPageControlLayoutVC(), as: .image(on: .iPhoneX))
    }
}
