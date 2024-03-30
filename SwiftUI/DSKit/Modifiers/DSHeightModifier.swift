//
//  DSHeightModifier.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 19.12.2022.
//

import Foundation
import SwiftUI

public struct DSHeightModifier: ViewModifier {
    
    let height: DSSpacingDimension
    @Environment(\.appearance) var appearance: DSAppearance
    
    public func body(content: Content) -> some View {
        content.frame(height: appearance.size.number(for: height))
    }
}

public extension View {
    func dsHeight(_ height: DSSpacingDimension) -> some View {
        self.modifier(DSHeightModifier(height: height))
    }
}

struct DSHeightModifier_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach { DSPreview {
                Color.blue
                    .dsHeight(.medium)
                
                Color.blue
                    .dsHeight(.large)
                
                Color.blue
                    .dsHeight(.mediumLarge)
                
                Color.blue
                    .dsHeight(100)
                
                Color.blue
                    .dsHeight(1.5)
                
                Color.blue
                    .dsHeight(2.5)
                
            }.dsLayoutDebug()
        }
    }
}
