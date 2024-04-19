//
//  ItemDetails1.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct ItemDetails1: View {
    
    @Environment(\.dismiss) var dismiss
    let viewModel = ItemDetails1Model()
    
    var body: some View {
        ScrollView {
            DSVStack(spacing: .medium) {
                
                DSCoverFlow(height: 250, data: viewModel.imageGallery, id: \.self) { imageUrl in
                    DSImageView(url: imageUrl).dsCornerRadius()
                }
                
                DSVStack(spacing: .zero) {
                    DSText(viewModel.title).dsTextStyle(.title2)
                    DSText(viewModel.subtitle).dsTextStyle(.subheadline)
                }
                
                DSPriceView(price: viewModel.price, size: .headline)
                
                DSQuantityPicker()
                
                DSHStack {
                    SelectView(title: "Size", selection: "US 14").onTap { }
                    SelectColorView(title: "Color", selection: .yellow, label: "Yellow").onTap { }
                }
                
                DSText(viewModel.description).dsTextStyle(.caption1)
            }
        }
        .safeAreaInset(edge: .bottom) {
            DSBottomContainer {
                DSButton(title: "Add to cart", rightSystemName: "cart.fill") {
                    dismiss()
                }
                DSText(viewModel.priceDisclaimer, multilineTextAlignment: .center)
                    .dsTextStyle(.caption2)
                    .dsPadding(.horizontal)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                DSToolbarSFSymbolButton(name: "square.and.arrow.up.fill").onTap { dismiss() }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                DSToolbarSFSymbolButton(name: "heart").onTap { dismiss() }
            }
        }.dsScreen()
    }
}

extension ItemDetails1 {
    
    // MARK: - Select View
    
    struct SelectView: View {
        let title: String
        let selection: String
        var body: some View {
            DSHStack {
                DSText(title).dsTextStyle(.smallHeadline)
                Spacer()
                DSText(selection).dsTextStyle(.smallSubtitle)
                DSChevronView()
            }
            .dsHeight(.actionElement)
            .dsPadding(.horizontal)
            .dsSecondaryBackground()
            .dsCornerRadius()
        }
    }
    
    struct SelectColorView: View {
        let title: String
        let selection: Color
        let label: String
        var body: some View {
            DSHStack {
                DSText(title).dsTextStyle(.smallHeadline)
                Spacer()
                DSText(label).dsTextStyle(.smallSubtitle)
                selection
                    .dsSize(20)
                    .dsCornerRadius()
                DSChevronView()
            }
            .dsHeight(.actionElement)
            .dsPadding(.horizontal)
            .dsSecondaryBackground()
            .dsCornerRadius()
        }
    }
}

// MARK: - Model

final class ItemDetails1Model: ObservableObject {
    let imageGallery = [p3Image, p1Image, p2Image]
    let price = DSPrice(amount: "200.0", regularAmount: "200", currency: "$", discountBadge: "80$ OFF")
    let title = "Women's Running Shoe"
    let subtitle = "Nike Revolution 5"
    let description = "The Nike Revolution 5 cushions your stride with soft foam to keep you running in comfort. Lightweight knit material wraps your foot in breathable support, while a minimalist design fits in anywhere your day takes you."
    let priceDisclaimer = "The price listed here is subject to change. The final amount will be displayed on the checkout screen."
}

// MARK: - Testable

struct Testable_ItemDetails1: View {
    var body: some View {
        NavigationView {
            ItemDetails1()
                .navigationTitle("Product Details")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview

struct ItemDetails1_Previews: PreviewProvider {
    
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_ItemDetails1() }
    }
}

// MARK: - Image Links

fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?cs=srgb&dl=pexels-melvin-buezo-2529148.jpg&fm=jpg")
fileprivate let p2Image = URL(string: "https://images.pexels.com/photos/3261069/pexels-photo-3261069.jpeg?cs=srgb&dl=pexels-wallace-chuck-3261069.jpg&fm=jpg")
fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/5710082/pexels-photo-5710082.jpeg?cs=srgb&dl=pexels-ox-street-5710082.jpg&fm=jpg")
