//
//  QuantityPicker.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 29.02.2023.
//

import SwiftUI
import DSKit

struct QuantityPicker: View {
    
    @State var quantity: Int = 1
    
    var body: some View {
        
        DSHStack(spacing: .zero) {

            DSText("Quantity", .smallTitle)

            Spacer()
            
            DSHStack(alignment: .center, spacing: .small) {

                SFSymbolButton(name: "minus", size: .smallIcon)
                    .saturation(quantity > 1 ? 1 : 0)
                    .opacity(quantity > 1 ? 1 : 0.2)
                    .dsPadding(.horizontal, .small)
                    .onTap {
                        if quantity > 1 {
                            quantity = quantity - 1
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        }
                    }
                DSDivider()
                DSText("\(quantity)", .body).dsWidth(25)
                DSDivider()
                SFSymbolButton(name: "plus", size: .smallIcon)
                    .dsPadding(.horizontal, .small)
                    .onTap {
                        quantity = quantity + 1
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
            }
            .dsHeight(20)
            .dsPadding(.small)
            .dsSecondaryBackground()
            .dsCornerRadius()
        }
    }
}

struct QuantityPicker_Previews: PreviewProvider {
    static var previews: some View {
        DSVStack {
            QuantityPicker()
        }
        .dsPadding()
    }
}
