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
            DSButton(title: "Continue Shopping", rightSystemName: "bag.fill", action: { dismiss() })
        }
        .overlay(alignment: .center, content: {
            DSVStack(alignment: .center) {
                Spacer()
                DSImageView(systemName: "checkmark.circle.fill", size: 70, tint: .color(.green))
                    .dsPadding(.bottom, 30)
                DSText("It's Ordered").dsTextStyle(.largeHeadline)
                DSText("Hi John - thanks for your order,\nwe hope you enjoyed shopping\nwith us", multilineTextAlignment: .center)
                    .dsTextStyle(.subheadline)
                Spacer()
                Spacer()
            }
        })
        .dsScreen()
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
