//
//  ToolbarButtonView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 13.03.2023.
//

import SwiftUI
import DSKit

struct ToolbarSFSymbolButton: View, DSDesignable {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.colorGroup) var colorGroup: DSColorGroup
    
    let name: String
    var body: some View {
        DSImageView(
            sfSymbol: name,
            size: .mediumIcon,
            tint: .custom(navigationBarColors.buttons)
        )
    }
}
