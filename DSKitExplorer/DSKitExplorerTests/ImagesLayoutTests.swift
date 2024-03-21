//
//  ImagesLayoutTests.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class ImagesLayoutTests: XCTestCase {
    
    override func setUp() async throws {
        SnapshotTesting.diffTool = "open"
    }
    
    func testImages() {
        assertSnapshot(matching: ImagesVC(), as: .image(on: .iPhoneX))
    }
    
    func testImageGrid() {
        assertSnapshot(matching: ImageGridVC(), as: .image(on: .iPhoneX))
    }
    
    func testImageList() {
        assertSnapshot(matching: ImageListVC(), as: .image(on: .iPhoneX))
    }
    
    func testImageGallery() {
        assertSnapshot(matching: ImageGalleryVC(), as: .image(on: .iPhoneX))
    }
}
