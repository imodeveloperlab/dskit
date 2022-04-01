//
//  MapsLayoutTests.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class MapsLayoutTests: XCTestCase {
    
    func testMap() {
        assertSnapshot(matching: MapViewController(), as: .image)
    }
}
