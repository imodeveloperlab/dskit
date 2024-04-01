//
//  DSQuantityPicker.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 29.02.2023.
//

import SwiftUI

public struct DSQuantityPicker: View {
    
    @State var quantity: Int
    
    public init(quantity: Int = 1) {
        self.quantity = quantity
    }
    
    public var body: some View {
        
        DSHStack(spacing: .zero) {

            DSText("Quantity", .smallHeadline)

            Spacer()
            
            DSHStack(alignment: .center, spacing: .regular) {

                DSSFSymbolButton(name: "minus", size: .smallIcon)
                    .saturation(quantity > 1 ? 1 : 0)
                    .opacity(quantity > 1 ? 1 : 0.2)
                    .dsPadding(.horizontal, .regular)
                    .onTap {
                        if quantity > 1 {
                            quantity = quantity - 1
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        }
                    }
                DSDivider()
                DSText("\(quantity)", .body).dsWidth(25)
                DSDivider()
                DSSFSymbolButton(name: "plus", size: .smallIcon)
                    .dsPadding(.horizontal, .regular)
                    .onTap {
                        quantity = quantity + 1
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    }
            }
            .dsHeight(20)
            .dsPadding(.regular)
            .dsSecondaryBackground()
            .dsCornerRadius()
        }
    }
}

struct QuantityPicker_Previews: PreviewProvider {
    static var previews: some View {
        DSVStack {
            DSQuantityPicker()
        }
        .dsPadding()
    }
}
