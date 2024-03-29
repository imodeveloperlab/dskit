//
//  ToolbarButtonView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 13.03.2023.
//

import SwiftUI

public struct DSToolbarSFSymbolButton: View, DSDesignable {
    
    @Environment(\.appearance) public var appearance: DSAppearance
    @Environment(\.colorGroup) public var colorGroup: DSColorGroup
    
    let name: String
    
    public init(name: String) {
        self.name = name
    }
    
    public var body: some View {
        DSImageView(
            sfSymbol: name,
            size: .mediumIcon,
            tint: .custom(navigationBarColors.buttons)
        )
    }
}
