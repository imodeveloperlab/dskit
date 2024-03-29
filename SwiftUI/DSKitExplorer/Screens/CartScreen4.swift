//
//  CartScreen4.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct CartScreen4: View {
    
    @Environment(\.dismiss) var dismiss
    let model = CartScreen4Model()
    
    var body: some View {
        ScrollView {
            DSVStack {
                ForEach(model.products) { product in
                    ProductView(product: product)
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            DSBottomContainer {
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

extension CartScreen4 {
    
    // MARK: - Product View
    
    struct ProductView: View {
        let product: Product
        var body: some View {
            DSVStack {
                DSHStack(alignment: .center, spacing: .regular) {
                    Group {
                        DSImageView(url: product.image, size: .size(width: 100, height: 100))
                            .overlay(alignment: .bottomLeading) {
                                if let tag = product.tag {
                                    DSText(tag, .headlineWithSize(9))
                                        .dsPadding(.smaller)
                                        .dsBackground()
                                        .dsCornerRadius()
                                        .dsPadding(.smaller)
                                }
                            }
                    }.dsCornerRadius()
                    
                    DSVStack(alignment: .leading) {
                        DSText(product.title, .smallTitle)
                        DSHStack {
                            DSText("Color:", .subheadline)
                            product.color.dsSize(.smallIcon).dsCornerRadius()
                            DSText("Size:", .subheadline)
                            DSText(product.size, .smallTitle)
                        }
                        DSPriceView(price: product.price, size: .regular)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    DSSFSymbolButton(name: "minus.circle", size: .mediumIcon)
                        .dsPadding(.trailing, .small)
                }
            }
            .dsPadding(.small)
            .dsSecondaryBackground()
            .dsCornerRadius()
            .onTap { }
        }
        
        struct Product: Identifiable {
            let id = UUID()
            let title: String
            let color: Color
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
}

// MARK: - Model

final class CartScreen4Model: ObservableObject {
    
    let products: [CartScreen4.ProductView.Product] = [
        .init(
            title: "Armani Blouse",
            color: Color.green,
            size: "M",
            tag: "50%",
            price: DSPrice(amount: "250", regularAmount: "270", currency: "$", discountBadge: "-20$"),
            rating: 4,
            image: p1Image
        ),
        .init(
            title: "Dolce & Gabbana Dress",
            color: Color.red,
            size: "L",
            tag: "SALES",
            price: DSPrice(amount: "99", currency: "$"),
            rating: 4.5,
            image: p2Image
        ),
        .init(
            title: "Zara Blouse",
            color: Color.yellow,
            size: "M",
            price: DSPrice(amount: "200", currency: "$"),
            rating: 5,
            image: p3Image
        ),
        .init(
            title: "Dolce & Gabbana Dress",
            color: Color.yellow,
            size: "L",
            price: DSPrice(amount: "500", regularAmount: "600", currency: "$", discountBadge: "-100$"),
            rating: 2.5,
            image: p4Image
        )
    ]
}

// MARK: - Preview

struct CartScreen4_Previews: PreviewProvider {
    
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                CartScreen4()
                    .navigationTitle("Cart")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/6347619/pexels-photo-6347619.jpeg?cs=srgb&dl=pexels-liza-summer-6347619.jpg&fm=jpg")

fileprivate let p2Image = URL(string: "https://images.pexels.com/photos/3791648/pexels-photo-3791648.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-3791648.jpg&fm=jpg")

fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/5255268/pexels-photo-5255268.jpeg?cs=srgb&dl=pexels-samson-katt-5255268.jpg&fm=jpg")

fileprivate let p4Image = URL(string: "https://images.pexels.com/photos/5875215/pexels-photo-5875215.jpeg?cs=srgb&dl=pexels-jonathan-borba-5875215.jpg&fm=jpg")
