//
//  ToolbarButtonView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 13.03.2023.
//

import SwiftUI

public struct DSToolbarSFSymbolButton: View, DSDesignable {
    
    @Environment(\.appearance) public var appearance: DSAppearance
    @Environment(\.viewStyle) public var viewStyle: DSViewStyle
    
    let name: String
    
    public init(name: String) {
        self.name = name
    }
    
    public var body: some View {
        DSImageView(
            systemName: name,
            size: .mediumIcon,
            tint: .navBar(.button)
        )
    }
}
