//
//  DSSupplementaryView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 10.03.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation
import UIKit

public enum DSSupplementaryViewPosition: Equatable, Hashable {
    case leftTop
    case leftBottom
    case rightTop
    case rightCenter
    case rightBottom
    case center
}

public enum DSSupplementaryViewBackground: Equatable, Hashable {
    case clear
    case primary
    case secondary
    case lightBlur
    case white
    case black
    case darkBlur
    case custom(UIColor)
}

public enum DSSupplementaryViewCornerRadius: Equatable, Hashable {
    case primary
    case secondary
    case custom(CGFloat)
}

public enum DSSupplementaryInsets: Equatable, Hashable {
    case insets(UIEdgeInsets)
    case interItemSpacing
    case groupMargins
    case small
}

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine("\(self.x)\(self.y)")
    }
}

public enum DSSupplementaryOffset: Equatable, Hashable {
    
    case custom(CGPoint)
    case interItemSpacing
    case margins
    case small
    
    func cgPoint() -> CGPoint {
        
        switch self {
        case .custom(let point):
            return point
        case .interItemSpacing:
            let interItemSpacing = DSAppearance.shared.main.interItemSpacing
            return CGPoint(x: interItemSpacing, y: interItemSpacing)
        case .margins:
            let margins = DSAppearance.shared.main.margins
            return CGPoint(x: margins, y: margins)
        case .small:
            return CGPoint(x: 5, y: 5)
        }
    }
}

public struct DSSupplementaryView: Equatable, Hashable {
    
    public init(view: DSViewModel,
                position: DSSupplementaryViewPosition,
                background: DSSupplementaryViewBackground = .primary,
                insets: DSSupplementaryInsets = .interItemSpacing,
                offset: DSSupplementaryOffset = .interItemSpacing,
                cornerRadius: DSSupplementaryViewCornerRadius = .primary) {
        
        self.view = view
        self.position = position
        self.offset = offset
        self.background = background
        self.insets = insets
        self.cornerRadius = cornerRadius
    }
    
    let view: DSViewModel
    let position: DSSupplementaryViewPosition
    let offset: DSSupplementaryOffset
    let background: DSSupplementaryViewBackground
    let insets: DSSupplementaryInsets
    let cornerRadius: DSSupplementaryViewCornerRadius
    
    public static func == (lhs: DSSupplementaryView, rhs: DSSupplementaryView) -> Bool {
        return lhs.view.isEqual(to: rhs.view) &&
            lhs.position == rhs.position &&
            lhs.offset == rhs.offset &&
            lhs.background == rhs.background &&
            lhs.insets == rhs.insets &&
            lhs.cornerRadius == rhs.cornerRadius
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(view.hash())
        hasher.combine(position)
        hasher.combine(offset)
        hasher.combine(background)
        hasher.combine(insets)
        hasher.combine(cornerRadius)
    }
}

public extension DSViewModel {
    
    func asSupplementary(position: DSSupplementaryViewPosition,
                         background: DSSupplementaryViewBackground = .primary,
                         insets: DSSupplementaryInsets = .interItemSpacing,
                         offset: DSSupplementaryOffset = .interItemSpacing,
                         cornerRadius: DSSupplementaryViewCornerRadius = .primary) -> DSSupplementaryView {
        
        return DSSupplementaryView(view: self,
                                   position: position,
                                   background: background,
                                   insets: insets,
                                   offset: offset,
                                   cornerRadius: cornerRadius)
    }
}

