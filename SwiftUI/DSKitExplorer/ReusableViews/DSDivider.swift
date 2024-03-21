//
//  DSDivider.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 04.03.2023.
//

import DSKit
import SwiftUI

struct DSDivider: View, DSDesignable {
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.colorGroup) var colorGroup: DSColorGroup
    var body: some View {
        Divider().background(viewColors.separator.color)
            .frame(height: 1)
    }
}

struct DSDivider_Previews: PreviewProvider {
    static var previews: some View {
        DSVStack {
            DSDivider()
        }
        .dsPadding()
    }
}
