//
//  Order3.swift
//  DSKitCore
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
            DSImageView(sfSymbol: "checkmark.circle.fill", size: 70, tint: .customColor(.green))
                .dsPadding(.bottom, 30)
            DSText("It's Ordered", .bigTitle)
            DSText("Hi John - thanks for your order,\nwe hope you enjoyed shopping\nwith us", .subheadline, multilineTextAlignment: .center)
            Spacer()
            Spacer()
            Spacer()
            DSButton(title: "Continue Shopping", rightSFSymbolName: "bag.fill", action: { dismiss() })
        }
        .dsBackground()
    }
}

struct Order3_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach {
            Order3()
        }
    }
}
