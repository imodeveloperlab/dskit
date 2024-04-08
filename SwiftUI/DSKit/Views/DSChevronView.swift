//
//  DSChevronView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 04.03.2023.
//

import SwiftUI

public struct DSChevronView: View {
    
    public init() { }

    public var body: some View {
        DSImageView(systemName: "chevron.right", size: .unspecified, tint: .secondaryView(.text(.font(.headline))))
            .dsHeight(14)
            .opacity(0.5)
    }
}

struct ChevronView_Previews: PreviewProvider {
    static var previews: some View {
        DSVStack {
            DSChevronView()
        }.dsPadding()
    }
}
