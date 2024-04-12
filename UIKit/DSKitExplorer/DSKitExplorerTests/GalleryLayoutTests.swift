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
        assertSnapshot(matching: GalleryAbsoluteWidthLayoutVC(), as: .image(on: .iPhoneSe))
    }
    
    func testGalleryFractionalWidthLayout() {
        assertSnapshot(matching: GalleryFractionalWidthLayoutVC(), as: .image(on: .iPhoneSe))
    }
    
    func testGalleryFractional1GroupedLayout() {
        assertSnapshot(matching: GalleryFractional1GroupedLayoutVC(), as: .image(on: .iPhoneSe))
    }
    
    func testGalleryFractional1Layout() {
        assertSnapshot(matching: GalleryFractional1LayoutVC(), as: .image(on: .iPhoneSe))
    }
    
    func testGalleryFullWidthLayout() {
        assertSnapshot(matching: GalleryFullWidthLayoutVC(), as: .image(on: .iPhoneSe))
    }
    
    func testGalleryPageControlFractional1Layout() {
        assertSnapshot(matching: GalleryPageControlFractional1LayoutVC(), as: .image(on: .iPhoneSe))
    }
    
    func testGalleryPageControlLayout() {
        assertSnapshot(matching: GalleryPageControlLayoutVC(), as: .image(on: .iPhoneSe))
    }
}
