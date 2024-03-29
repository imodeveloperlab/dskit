//
//  CartScreen5.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct CartScreen5: View {
    
    @Environment(\.dismiss) var dismiss
    let viewModel = CartScreen5Model()
    
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
                DSText("You may also like", .smallSubtitle)
                DSHScroll(data: viewModel.suggestedProducts, id: \.id) { product in
                    SuggestedProductView(product: product)
                }
                TotalView(itemsCount: "4", price: DSPrice(amount: "1049.00", currency: "$"))
                DSButton(title: "Checkout", rightImage: DSImage(sfSymbolName: "creditcard", size: .medium)) {
                    dismiss()
                }
                DSTermsAndConditions(message: "By pressing on Checkout you agree to our")
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                DSToolbarSFSymbolButton(name: "trash.fill").onTap { dismiss() }
            }
        }.dsScreen()
    }
}

extension CartScreen5 {
    
    // MARK: - Product View
    
    struct ProductView: View {
        let product: Product
        var body: some View {
            DSHStack(alignment: .center, spacing: .regular) {
                Group {
                    DSImageView(url: product.image, size: .size(width: 80, height: 100))
                        .overlay(alignment: .bottomLeading) {
                            if let tag = product.tag {
                                TagView(tag: tag)
                            }
                        }
                }.dsCornerRadius()
                
                DSVStack(alignment: .leading, spacing: .smaller) {
                    DSText(product.title, .smallTitle)
                    DSHStack {
                        DSText("Color:", .smallSubtitle)
                        DSText(product.color, .smallTitle)
                        DSText("Size:", .smallSubtitle)
                        DSText(product.size, .smallTitle)
                    }
                    DSHStack {
                        DSImageView(sfSymbol: "star.fill", size: .smallIcon, tint: .customColor(Color.yellow))
                        DSText("3k Reviews", .caption1)
                    }
                    DSPriceView(price: product.price, size: .regular)
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                DSSFSymbolButton(name: "minus.circle", size: .mediumIcon)
                    .dsPadding(.trailing, .small)
            }
            .dsPadding(.small)
            .dsSecondaryBackground()
            .dsCornerRadius()
            .onTap { }
        }
        
        struct Product: Identifiable {
            let id = UUID()
            let title: String
            let color: String
            let size: String
            var tag: String?
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
    
    // MARK: - Total View
    
    struct TagView: View {
        let tag: String
        var body: some View {
            DSText(tag, .headlineWithSize(9))
                .dsPadding(.horizontal, .small)
                .dsPadding(.vertical, .smaller)
                .dsBackground()
                .dsCornerRadius()
                .dsPadding(.smaller)
        }
    }
    
    // MARK: - Suggested Product View
    
    struct SuggestedProductView: View {
        let product: Product
        var body: some View {
            DSHStack(alignment: .center) {
                DSImageView(url: product.image, size: .size(width: 60, height: 40))
                    .dsCornerRadius()
                DSVStack(alignment: .leading, spacing: .smaller) {
                    DSText(product.title, .smallTitle, multilineTextAlignment: .leading)
                    DSPriceView(price: product.price, size: .regular)
                }
            }
            .dsPadding(.small)
            .dsSecondaryBackground()
            .dsCornerRadius()
        }
        
        struct Product: Identifiable {
            let id = UUID()
            let title: String
            let price: DSPrice
            let image: URL?
        }
    }
}

// MARK: - Model

final class CartScreen5Model: ObservableObject {
    let products: [CartScreen5.ProductView.Product] = [
        .init(
            title: "Armani Blouse",
            color: "Brown",
            size: "M",
            price: DSPrice(amount: "250", regularAmount: "270", currency: "$", discountBadge: "-20$"),
            rating: 4,
            image: p1Image
        ),
        .init(
            title: "Dolce & Gabbana Dress",
            color: "Red",
            size: "L",
            tag: "SALES",
            price: DSPrice(amount: "99", currency: "$"),
            rating: 4.5,
            image: p2Image
        ),
        .init(
            title: "Dolce & Gabbana Dress",
            color: "Black",
            size: "L",
            tag: "50%",
            price: DSPrice(amount: "500", regularAmount: "600", currency: "$", discountBadge: "-100$"),
            rating: 2.5,
            image: p4Image
        )
    ]
    
    let suggestedProducts: [CartScreen5.SuggestedProductView.Product] = [
        .init(
            title: "New Balance",
            price: DSPrice(amount: "250", regularAmount: "290", currency: "$"),
            image: URL.sneakersWhiteOnYellowBg
        ),
        .init(
            title: "Big Pony Mesh",
            price: DSPrice(amount: "120", currency: "$"),
            image: URL.sneakersThreePairs
        ),
        .init(
            title: "Mesh Long-Sleev",
            price: DSPrice(amount: "145", currency: "$"),
            image: URL.sneakersOnWhiteBg
        )
    ]
}

// MARK: - Preview

struct CartScreen5_Previews: PreviewProvider {
    
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                CartScreen5()
                    .navigationTitle("Cart")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

// MARK: - Image Links

fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/3885502/pexels-photo-3885502.jpeg?cs=srgb&dl=pexels-gustavo-fring-3885502.jpg&fm=jpg")

fileprivate let p2Image = URL(string: "https://images.pexels.com/photos/374808/pexels-photo-374808.jpeg?cs=srgb&dl=pexels-burst-374808.jpg&fm=jpg")

fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/6140100/pexels-photo-6140100.jpeg?cs=srgb&dl=pexels-furkanfdemir-6140100.jpg&fm=jpg")

fileprivate let p4Image = URL(string: "https://images.pexels.com/photos/1895913/pexels-photo-1895913.png?cs=srgb&dl=pexels-keli-santos-1895913.jpg&fm=jpg")
