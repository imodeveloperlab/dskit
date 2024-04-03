//
//  Order3.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Order3: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        DSVStack(alignment: .center) {
            Spacer()
            DSImageView(sfSymbol: "checkmark.circle.fill", size: 70, tint: .color(.green))
                .dsPadding(.bottom, 30)
            DSText("It's Ordered", .largeHeadline)
            DSText("Hi John - thanks for your order,\nwe hope you enjoyed shopping\nwith us", .subheadline, multilineTextAlignment: .center)
            Spacer()
            Spacer()
            Spacer()
            DSButton(title: "Continue Shopping", rightSFSymbolName: "bag.fill", action: { dismiss() })
        }.dsScreen()
    }
}

// MARK: - Testable

struct Testable_Order3: View {
    var body: some View {
        Order3()
    }
}

// MARK: - Preview

struct Order3_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_Order3() }
    }
}
