//
//  ChevronView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 04.03.2023.
//

import DSKit
import SwiftUI

struct ChevronView: View {
    var body: some View {
        DSImageView(sfSymbol: "chevron.right", size: .unspecified, tint: .text(.headline))
            .dsHeight(.regular)
            .opacity(0.5)
    }
}

struct ChevronView_Previews: PreviewProvider {
    static var previews: some View {
        DSVStack {
            ChevronView()
        }
        .dsPadding()
    }
}
