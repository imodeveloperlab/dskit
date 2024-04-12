//
//  DSSFSymbolButton.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 13.03.2023.
//

import SwiftUI

public struct DSSFSymbolButton: View, DSDesignable {
    
    @Environment(\.appearance) public var appearance: DSAppearance
    @Environment(\.viewStyle) public var viewStyle: DSViewStyle
    
    let name: String
    let size: DSSize
    
    public init(name: String, size: DSSize) {
        self.name = name
        self.size = size
    }
    
    public var body: some View {
        DSImageView(
            systemName: name,
            size: size,
            tint: .viewStyle(viewStyle, .button(.accentColor))
        )
    }
}
