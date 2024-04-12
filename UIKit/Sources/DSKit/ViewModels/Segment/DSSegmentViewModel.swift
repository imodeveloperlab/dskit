//
//  DSSegmentViewModel.swift
//  DSKit
//
//  Created by Borinschi Ivan on 17.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//
//

import UIKit

public class DSSegmentVM: DSViewModel, Equatable, Hashable {
    
    // Properties
    public var segments: [String]
    public var selectedSegmentIndex: Int
    
    public init(segments: [String], selectedSegmentIndex: Int = 0, didTapOnSegment: ((DSSegmentIndex) -> Void)? = nil) {
        self.segments = segments
        self.didTapOnSegment = didTapOnSegment
        self.selectedSegmentIndex = selectedSegmentIndex
    }
    
    public var insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    public var type: DSSegmentVMType = .default
    public var identifier = "Segment"
    public var accessibilityIdentifier = "Segment"
    
    /// Style
    public var style: DSViewModelStyle = DSViewModelStyle()
    
    @NonEquatable public var didTap: ((DSViewModel) -> Void)?
    @NonEquatable public var didTapOnSegment: ((DSSegmentIndex) -> Void)?
    
    public func hash(into hasher: inout Hasher) {
        
        for segment in segments {
            hasher.combine(segment)
        }
        
        hasher.combine(insets)
        hasher.combine(type)
        hasher.combine(accessibilityIdentifier)
    }
    
    public static func == (lhs: DSSegmentVM, rhs: DSSegmentVM) -> Bool {
        return lhs.segments == rhs.segments &&
            lhs.selectedSegmentIndex == rhs.selectedSegmentIndex &&
            lhs.insets == rhs.insets &&
            lhs.type == rhs.type &&
            lhs.accessibilityIdentifier == rhs.accessibilityIdentifier &&
            lhs._didTap == rhs._didTap &&
            lhs._didTapOnSegment == rhs._didTapOnSegment
    }
    
    /// Supplementary items
    public var supplementaryItems: [DSSupplementaryView]?
    
    /// Companion object
    @NonEquatable public var object: AnyObject?
    
    public var bottomSideView: DSSideView?
    public var leftSideView: DSSideView?
    public var rightSideView: DSSideView?
    public var topSideView: DSSideView?
}

public typealias DSSegmentIndex = (title: String, index: Int)

public enum DSSegmentVMType: Hashable {
    case `default`
}

public extension DSSegmentVM {
    
    func height(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelHeight {
        return .absolute(35)
    }
    
    func viewRepresentation() -> DSReusableUIView {
        return DSSegmentUIView.instanceFromNib()
    }
    
    func isEqual(to model: DSViewModel) -> Bool {
        guard let model = model as? Self else { return false }
        return self == model
    }
    
    func hash() -> String {
        return hashValue.string()
    }
}
