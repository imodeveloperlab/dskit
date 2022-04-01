//
//  GalleryLayoutTests.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class GalleryLayoutTests: XCTestCase {
    
    func testGalleryAbsoluteWidthLayout() {
        assertSnapshot(matching: GalleryAbsoluteWidthLayoutVC(), as: .image)
    }
    
    func testGalleryFractionalWidthLayout() {
        assertSnapshot(matching: GalleryFractionalWidthLayoutVC(), as: .image)
    }
    
    func testGalleryFractional1GroupedLayout() {
        assertSnapshot(matching: GalleryFractional1GroupedLayoutVC(), as: .image)
    }
    
    func testGalleryFractional1Layout() {
        assertSnapshot(matching: GalleryFractional1LayoutVC(), as: .image)
    }
    
    func testGalleryFullWidthLayout() {
        assertSnapshot(matching: GalleryFullWidthLayoutVC(), as: .image)
    }
    
    func testGalleryPageControlFractional1Layout() {
        assertSnapshot(matching: GalleryPageControlFractional1LayoutVC(), as: .image)
    }
    
    func testGalleryPageControlLayout() {
        assertSnapshot(matching: GalleryPageControlLayoutVC(), as: .image)
    }
}
