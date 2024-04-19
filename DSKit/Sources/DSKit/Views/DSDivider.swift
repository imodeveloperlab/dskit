//
//  DSDivider.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 04.03.2023.
//

import SwiftUI

public struct DSDivider: View, DSDesignable {
    
    public init() {}
    
    @Environment(\.appearance) public var appearance: DSAppearance
    @Environment(\.viewStyle) public var viewStyle: DSViewStyle

    public var body: some View {
        Divider().background(viewColors.separator.color)
            .frame(minWidth: 1, minHeight: 1)
    }
}

struct DSDivider_Previews: PreviewProvider {
    static var previews: some View {
        DSVStack {
            DSDivider()
        }.dsPadding()
    }
}
