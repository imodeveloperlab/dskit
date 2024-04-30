//
//  DSDesignGuideView.swift
//  DSKit
//
//  Created by Ivan Borinschi on 22.02.2023.
//

import SwiftUI

public struct DSDesignGuideView: View {
    
    public enum Orientation {
        case vertical, horizontal
    }
    
    let spacing: CGFloat
    let orientation: Orientation
    let divider: Int
    
    public init(spacing: CGFloat, orientation: Orientation, divider: Int) {
        self.spacing = spacing / CGFloat(divider)
        self.orientation = orientation
        self.divider = divider
    }
    
    public var body: some View {
        GeometryReader { geometry in
            // Adjusting totalCount calculation to ensure coverage
            let totalCount: Int = {
                switch orientation {
                case .vertical:
                    // Calculate the exact number needed to cover the width, then adjust for centering
                    let exactCount = geometry.size.width / spacing
                    return Int(ceil(exactCount)) * 2 // Ensure we cover the whole width
                case .horizontal:
                    return Int(geometry.size.height / spacing) + 1
                }
            }()
            
            let itemWidth: CGFloat = orientation == .vertical ? spacing : geometry.size.width
            let itemHeight: CGFloat = orientation == .horizontal ? spacing : geometry.size.height
            
            ZStack {
                ForEach(0..<totalCount, id: \.self) { index in
                    Rectangle()
                        .fill(index % 2 == 0 ? (orientation == .vertical ? Color.blue.opacity(0.1) : Color.red.opacity(0.1)) : Color.clear)
                        .frame(width: itemWidth, height: itemHeight)
                        .offset(x: orientation == .vertical ? calculateVerticalOffset(index: index, totalCount: totalCount, width: geometry.size.width, spacing: spacing) : 0,
                                y: orientation == .horizontal ? CGFloat(index) * spacing : 0)
                }
            }
        }
    }
    
    private func calculateVerticalOffset(index: Int, totalCount: Int, width: CGFloat, spacing: CGFloat) -> CGFloat {
        let center = width / 2
        let halfCount = totalCount / 2
        let positionIndex = index - halfCount
        let positionOffset = CGFloat(positionIndex) * spacing
        // Adjust the starting position to be the center for the first line
        return positionOffset + center - (spacing / 2) * CGFloat(totalCount % 2 == 0 ? 1 : 0)
    }
}

public struct DSDesignGuideViewModifier: ViewModifier {
    
    @Environment(\.appearance) var appearance: DSAppearance
    
    public enum Orientation {
        case vertical, horizontal, both
    }
    
    let orientation: Orientation
    let divider: Int
    
    public init(orientation: Orientation, divider: Int) {
        self.orientation = orientation
        self.divider = divider
    }
    
    public func body(content: Content) -> some View {
        switch orientation {
        case .horizontal:
            content.background(DSDesignGuideView(spacing: appearance.spacing.value(for: .regular), orientation: .horizontal, divider: divider))
        case .vertical:
            content.background(DSDesignGuideView(spacing: appearance.spacing.value(for: .regular), orientation: .horizontal, divider: divider))
        case .both:
            content
                .background(DSDesignGuideView(spacing: appearance.spacing.value(for: .regular), orientation: .vertical, divider: divider))
                .background(DSDesignGuideView(spacing: appearance.spacing.value(for: .regular), orientation: .horizontal, divider: divider))
        }
    }
}

public extension View {
    func dsLayoutGuideLines(with orientation: DSDesignGuideViewModifier.Orientation = .both, divider: Int = 2) -> some View {
        return self.modifier(DSDesignGuideViewModifier(orientation: orientation, divider: divider))
    }
}

struct DSDesignGuideView_Previews: PreviewProvider {
    static var previews: some View {
        DSDesignGuideView(spacing: 20, orientation: .vertical, divider: 2)
    }
}
