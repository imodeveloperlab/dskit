//
//  CartScreen1.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct CartScreen1: View {
    
    @Environment(\.dismiss) var dismiss
    let viewModel = CartScreen1Model()
    
    var body: some View {
        ScrollView {
            DSVStack {
                ForEach(viewModel.products) { product in
                    ProductView(product: product)
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            DSBottomContainer {
                TotalView(itemsCount: "4", price: DSPrice(amount: "1049.00", currency: "$"))
                DSButton(title: "Continue to payment", rightSystemName: "arrow.right") {
                    dismiss()
                }
                DSTermsAndConditions(message: "By pressing on Continue you agree to our")
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                DSToolbarSFSymbolButton(name: "square.and.arrow.up.fill")
                    .onTap { dismiss() }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                DSToolbarSFSymbolButton(name: "trash.fill")
                    .onTap { dismiss() }
            }
        }.dsScreen()
    }
}

extension CartScreen1 {
    
    // MARK: - Product View
    
    struct ProductView: View {
        let product: Product
        var body: some View {
            DSHStack(alignment: .center, spacing: .medium) {
                
                DSImageView(url: product.image, size: .size(width: 80, height: 100))
                    .dsCornerRadius()
                
                DSVStack(spacing: .small) {
                    DSText(product.title).dsTextStyle(.smallHeadline)
                    DSText(product.description).dsTextStyle(.smallSubtitle)
                    DSRatingView(rating: product.rating, size: 10)
                    DSPriceView(price: product.price, size: .smallHeadline).dsPadding(.top, .regular)
                }.frame(maxWidth: .infinity, alignment: .leading)
    
                
                DSSFSymbolButton(name: "pencil.circle.fill", size: .mediumIcon)
                    .dsPadding(.trailing, .regular)
            
            }
            .dsPadding(.regular)
            .dsSecondaryBackground()
            .dsCornerRadius()
        }
        
        struct Product: Identifiable {
            let id = UUID()
            let title: String
            let description: String
            let price: DSPrice
            let rating: Float
            let image: URL?
        }
    }
    
    // MARK: - Total View
    
    struct TotalView: View {
        let itemsCount: String
        let price: DSPrice
        var body: some View {
            DSHStack() {
                DSText("Total").dsTextStyle(.headline)
                Spacer()
                DSHStack(alignment: .firstTextBaseline, spacing: .small) {
                    DSText("for").dsTextStyle(.subheadline)
                    DSText(itemsCount).dsTextStyle(.smallHeadline)
                    DSText("items").dsTextStyle(.subheadline)
                    DSPriceView(price: price, size: .headline)
                }
            }
        }
    }
}

// MARK: - Model

final class CartScreen1Model: ObservableObject {
    
    let products: [CartScreen1.ProductView.Product] = [
        .init(
            title: "Beats Solo Pro",
            description: "Active Noise Cancelling (ANC)",
            price: DSPrice(amount: "250", regularAmount: "270", currency: "$", discountBadge: "-20$"),
            rating: 4,
            image: p1Image
        ),
        .init(
            title: "iPhone 8",
            description: "Apple Inc",
            price: DSPrice(amount: "99", regularAmount: "150", currency: "$", discountBadge: "-51$"),
            rating: 4.5,
            image: p2Image
        ),
        .init(
            title: "DJI Mavic pro Drone",
            description: "Mavic",
            price: DSPrice(amount: "200.00", currency: "$"),
            rating: 5,
            image: p3Image
        ),
        .init(
            title: "Macbook Air",
            description: "256GB Space Gray Apple Inc",
            price: DSPrice(amount: "500", regularAmount: "600", currency: "$", discountBadge: "-100$"),
            rating: 2.5,
            image: p4Image
        )
    ]
}

// MARK: - Testable

struct Testable_CartScreen1: View {
    var body: some View {
        NavigationView {
            CartScreen1()
                .navigationTitle("My Cart")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview

struct CartScreen1_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_CartScreen1() }
    }
}

// MARK: - Image Links

fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/5081386/pexels-photo-5081386.jpeg?cs=srgb&dl=pexels-cottonbro-5081386.jpg&fm=jpg")
fileprivate let p2Image = URL(string: "https://images.pexels.com/photos/2207799/pexels-photo-2207799.jpeg?cs=srgb&dl=pexels-gije-cho-2207799.jpg&fm=jpg")
fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/3945671/pexels-photo-3945671.jpeg?cs=srgb&dl=pexels-cottonbro-3945671.jpg&fm=jpg")
fileprivate let p4Image = URL(string: "https://images.pexels.com/photos/4498450/pexels-photo-4498450.jpeg?cs=srgb&dl=pexels-karolina-grabowska-4498450.jpg&fm=jpg")
