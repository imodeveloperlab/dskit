//
//  CartScreen2.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct CartScreen2: View {
    
    @Environment(\.dismiss) var dismiss
    let viewModel = CartScreen2Model()
    
    var body: some View {
        ScrollView {
            DSVStack() {
                ForEach(viewModel.products) { product in
                    ProductView(product: product)
                }
            }
        }.safeAreaInset(edge: .bottom) {
            BottomContainerView {
                TotalView(itemsCount: "2", price: DSPrice(amount: "349.00", currency: "$"))
                DSButton(title: "Continue") {
                    dismiss()
                }
                PoweredByDSKitView()
            }
        }
        .dsScreen()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                ToolbarSFSymbolButton(name: "square.and.arrow.up.fill").onTap { dismiss() }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                ToolbarSFSymbolButton(name: "trash.fill").onTap { dismiss() }
            }
        }
    }
}

extension CartScreen2 {
    
    // MARK: - Product View
    
    struct ProductView: View {
        let product: Product
        var body: some View {
            DSVStack(spacing: .zero) {
                DSImageView(url: product.image, size: .size(width: .none, height: 180))
                DSVStack {
                    DSText(product.title, .headline)
                    DSHStack() {
                        DSText(product.description, .smallSubtitle)
                        RatingView(rating: product.rating, size: 13)
                    }
                    DSPriceView(price: product.price, size: .regular)
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(alignment: .bottomTrailing, content: {
                        DSButton(
                            title: "Remove",
                            rightImage: DSImage(sfSymbolName: "trash", size: .smallIcon),
                            style: .clear,
                            maxWidth: false,
                            action: { }
                        ).dsHeight(.medium)
                    })
                    .frame(maxWidth: .infinity)
                    .dsPadding()
            }
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
                DSText("Total",.headline)
                Spacer()
                DSHStack(alignment: .firstTextBaseline, spacing: .smaller) {
                    DSText("for",.subheadline)
                    DSText(itemsCount,.smallTitle)
                    DSText("items",.subheadline)
                    DSPriceView(price: price, size: .large)
                }
            }
        }
    }
}

// MARK: - Model

final class CartScreen2Model: ObservableObject {
    
    let products: [CartScreen2.ProductView.Product] = [
        .init(
            title: "Sony XDE F30 Camera",
            description: "Sony",
            price: DSPrice(amount: "250", regularAmount: "270", currency: "$", discountBadge: "-20$"),
            rating: 4,
            image: p1Image
        ),
        .init(
            title: "Cannon Camera",
            description: "Cannon",
            price: DSPrice(amount: "99", regularAmount: "150", currency: "$", discountBadge: "-51$"),
            rating: 4.5,
            image: p2Image
        )
    ]
}

struct CartScreen2_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                CartScreen2()
                    .navigationTitle("My Cart")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

// MARK: - Image Links

fileprivate let p1Image = URL(string: "https://images.unsplash.com/photo-1568605560195-9f979ffc11ce?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80")

fileprivate let p2Image = URL(string: "https://images.unsplash.com/photo-1536627217140-899b0bc9d881?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2110&q=80")
