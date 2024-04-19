//
//  CartScreen3.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct CartScreen3: View {
    
    @Environment(\.dismiss) var dismiss
    let viewModel = CartScreen3Model()
    
    var body: some View {
        ScrollView {
            DSVStack() {
                ForEach(viewModel.products) { product in
                    ProductView(product: product)
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            DSBottomContainer {
                TotalView(itemsCount: "4", price: DSPrice(amount: "1049.00", currency: "$"))
                DSButton(title: "Continue") {
                    dismiss()
                }
                DSTermsAndConditions(message: "By pressing on Continue you agree to our")
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                DSToolbarSFSymbolButton(name: "trash.fill").onTap { dismiss() }
            }
        }.dsScreen()
    }
}

extension CartScreen3 {
    
    // MARK: - Product View
    
    struct ProductView: View {
        let product: Product
        var body: some View {
            DSHStack(alignment: .center, spacing: .medium) {
                DSImageView(url: product.image, size: .size(width: 90, height: 100))
                    .dsCornerRadius()
                DSVStack(alignment: .leading) {
                    DSText(product.title).dsTextStyle(.smallHeadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    DSText(product.description).dsTextStyle(.caption2)
                    DSPriceView(price: product.price, size: .smallHeadline)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                DSSFSymbolButton(name: "minus.circle.fill", size: .mediumIcon)
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

final class CartScreen3Model: ObservableObject {
    
    let products: [CartScreen3.ProductView.Product] = [
        .init(
            title: "iMac 2020",
            description: "27-inch 5K Retina display, 10th-gen Intel processors, 128GB RAM",
            price: DSPrice(amount: "250", regularAmount: "270", currency: "$", discountBadge: "-20$"),
            rating: 4,
            image: p1Image
        ),
        .init(
            title: "iPad",
            description: "Retina display, A12 chip, up to 128GB storage, 8MP back camera",
            price: DSPrice(amount: "99", currency: "$"),
            rating: 4.5,
            image: p2Image
        ),
        .init(
            title: "Magic keyboard",
            description: "Magic Keyboard: Slim design, responsive keys, built-in rechargeable battery.",
            price: DSPrice(amount: "200", currency: "$"),
            rating: 5,
            image: p3Image
        ),
        .init(
            title: "Apple watch",
            description: "Apple Watch Series 6: 44mm/40mm case, Always-On Retina, S6 chip, Blood Oxygen",
            price: DSPrice(amount: "500", regularAmount: "600", currency: "$", discountBadge: "-100$"),
            rating: 2.5,
            image: p4Image
        )
    ]
}

// MARK: - Testable

struct Testable_CartScreen3: View {
    var body: some View {
        NavigationView {
            CartScreen3()
                .navigationTitle("My Cart")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview

struct CartScreen3_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_CartScreen3() }
    }
}

// MARK: - Image Links

fileprivate let p1Image = URL(string: "https://images.unsplash.com/photo-1494173853739-c21f58b16055?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1301&q=80")
fileprivate let p2Image = URL(string: "https://images.unsplash.com/photo-1584695369221-3d8a8ebfeef0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2378&q=80")

fileprivate let p3Image = URL(string: "https://images.unsplash.com/photo-1562075950-23ba332df71c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80")
fileprivate let p4Image = URL(string: "https://images.unsplash.com/photo-1434493789847-2f02dc6ca35d?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1951&q=80")

