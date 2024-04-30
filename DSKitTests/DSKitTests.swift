//
//  DSKitTests.swift
//  DSKitTests
//
//  Created by Ivan Borinschi on 29.03.2024.
//

import SwiftUI
import XCTest
import SnapshotTesting
@testable import DSKit

final class DSKitTests: XCTestCase {

    func testDSCustomBackgroundModifier() throws {
        assertSnapshot(for: Testable_DSBackgroundModifier(), named: "DSBackgroundModifier")
    }
    
    func testDSCornerRadiusModifier() throws {
        assertSnapshot(for: Testable_DSCornerRadiusModifier(), named: "DSCornerRadiusModifier")
    }
    
    func testDSPriceView() throws {
        assertSnapshot(for: Testable_DSPriceView(), named: "DSPriceView")
    }
    
    func testDSBottomContainer() throws {
        assertSnapshot(for: Testable_DSBottomContainer(), named: "DSBottomContainer")
    }
    
    func testDSButton() throws {
        assertSnapshot(for: Testable_DSButton(), named: "DSButton")
    }
    
    func testDSChevronView() throws {
        assertSnapshot(for: Testable_DSChevronView(), named: "DSChevronView")
    }
    
    func testDSCoverFlow() throws {
        assertSnapshot(for: Testable_DSCoverFlow(), named: "DSCoverFlow")
    }
    
    func testDSDivider() throws {
        assertSnapshot(for: Testable_DSDivider(), named: "DSDivider")
    }
    
    func testDSGrid() throws {
        assertSnapshot(for: Testable_DSGrid(), named: "DSGrid")
    }
    
    func testDSGroupedList() throws {
        assertSnapshot(for: Testable_DSGroupedList(), named: "DSGroupedList")
    }
    
    func testDSHScroll() throws {
        assertSnapshot(for: Testable_DSHScroll(), named: "DSHScroll")
    }
    
    func testDSRatingView() throws {
        assertSnapshot(for: Testable_DSRatingView(), named: "DSRatingView")
    }
    
    func testDSSectionHeaderView() throws {
        assertSnapshot(for: Testable_DSSectionHeaderView(), named: "DSSectionHeaderView")
    }
    
    func testDSSFSymbolButton() throws {
        assertSnapshot(for: Testable_DSSFSymbolButton(), named: "DSSFSymbolButton")
    }
    
    func testDSTermsAndConditions() throws {
        assertSnapshot(for: Testable_DSTermsAndConditions(), named: "DSTermsAndConditions")
    }
    
    func testDSTextField() throws {
        assertSnapshot(for: Testable_DSTextField(), named: "DSTextField")
    }
    
    func testDSToolbarSFSymbolButton() throws {
        assertSnapshot(for: Testable_DSToolbarSFSymbolButton(), named: "DSToolbarSFSymbolButton")
    }
    
    func testDSImageView() throws {
        assertSnapshot(for: Testable_DSImageView(), named: "DSImageView")
    }
    
    func testDSText() throws {
        assertSnapshot(for: Testable_DSText(), named: "DSText")
    }
    
    func testDSVStack() throws {
        assertSnapshot(for: Testable_DSVStack(), named: "DSVStack")
    }
    
    func testDSHStack() throws {
        assertSnapshot(for: Testable_DSHStack(), named: "DSHStack")
    }
    
    func testDSPickerView() throws {
        assertSnapshot(for: Testable_DSPickerView(), named: "DSPickerView")
    }
    
    func testDSQuantityPicker() throws {
        assertSnapshot(for: Testable_DSQuantityPicker(), named: "DSQuantityPicker")
    }
    
    func testDSRadioPickerView() throws {
        assertSnapshot(for: Testable_DSRadioPickerView(), named: "DSRadioPickerView")
    }
}
