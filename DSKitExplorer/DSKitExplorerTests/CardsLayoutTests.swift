//
//  CardViewController.swift
//  DSKit ExplorerTests
//
//  Created by Borinschi Ivan on 01.02.2021.
//

import SnapshotTesting
import XCTest

class CardsLayoutTests: XCTestCase {
    
    func testCards() {
        assertSnapshot(matching: CardViewController(), as: .image)
    }
}
