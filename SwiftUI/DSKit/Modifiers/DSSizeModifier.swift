//
//  DSSizeModifier.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 19.12.2022.
//

import Foundation
import SwiftUI

public struct DSSizeModifier: ViewModifier {
    
    let size: DSSize
    @Environment(\.appearance) var appearance: DSAppearance
    
    public func body(content: Content) -> some View {
        Group {
            if size.width == .fillUpTheSpace || size.height == .fillUpTheSpace {
                GeometryReader { geometry in
                    self.modifiedContent(content: content, geometry: geometry)
                }
            } else {
                self.modifiedContent(content: content, geometry: nil)
            }
        }
    }
    
    private func modifiedContent(content: Content, geometry: GeometryProxy?) -> some View {
        let width = geometry != nil ? calculateDimension(dimension: size.width, totalSize: geometry!.size.width) : calculateFixedDimension(dimension: size.width)
        let height = geometry != nil ? calculateDimension(dimension: size.height, totalSize: geometry!.size.height) : calculateFixedDimension(dimension: size.height)
        
        return content.frame(width: width, height: height)
    }
    
    private func calculateDimension(dimension: DSDimension, totalSize: CGFloat) -> CGFloat? {
        switch dimension {
        case .fillUpTheSpace:
            return totalSize
        default:
            return nil
        }
    }
    
    private func calculateFixedDimension(dimension: DSDimension) -> CGFloat? {
        switch dimension {
        case .none:
            return nil // No size set
        default:
            return appearance.size.number(for: dimension) // Custom logic for other dimensions
        }
    }
}

// Placeholder for your existing DSDimension, DSDesignable, and other relevant types


public extension View {
    func dsSize(_ size: DSSize) -> some View {
        self.modifier(DSSizeModifier(size: size))
    }
}

struct DSSizeModifier_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach { DSPreview {
                Color.blue
                    .dsSize(.regular)
                
                Color.blue
                    .dsSize(.medium)
                
                Color.blue
                    .dsSize(.mediumLarge)
                
                Color.blue
                    .dsSize(.designSize(20))
                
                Color.blue
                    .dsSize(100)
                
                Color.blue
                    .dsSize(1.5)
                
                Color.blue
                    .dsSize(2.5)
                
                Color.blue
                    .dsSize(.size(width: 100, height: 30))
                
            }.dsLayoutDebug()
        }
    }
}
