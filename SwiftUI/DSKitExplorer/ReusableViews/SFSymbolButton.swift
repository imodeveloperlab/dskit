//
//  SFSymbolButton.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 13.03.2023.
//

import SwiftUI
import DSKit

struct SFSymbolButton: View, DSDesignable {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.colorGroup) var colorGroup: DSColorGroup
    
    let name: String
    let size: DSSize
    var body: some View {
        DSImageView(
            sfSymbol: name,
            size: size,
            tint: .custom(viewColors.button.background)
        )
    }
}
