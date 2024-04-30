//
//  DSQuantityPicker.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 29.02.2023.
//

import SwiftUI

/*
## DSQuantityPicker

`DSQuantityPicker` is a SwiftUI component within the DSKit framework designed for interactive quantity selection in user interfaces, typically used in e-commerce applications or any setting where users need to specify a number of items.

#### Initialization:
Initializes a `DSQuantityPicker` with an optional initial quantity.
- Parameters:
- `quantity`: The initial quantity, defaulting to 1 if not specified.

#### Interaction:
- The decrement button is only active when the quantity is greater than 1, visually indicated by reduced saturation and opacity.
- Both increment and decrement buttons utilize haptic feedback to enhance the tactile response of the interface.

#### Usage:
`DSQuantityPicker` can be easily integrated into shopping carts, booking forms, or any interface where item count adjustments are necessary.

*/

public struct DSQuantityPicker: View {
    
    @State var quantity: Int
    
    public init(quantity: Int = 1) {
        self.quantity = quantity
    }
    
    public var body: some View {
        
        DSHStack(spacing: .zero) {
            
            DSText("Quantity").dsTextStyle(.smallHeadline)
            
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
                DSText("\(quantity)").dsTextStyle(.body).dsWidth(25)
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

struct Testable_DSQuantityPicker: View {
    var body: some View {
        DSQuantityPicker()
    }
}

struct DSQuantityPicker_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance {
            DSPreview {
                Testable_DSQuantityPicker()
            }
        }
    }
}

