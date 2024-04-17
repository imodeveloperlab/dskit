//
//  DSHeightModifier.swift
//  DSKit
//
//  Created by Ivan Borinschi on 19.12.2022.
//

import Foundation
import SwiftUI

public struct DSHeightModifier: ViewModifier {
    
    let height: DSDimension
    @Environment(\.appearance) var appearance: DSAppearance
    
    public func body(content: Content) -> some View {
        content.frame(height: height.value(appearance: appearance))
    }
}

public extension View {
    func dsHeight(_ height: DSDimension) -> some View {
        self.modifier(DSHeightModifier(height: height))
    }
}

struct DSHeightModifier_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { DSPreview {
                
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
