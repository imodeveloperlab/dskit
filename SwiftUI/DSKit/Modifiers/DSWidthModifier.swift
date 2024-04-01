//
//  DSWidthModifier.swift
//  DSKit
//
//  Created by Ivan Borinschi on 19.12.2022.
//

import Foundation
import SwiftUI

public struct DSWidthModifier: ViewModifier {
    
    let width: DSDimension
    @Environment(\.appearance) var appearance: DSAppearance
    
    public func body(content: Content) -> some View {
        content.frame(width: appearance.dimension.value(for: width))
    }
}

public extension View {
    func dsWidth(_ width: DSDimension) -> some View {
        self.modifier(DSWidthModifier(width: width))
    }
}

struct DSWidthModifier_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach { DSPreview {
                Color.blue
                    .dsWidth(.medium)
                
                Color.blue
                    .dsWidth(.large)
                
                Color.blue
                    .dsWidth(100)
                
                Color.blue
                    .dsWidth(1.5)
                
                Color.blue
                    .dsWidth(2.5)
                
            }.dsLayoutDebug()
        }
    }
}
